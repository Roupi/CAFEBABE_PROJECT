package com.cafebabe.core;

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



import com.sun.org.apache.bcel.internal.classfile.Field;
import exceptions.ClassNotFoundException;
import exceptions.MethodNotFoundException;
import exceptions.NoMainMethodException;
import org.apache.bcel.classfile.ClassFormatException;
import org.apache.bcel.classfile.ClassParser;
import org.apache.bcel.classfile.JavaClass;
import org.apache.bcel.classfile.Method;
import org.apache.bcel.generic.Instruction;
import org.apache.bcel.generic.InstructionHandle;
import org.apache.bcel.generic.InstructionList;
import org.jpl7.Atom;
import org.jpl7.Query;
import org.jpl7.Term;
import org.jpl7.Variable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static com.cafebabe.core.Consts.HI;
import static com.cafebabe.core.Consts.HO;
import static com.cafebabe.core.Consts.REGEX_NEW;
import static com.cafebabe.core.instructions.InstructionTools.translateArgs;


/**
 * CafeBabe contains the main method, this class essentially take a .jar from a given location and extract all the .class in this .jar file
 * to get an object representation of those .class files. This class is the starting point of the complete translation workflow.
 *
 * @author Laffineur Gerome
 */

public class CafeBabe {
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.CafeBabe.";
    /**
     * Structure that contains multiples classes and methods information used in translation process.
     */
    public static JarInfo jarInfo;
    public static int objectNumber = 0;
    public static boolean optimise = false;
    public static Set<String> externalCalls = new HashSet();
    public static String[] last_args = null;
    public static boolean clinits = false;

    /**
     * Starting point of the translation workflow. This method get the classes of specified .jar in input
     * and produce translations of .class of this jar in a .clp located in the directory specified as output.
     * Produce a file <i>jarname</i>_.clp that contain CLP clauses representation of the input .jar in the specified output directory.
     *
     * @param args args[0] must contain the path to the .jar to translate, args[1] must contain the path of the output directory.
     */
    public static void main(String[] args) throws NoMainMethodException, java.lang.ClassNotFoundException {
        if (args.length < 2) {
            System.out.println(Menu.displayHelp());
            System.exit(1);
        }

        Logger logger = LoggerFactory.getLogger(id + ".main");
        String out = "";//Contains CLP clauses obtained from translation of the .jar given in input

            List<JavaClass> classes = getClasses(args[0]);

            //Getting the name of the .jar..
            String pattern = ".*\\/(.*)\\.jar";
            Pattern r = Pattern.compile(pattern);
            Matcher m = r.matcher(args[0]);
            try {
                m.matches();
            } catch(IllegalStateException e){
                System.out.println(Menu.displayHelp());
                System.exit(1);
            }
            String jarName = m.group(1);
            //Getting the name of the .jar : OK

            //Writing clauses in the out String..
            Charset charset = Charset.forName("US-ASCII");
            Path file;
            jarInfo = new JarInfo(classes);
            //Initialization of the entryPoint
            String[] entryPoint = new String[4];
            int methodnumber = 0;
            for(String arg : args){
                //SELECTION OF ENTRY POINT
                if (arg.equals("-se")) { //Selection of the entry point by user
                    methodnumber = -1;
                }else if (arg.matches("(\\d*)")) { //Entry point number could be passed in arg (for automated test module)
                    methodnumber = Integer.parseInt(args[2]);
                } else {
                    methodnumber = 0;
                }
                //OPTIMISE OPTION
                if (arg.equals("-optimise")) {
                    optimise = true;
                }
            }
            entryPoint = new Menu(jarInfo).menuDisplay(methodnumber); //main method by default

            //System.out.println(jarInfo);
            out = out + printPStart(entryPoint);
            //Write default method for object class init (not included in jar)
            out = out + "p0_0_0(A,0,0,IHS,OHS,HI,HO,0) :- {OHS = IHS, unify(HI,HO)}.\n";
            //Write writeMemory and readMemory predicates (heap representation)
            out = out + "writeMemory(HI,HO,OBJECTREF,FIELD,VALUE) :- {}, select(object(OBJECTREF,FIELD,_),HI,HO1),writeMemory(HO1,HO,OBJECTREF,FIELD,VALUE).\n";
            out = out + "writeMemory(HI,[object(OBJECTREF,FIELD,VALUE)|HI],OBJECTREF,FIELD,VALUE).\n";
            out = out + "readMemory([object(OBJECTREF,FIELD,VALUE)|Hs],OBJECTREF,FIELD,VALUE) :- {}.\n";
            out = out + "readMemory([object(OBJECTREF1,FIELD1,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {OBJECTREF1\\=OBJECTREF, FIELD1\\=FIELD}, readMemory(HS,OBJECTREF,FIELD,VALUE).\n";
            out = out + "readMemory([object(OBJECTREF,FIELD1,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {FIELD1\\=FIELD}, readMemory(HS,OBJECTREF,FIELD,VALUE).\n";
            out = out + "readMemory([object(OBJECTREF1,FIELD,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {OBJECTREF1\\=OBJECTREF}, readMemory(HS,OBJECTREF,FIELD,VALUE).\n";
            out = out + "readMemory(_,_,_,0) :- {}.\n";
            //Old heap rep with asserts
            //out = out + "readMemory(OBJECTREF,FIELD,VALUE) :- {}, object(OBJECTREF,FIELD,VALUE).\n";
            //out = out + "readMemory(_,_,0) :- {}.\n";
            //out = out + "writeMemory(OBJECTREF,FIELD,VALUE) :- {}, retract(object(OBJECTREF,FIELD,X)), assert(object(OBJECTREF,FIELD,VALUE)).\n";
            //out = out + "writeMemory(OBJECTREF,FIELD,VALUE) :- {}, assert(object(OBJECTREF,FIELD,VALUE)).\n";
            for (JavaClass c : classes) {
                //summarize(c);
                out = out + hornify(c) + "\n";
                clinits = false;
            }
            //Write external calls if needed
            if(externalCalls.size()>0) out = out +"%EXTERNAL CALLS DEFINITIONS\n";
            for (String call : externalCalls){out = out+call;}
            externalCalls = new HashSet();

            //Writing clauses in the out String : OK

            //Creating .clp that contains the out String in the specified output directory..
            file = Paths.get(args[1] + jarName + ".clp");
            try (BufferedWriter writer = Files.newBufferedWriter(file, charset)) {
                writer.write(out);
            } catch (IOException x) {
                logger.debug(x.getMessage());
            }
            //Creating .clp that contains the out String in the specified output directory : OK
    }

    /**
     * Print a summary of the content of the specified class file. The summary contains the description of the constant pool,
     * and fields of the class file. The summary also represent the list of bytecode instruction for each method in the mnemonic
     * form.
     *
     * @param javaClass Object representation of a .class file (JavaClass)
     */
    private static void summarize(JavaClass javaClass) {
        System.out.println("//////////////////////////////");
        System.out.println("//////////////////////////////");
        System.out.println("////////////SUMMARY///////////");
        System.out.println("//////////////////////////////");
        System.out.println("//////////////////////////////");

        System.out.println("*******Constant Pool*********");
        System.out.println(javaClass.getConstantPool());

        System.out.println("*******Fields*********");
        System.out.println(Arrays.toString(javaClass.getFields()));
        System.out.println();

        System.out.println("*******Methods*********");
        System.out.println(Arrays.toString(javaClass.getMethods()));

        for (Method method : javaClass.getMethods()) {
            System.out.println();
            System.out.println("/////" + method + "/////");
            System.out.println(method.getCode());
            System.out.println();

        }
        System.out.println("//////////////////////////////");
        System.out.println("//////////////////////////////");
        System.out.println("//////////////////////////////");
        System.out.println("//////////////////////////////");
        System.out.println("//////////////////////////////");
    }

    /**
     * Return a List with representations of class files (JavaClass) contained in the jar specified as input.
     *
     * @param jarName Location of the jar file (must be the absolute reference to the .jar)
     * @return a List of JavaClass representations corresponding to .class files inside jarName.jar
     */
    public static List<JavaClass> getClasses(String jarName) {
        List<JavaClass> classFiles = new ArrayList<JavaClass>();
        JarFile jar = null;
        try {
            jar = new JarFile(jarName);
            Enumeration<JarEntry> entries = jar.entries();
            //Run through each .class of the jar to produce and add the correspondent representation in classFiles List..
            while (entries.hasMoreElements()) {
                JarEntry entry = entries.nextElement();
                if (!entry.getName().endsWith(".class")) {
                    continue;
                }

                ClassParser parser =
                        new ClassParser(jarName, entry.getName());
                JavaClass javaClass = parser.parse();
                classFiles.add(javaClass);
            }
            //Run through each .class of the jar to produce and add the correspondent representation in classFiles List : OK
        } catch (IOException e) {
            System.out.println(Menu.displayHelp());
            System.exit(1);
        } finally {
            if (jar != null) {
                try {
                    jar.close();
                } catch (IOException e) {
                    System.out.println(Menu.displayHelp());
                    System.exit(1);
                }
            }
        }
        return classFiles;
    }

    /**
     * Run through all methods of the class c to get a translation oh their instructions.
     *
     * @param c JavaClass representation of a .class
     * @return a String that contains CLP clauses representation of the input classfile.
     */
    private static String hornify(JavaClass c) {
        Logger logger = LoggerFactory.getLogger(id + ".hornify");
        String clauses = "%CLASSFILE:" + c.getClassName() + "\n"; //String that contains CLP clause representation of the classfile

        //Run through methods of the classfile to translate the list of instructions and add it to clauses String..
        for (Method m : c.getMethods()) {
            //logger.info("Translation of " + m.getName() + m.getSignature() + " in " + c.getClassName() + "..");
            if(m.getCode() != null) {
                InstructionList instList = new InstructionList(m.getCode().getCode());
                clauses = clauses + "%METHOD:" + m.getName() + m.getSignature() + "\n";
                clauses = clauses + com.cafebabe.core.instructions.InstructionTools.translateList(instList, m, c.getClassName());
                clauses = clauses + "%READ AND WRITE PREDICATES OF:" + m.getName() + m.getSignature() + "\n";
                //Add read and write predicates of the method..
                try {
                    int nreg = jarInfo.getMthdNbrReg(c.getClassName(), m.getName(), translateArgs(m.getArgumentTypes()));
                    for (int i = 0; i < nreg; i++) {
                        clauses = clauses + "read_" + jarInfo.getMthdIndex(c.getClassName(), m.getName(), translateArgs(m.getArgumentTypes())) + "(SP,";

                        for (int j = 0; j < nreg; j++) {
                            clauses = clauses + "IV" + j + ",";
                        }

                        clauses = clauses + "IV" + i + ") :- {SP = " + i + "}.\n";
                    }

                    for (int i = 0; i < nreg; i++) {
                        clauses = clauses + "write_" + jarInfo.getMthdIndex(c.getClassName(), m.getName(), translateArgs(m.getArgumentTypes())) + "(SP,";

                        for (int j = 0; j < nreg; j++) {
                            clauses = clauses + "IV" + j + ",";
                        }
                        for (int j = 0; j < nreg; j++) {
                            clauses = clauses + "W" + j + ",";
                        }

                        clauses = clauses + "VAL) :- {SP = " + i + ",";

                        for (int j = 0; j < nreg; j++) {
                            if (j == i) {
                                clauses = clauses + "W" + j + "=VAL";
                            } else {
                                clauses = clauses + "W" + j + "=IV" + j;
                            }
                            if (j != nreg - 1) {
                                clauses = clauses + ",";
                            }
                        }

                        clauses = clauses + "}.\n";

                    }
                } catch (Exception e) {
                    logger.info("Exception :" + e.toString());
                }
            } else {clauses = clauses + "%NO CODE FOR INTERFACE METHODS";}
            clauses = clauses + "%END OF METHOD:" + m.getName() + m.getSignature() + "\n";
            //Add read and write predicates of the method : OK
            logger.info("Translation of " + m.getName() + m.getSignature() + " :OK");
        }
            //Run through methods of the classfile to translate the list of instructions and add it to clauses String : OK
            return clauses;

    }

    /**
     * Look for the first clause of the main method and produce a pStart predicate that call this clause.
     * @return pStart predicate of the program.
     */
    private static String printPStart(String[] entryPoint) throws NoMainMethodException {
        Logger logger = LoggerFactory.getLogger(id + ".printPStart");
        String className = null;
        String s = "";
        try {
            s = s + "p_start(";
            for (String c : jarInfo.getClassSubClasses("java/lang/Object")) {

                if (jarInfo.containsMethod(c, entryPoint[2], entryPoint[3])) className = c;
            }

            boolean Static = jarInfo.getMthdStaticFlag(className,entryPoint[2],entryPoint[3]);

            if(!Static) {
                for (int i = 1; i < jarInfo.getMthdNbrArg(className, entryPoint[2], entryPoint[3]); i++) {
                    s = s + "IV" + i + ",";
                }
            }else{
                for (int i = 0; i < jarInfo.getMthdNbrArg(className, entryPoint[2], entryPoint[3]); i++) {
                    s = s + "IV" + i + ",";
                }
            }
            s = s + "R) :-\n";
            s = s + "         {IHS = 0, unify(HI,[])},\n         "+printClinits()+"p" +
                    jarInfo.getClassIndex(className) + "_" + jarInfo.getMthdIndex(className, entryPoint[2], entryPoint[3]) + "_0(";
            for (int i = 0; i < jarInfo.getMthdNbrReg(className, entryPoint[2], entryPoint[3]); i++) {
                s = s + "IV" + i + ",";
            }
            for (int i = 0; i < jarInfo.getMthdNbrReg(className, entryPoint[2], entryPoint[3]); i++) {
                s = s + "NV" + i + ",";
            }
            if(clinits) s = s + "SP_INDEX,IHS,OHS,HO,HI_NEW,R).\n";
                else s = s + "SP_INDEX,IHS,OHS,HI,HO,R).\n";

            //p_start used for testing purposes with final state of all registers
            s = s + "p_startD(";
            for (String c : jarInfo.getClassSubClasses("java/lang/Object")) {

                if (jarInfo.containsMethod(c, entryPoint[2], entryPoint[3])) className = c;
            }
            for (int i = 0; i < jarInfo.getMthdNbrArg(className, entryPoint[2], entryPoint[3]); i++) {
                s = s + "IV" + i + ",";
            }
            for (int i = 0; i < jarInfo.getMthdNbrLocalVar(className, entryPoint[2], entryPoint[3]); i++) {
                s = s + "NV" + i + ",";
            }

            s = s + "R) :-\n";
                s = s + "         {IHS = 0, unify(HI,[])},\n         "+printClinits()+"p" +
                        jarInfo.getClassIndex(className) + "_" + jarInfo.getMthdIndex(className, entryPoint[2], entryPoint[3]) + "_0(";
                for (int i = 0; i < jarInfo.getMthdNbrReg(className, entryPoint[2], entryPoint[3]); i++) {
                    s = s + "IV" + i + ",";
                }
                for (int i = 0; i < jarInfo.getMthdNbrReg(className, entryPoint[2], entryPoint[3]); i++) {
                    s = s + "NV" + i + ",";
                }
            if(clinits) s = s + "SP_INDEX,IHS,OHS,HO,HI_NEW,R).\n";
            else s = s + "SP_INDEX,IHS,OHS,HI,HO,R).\n";
            } catch(Exception e){
                logger.info("Exception :" + e.toString());
            }
            if (className == null) throw new NoMainMethodException("Entry point not found");



        return s;
    }

    private static String printClinits(){
        Logger logger = LoggerFactory.getLogger(id + ".printClinits");
        String s = "";
        int ncall = 0;

        int nbClinit = 0;
        for(String[] m :jarInfo.getAllMethInfos()) {
            if (m[2].equals("<clinit>")) {
                clinits = true;
                nbClinit++;
            }
        }
        String[] heapIN = new String[nbClinit];
        String[] heapOUT = new String[nbClinit];
        int nc = 0;
        if(nbClinit>0) {
            heapIN[0] = HI;
            heapOUT[0] = (nbClinit > 1) ? HI + 1 : "HO";
            for (int j = 1; j < nbClinit; j++) {
                heapIN[j] = HI + j;
                heapOUT[j] = (j < nbClinit - 1) ? HI + (j + 1) : "HO";
            }
        }



        try {
        for(String[] m :jarInfo.getAllMethInfos()) {
            if (m[2].equals("<clinit>")) {
                ncall++;
                s = s + "p" + jarInfo.getClassIndex(m[0])+"_"+jarInfo.getMthdIndex(m[0],m[2],m[3])+"_0(";
                for (int i = 0; i<jarInfo.getMthdNbrReg(m[0],m[2],m[3]); i++){
                    s = s + "_,";
                }
                for (int i = 0; i<jarInfo.getMthdNbrReg(m[0],m[2],m[3]); i++){
                    s = s + "_,";
                }
                s = s + "_,_,SP_INDEX_CALL"+ncall+","+heapIN[nc]+","+heapOUT[nc]+",_),\n         ";
                nc++;
            }

        }
        } catch (Exception e) {
                    e.printStackTrace();
                }
        return s;
    }
}
