package com.cafebabe.core;

import exceptions.AttributeNotFoundException;
import exceptions.ClassNotFoundException;
import exceptions.MethodNotFoundException;
import org.apache.bcel.classfile.JavaClass;
import org.apache.bcel.classfile.LocalVariable;
import org.apache.bcel.classfile.Method;
import org.apache.bcel.generic.InstructionHandle;
import org.apache.bcel.generic.InstructionList;
import org.apache.bcel.generic.Type;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.cafebabe.core.CafeBabe.jarInfo;
import static com.cafebabe.core.instructions.InstructionTools.translateArgs;

/**
 * JarInfo is the representation of the structure that contains the information about classes and methods
 * needed while translating bytecode into CLP clauses. This is essentially information about structure and ordering,
 * as an example we can find numbers of arguments for a method, method numbers, maximus stack size for a method, etc..
 *
 * @author Laffineur Gerome
 */
public class JarInfo {
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.JarInfo.";
    /**
     * List of ClassInfo representations about the class files contained in the .jar that the JarInfo object represent.
     */
    private List<ClassInfo> Jarclasses;

    /**
     * Construct a JarInfo object.
     * For each classe of the classes List, JarInfo will contain a ClassInfo representation in the JarClasses List.
     * @param classes list of class contained in the .jar we want to represented with a JarInfo object
     */
    public JarInfo(List<JavaClass> classes) throws java.lang.ClassNotFoundException {
        Jarclasses = new ArrayList<>();
        //Manually add information about Object class because it isn't referenced in the jar file..
        ClassInfo classeInfo = new ClassInfo("java/lang/Object",0);
        classeInfo.addMethod(new MethodInfo("<init>",0,1,0,0,null,null,"void","",0,false,false));
        Jarclasses.add(classeInfo);
        //Manually add information about Object class because it isn't referenced in the jar file : OK

        int j = 1;
        for (JavaClass c : classes) {
            classeInfo = new ClassInfo(c,j);
            //Adding attributes of the class..
            for (int i=0; i<c.getFields().length; i++) {
                String field = c.getFields()[i].toString();
                String pattern = ".*\\s(.*)";
                Pattern r = Pattern.compile(pattern);
                Matcher m = r.matcher(field);
                m.matches();
                classeInfo.addAttribute(m.group(1));
            }
            //Adding attributes of the class : OK

            //Adding attributes of the superclasses..

            //Adding attributes of the superclasses :OK


            //Adding methods of the class..
            int i = 0;
            int insNumber;
            int varNumber;
            Map instructionsPositions;
            Map localvarPositions;
            InstructionList instList;
            InstructionHandle[] instHandleList;
            //TODO : Resoudre le problème pour clinit et la localvariabletable
            for (Method m : c.getMethods()) {

                //Run through instructions to get positions and offsets..
                insNumber = 0;
                instructionsPositions = new HashMap();
                if(m.getCode() != null){ //Abstracts method have no code
                instList = new InstructionList(m.getCode().getCode());
                instHandleList = instList.getInstructionHandles();
                for (InstructionHandle ins : instHandleList) {
                    instructionsPositions.put(ins.getPosition(), insNumber);
                    insNumber++;
                    }
                }
                //Run through instructions to get positions and offsets : OK

                //Run through local var to get positions and offsets..

                List<Integer> indexes = new ArrayList<>();
                localvarPositions = new HashMap();

                if (m.getLocalVariableTable() != null) {


                    for (LocalVariable lv : m.getLocalVariableTable().getLocalVariableTable()) {
                        indexes.add(lv.getIndex());
                    }
                    Collections.sort(indexes);

                    varNumber = 0;
                    for (Integer index : indexes) {
                        localvarPositions.put(index, varNumber);
                        varNumber++;
                    }
                }
                //Run through local var to get positions and offsets : OK

                //Run through args types of the method..

                String argTypes = translateArgs(m.getArgumentTypes());

                //Run through args types of the method :OK
                classeInfo.addMethod(new MethodInfo(
                        m.getName(),
                        i,
                        (m.getLocalVariableTable() != null)?m.getLocalVariableTable().getTableLength()+m.getCode().getMaxStack():((m.getCode()!=null)?m.getCode().getMaxStack():0),
                        (m.getLocalVariableTable() != null)?m.getLocalVariableTable().getTableLength():-1,
                        m.getArgumentTypes().length,
                        instructionsPositions,
                        localvarPositions,
                        m.getReturnType().toString(),
                        argTypes,
                        (m.getLocalVariableTable() != null)?m.getLocalVariableTable().getTableLength()-1:-1,
                        m.isAbstract(),
                        m.isStatic()
                ));
                i++;
            }
            //Adding methods of the class : OK
            Jarclasses.add(classeInfo);
            j++;
        }
        //Adding attributes of the superclasses..
        for(ClassInfo c : Jarclasses){
            try {
                if (!c.getName().equals("java/lang/Object")){
                    ClassInfo sc = this.getClassInfo(c.getSuperClass());
                    while (sc.getSuperClass() != null){
                        Collections.reverse(c.getAttributes());
                        List<String> att2add = new ArrayList<>();
                        for (String att :sc.getAttributes()){
                                if (!c.getAttributes().contains(att)) {
                                    Collections.reverse(att2add);
                                    att2add.add(att);
                                    Collections.reverse(att2add);
                                }
                        }
                        c.getAttributes().addAll(att2add);
                        Collections.reverse(c.getAttributes());
                        sc = this.getClassInfo(sc.getSuperClass());
                    }

                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

        }
        //Adding attributes of the superclasses :OK
    }

    /**
     * Return the index of classname class in a String format.
     * @param className Name of the class
     * @return Index of className class in String format.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     */
    public String getClassIndex(String className) throws ClassNotFoundException {
        String s = null;
        Logger logger = LoggerFactory.getLogger(id + "getClassIndex");
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                s = String.valueOf(c.getIndex());
            }
        }
        //if (s == null) throw new ClassNotFoundException("Class not found");
        return s;
    }


    /**
     * Return the names of classes that implements interfaceName class in a String format.
     * @param interfaceName Name of the interface
     * @return names of classes that implements interfaceName class in a String format.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     */
    public List<String> getClassesThatImplements(String interfaceName)  {
        List<String> s = new ArrayList<>();
        Logger logger = LoggerFactory.getLogger(id + "getClassIndex");
        for (ClassInfo c : Jarclasses){
                for (String interf : c.getInterfaces()){
                    if (interf.equals(interfaceName)){
                        s.add(c.getName());
                    }
                }
        }

        return s;
    }

    /**
     * Return the ClassInfo representation of classname class in a String format.
     * @param className Name of the class
     * @return ClassInfo representation of className class in String format.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     */
    public ClassInfo getClassInfo(String className) throws ClassNotFoundException {
        ClassInfo s = null;
        Logger logger = LoggerFactory.getLogger(id + "getClassIndex");
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                s = c;
            }
        }
        if (s == null) throw new ClassNotFoundException("Class not found");
        return s;
    }

    /**
     * Return the methods names of classname class in a String format.
     * @param className Name of the class
     * @return methods names of classname class in a String format.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     */
    public List<String> getClassMethodsNames(String className) throws ClassNotFoundException {
        List<String> names = new ArrayList<>();
        boolean classFound = false;
        Logger logger = LoggerFactory.getLogger(id + "getClassMethodsNames");
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                classFound = true;
                for(MethodInfo m : c.getMethods()){
                    names.add(m.getName());
                }
            }
        }
        if (!classFound) throw new ClassNotFoundException("Class not found");
        return names;
    }

    /**
     * Return the superclass name of classname class in a String format.
     * @param className Name of the class
     * @return superclass of className class in String format.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     */
    public String getClassSuperClass(String className) throws ClassNotFoundException {
        String s = null;
        Logger logger = LoggerFactory.getLogger(id + "getClassIndex");
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                s = c.getSuperClass();
            }
        }
        return s;
    }

    /**
     * Return the direct subclasses name of classname class in a String format.
     * @param className Name of the class
     * @return List with direct subclasses of className class in String format.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     */
    public List<String> getClassDirectSubClasses(String className) throws ClassNotFoundException {
        List<String> directSubclasses = new ArrayList<>();
        Logger logger = LoggerFactory.getLogger(id + "getClassIndex");
        for (ClassInfo c : Jarclasses){
            if (c.getSuperClass() != null){
                if(c.getSuperClass().equals(className)){
                    directSubclasses.add(c.getName());
                }
            }
        }
        return directSubclasses;
    }

    /**
     * Return the subclasses name of classname class in a String format.
     * @param className Name of the class
     * @return List with subclasses of className class in String format.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     */
    public List<String> getClassSubClasses(String className) throws ClassNotFoundException {
        List<String> subclasses = new ArrayList<>();
        Logger logger = LoggerFactory.getLogger(id + "getClassIndex");

        subclasses.addAll(this.getClassDirectSubClasses(className));
        for (String c : this.getClassDirectSubClasses(className)){
            subclasses.addAll(this.getClassSubClasses(c));
        }
        return subclasses;
    }

    /**
     * Return the List of classes above the class ClassName in the Hierarchy.
     * @param className Name of the class
     * @return List of subclasses in String format.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     */
    public List<String> getClassSuperClasses(String className) throws ClassNotFoundException {
        List<String> superClasses = new ArrayList<>();
        Logger logger = LoggerFactory.getLogger(id + "getClassSubclasses");
        for (ClassInfo c : Jarclasses) {
            if (c.getName().equals(className)) {
                superClasses.add(c.getName());
                String tmp = c.getSuperClass();
                while (tmp != null) { //object class not reached
                    superClasses.add(tmp);
                    tmp = this.getClassSuperClass(tmp);
                }
            }
        }
        return superClasses;
    }

    /**
     * Return the index of method MethodName in the classname class in a String format.
     * @param className Name of the class
     * @param MethodName Name of the method
     * @return the index of method MethodName in the classname class in a String format.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     * @throws MethodNotFoundException if the method MethodName is not present in the classname methods
     */
    public String getMthdIndex(String className, String MethodName, String MethodArgs) throws ClassNotFoundException, MethodNotFoundException {
        Logger logger = LoggerFactory.getLogger(id + "getMthdIndex");
        String s = null;
        boolean classFound = false;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                classFound=true;
                for (MethodInfo m : c.getMethods()){
                    if (m.getName().equals(MethodName)){
                        if (m.getArgTypes().equals(MethodArgs)) {
                            s = String.valueOf(m.getIndex());
                        }
                    }
                }
            }
        }
        if (classFound == false) throw new ClassNotFoundException("Class not found");
        else if (s == null) throw new MethodNotFoundException("Method not found");
        return s;
    }

    /**
     * Return the abstract flag of the method.
     * @param className Name of the class
     * @param MethodName Name of the method
     * @return the abstract flag of the method.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     * @throws MethodNotFoundException if the method MethodName is not present in the classname methods
     */
    public boolean getMthdAbstractFlag(String className, String MethodName, String MethodArgs) throws ClassNotFoundException, MethodNotFoundException {
        Logger logger = LoggerFactory.getLogger(id + "getMthdAbstractFlag");
        boolean s = false;
        boolean classFound = false;
        boolean methodfound = false;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                classFound=true;
                for (MethodInfo m : c.getMethods()){
                    if (m.getName().equals(MethodName)){
                        if (m.getArgTypes().equals(MethodArgs)) {
                            methodfound = true;
                            s = m.isAbstract();

                        }
                    }
                }
            }
        }
        if (classFound == false) throw new ClassNotFoundException("Class not found");
        else if (methodfound == false) throw new MethodNotFoundException("Method not found");
        return s;
    }


    /**
     * Return the static flag of the method.
     * @param className Name of the class
     * @param MethodName Name of the method
     * @return the static flag of the method.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     * @throws MethodNotFoundException if the method MethodName is not present in the classname methods
     */
    public boolean getMthdStaticFlag(String className, String MethodName, String MethodArgs) throws ClassNotFoundException, MethodNotFoundException {
        Logger logger = LoggerFactory.getLogger(id + "getMthdStaticFlag");
        boolean s = false;
        boolean classFound = false;
        boolean methodfound = false;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                classFound=true;
                for (MethodInfo m : c.getMethods()){
                    if (m.getName().equals(MethodName)){
                        if (m.getArgTypes().equals(MethodArgs)) {
                            methodfound = true;
                            s = m.isStatic();

                        }
                    }
                }
            }
        }
        if (classFound == false) throw new ClassNotFoundException("Class not found");
        else if (methodfound == false) throw new MethodNotFoundException("Method not found");
        return s;
    }

    /**
     * Return the initial SPIndex that should be used for MethodName in ClassName.
     * @param className Name of the class
     * @param MethodName Name of the method
     * @return initial SPIndex that should be used for MethodName in ClassName.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     * @throws MethodNotFoundException if the method MethodName is not present in the classname methods
     */
    public String getMthdSPinit(String className, String MethodName, String MethodArgs) throws ClassNotFoundException, MethodNotFoundException {
        Logger logger = LoggerFactory.getLogger(id + "getMthdIndex");
        String s = null;
        boolean classFound = false;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                classFound=true;
                for (MethodInfo m : c.getMethods()){
                    if (m.getName().equals(MethodName)){
                        if (m.getArgTypes().equals(MethodArgs)) {
                            s = String.valueOf(m.getSPinit());
                        }
                    }
                }
            }
        }
        if (classFound == false) throw new ClassNotFoundException("Class not found");
        else if (s == null) throw new MethodNotFoundException("Method not found");
        return s;
    }

    /**
     * Return the types of args for each method method MethodName in the classname class in a String format.
     * @param className Name of the class
     * @param MethodName Name of the method
     * @return the types of args for each method method MethodName in the classname class in a String format.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     * @throws MethodNotFoundException if the method MethodName is not present in the classname methods
     */
    public List<String> getMthdArgsTypes(String className, String MethodName) throws ClassNotFoundException, MethodNotFoundException {
        Logger logger = LoggerFactory.getLogger(id + "getMthdIndex");
        List<String> s = new ArrayList<>();
        boolean classFound = false;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                classFound=true;
                for (MethodInfo m : c.getMethods()){
                    if (m.getName().equals(MethodName)){
                        s.add(m.getArgTypes());
                    }
                }
            }
        }
        if (classFound == false) throw new ClassNotFoundException("Class not found");
        else if (s.size() == 0) throw new MethodNotFoundException("Method not found");
        return s;
    }

    /**
     * Help to know if a method is present in a class.
     * @param className Name of the class
     * @param MethodName Name of the method
     * @return true if the method methodName is in the class, false if not.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     * @throws MethodNotFoundException if the method MethodName is not present in the classname methods
     */
    public boolean containsMethod (String className, String MethodName, String MethodArgs) throws ClassNotFoundException, MethodNotFoundException {
        Logger logger = LoggerFactory.getLogger(id + "getMthdIndex");
        boolean classFound = false;
        boolean resp = false;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                classFound=true;
                for (MethodInfo m : c.getMethods()){
                    if (m.getName().equals(MethodName)){
                        for (String a : jarInfo.getMthdArgsTypes(className,MethodName)){
                            if (a.equals(MethodArgs)) {
                                resp = true;
                            }

                        }

                    }
                }
            }
        }
        if (classFound == false) throw new ClassNotFoundException("Class not found");
        return resp;
    }

    /**
     * Return the index of method MethodName in the classname class in a String format.
     * @param className Name of the class
     * @param MethodName Name of the method
     * @return the index of method MethodName in the classname class in a String format.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     * @throws MethodNotFoundException if the method MethodName is not present in the classname methods
     */
    public String getMthdReturnType(String className, String MethodName, String MethodArgs) throws ClassNotFoundException, MethodNotFoundException {
        Logger logger = LoggerFactory.getLogger(id + "getMthdIndex");
        String s = null;
        boolean classFound = false;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                classFound=true;
                for (MethodInfo m : c.getMethods()){
                    if (m.getName().equals(MethodName)){
                        if (m.getArgTypes().equals(MethodArgs)) {
                            s = String.valueOf(m.getType());
                        }
                    }
                }
            }
        }
        if (classFound == false) throw new ClassNotFoundException("Class not found");
        else if (s == null) throw new MethodNotFoundException("Method not found");
        return s;
    }

    /**
     * Return the number of registers used by the method MethodName in the classname class in the CLP version.
     * The number of register is the sum of local variables of the methods(with arguments and this) and maximum stack size.
     * @param className Name of the class
     * @param MethodName Name of the method
     * @return the number of registers used by the method MethodName in the classname class.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     * @throws MethodNotFoundException if the method MethodName is not present in the classname methods
     */
    public int getMthdNbrReg(String className, String MethodName, String MethodArgs) throws ClassNotFoundException, MethodNotFoundException {
        Logger logger = LoggerFactory.getLogger(id + "getMthdNbrReg");
        int s = -1;
        boolean classFound = false;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                classFound=true;
                for (MethodInfo m : c.getMethods()){
                    if (m.getName().equals(MethodName)){
                        if (m.getArgTypes().equals(MethodArgs)) {
                            s = m.getNbrReg();
                        }
                    }
                }
            }
        }
        if (classFound == false) throw new ClassNotFoundException("Class not found");
        else if (s == -1) throw new MethodNotFoundException("Method not found");
        return s;
    }



    /**
     * Return the number of localvar used by the method MethodName in the classname class.
     * The number of register is the sum of local variables of the methods(with arguments and this) and maximum stack size.
     * @param className Name of the class
     * @param MethodName Name of the method
     * @return the number of localvar used by the method MethodName in the classname class.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     * @throws MethodNotFoundException if the method MethodName is not present in the classname methods
     */
    public int getMthdNbrLocalVar(String className, String MethodName, String MethodArgs) throws ClassNotFoundException, MethodNotFoundException {
        Logger logger = LoggerFactory.getLogger(id + "getMthdNbrLoacalVar");
        int s = -1;
        boolean classFound = false;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                classFound=true;
                for (MethodInfo m : c.getMethods()){
                    if (m.getName().equals(MethodName)){
                        if (m.getArgTypes().equals(MethodArgs)) {
                            s = m.getLocalVarLength();
                        }
                    }
                }
            }
        }
        if (classFound == false) throw new ClassNotFoundException("Class not found");
        else if (s == -1) throw new MethodNotFoundException("Method not found");
        return s;
    }

    /**
     * Return the instruction number of the instruction located at the instPosition location in
     * the method MethodName in the classname class.
     * @param className Name of the class
     * @param MethodName Name of the method
     * @param instPosition position of the first byte of the instruction relatively to the start of the method.
     * @return the instruction number of the instruction located at the instPosition location in
     * the method MethodName in the classname class.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     * @throws MethodNotFoundException if the method MethodName is not present in the classname methods
     */
    public int getInstNumber(String className, String MethodName, String MethodArgs,int instPosition) throws ClassNotFoundException, MethodNotFoundException {
        Logger logger = LoggerFactory.getLogger(id + "getMthdIndex");
        int s = -1;
        boolean classFound = false;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                classFound=true;
                for (MethodInfo m : c.getMethods()){
                    if (m.getName().equals(MethodName)){
                        if (m.getArgTypes().equals(MethodArgs)) {
                            s = (Integer) m.getInstpos().get(instPosition);
                        }
                    }
                }
            }
        }
        if (classFound == false) throw new ClassNotFoundException("Class not found");
        else if (s == -1) throw new MethodNotFoundException("Method not found");
        return s;
    }

    /**
     * Return the localvar number of the localvar located at the varPosition location in
     * the method MethodName in the classname class.
     * @param className Name of the class
     * @param MethodName Name of the method
     * @param varPosition position of the localvar relatively to the length of variables
     * @return the the localvar number of the localvar located at the varPosition location in
     * the method MethodName in the classname class.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     * @throws MethodNotFoundException if the method MethodName is not present in the classname methods
     */
    public String getlocvarNumber(String className, String MethodName,String MethodArgs, int varPosition) throws ClassNotFoundException, MethodNotFoundException {
        Logger logger = LoggerFactory.getLogger(id + "getMthdIndex");
        String s = null;
        boolean classFound = false;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                classFound=true;
                for (MethodInfo m : c.getMethods()){
                    if (m.getName().equals(MethodName)){
                        if (m.getArgTypes().equals(MethodArgs)) {
                            s = String.valueOf(m.getVarpos().get(varPosition));
                        }
                        }
                }
            }
        }
        if (classFound == false) throw new ClassNotFoundException("Class not found");
        else if (s == null) throw new MethodNotFoundException("Method not found");
        return s;
    }


    /**
     * Return the number of arguments in the method MethodName in the classname class.
     * @param className Name of the class
     * @param MethodName Name of the method
     * @return the number of arguments in the method MethodName in the classname class.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     * @throws MethodNotFoundException if the method MethodName is not present in the classname methods
     */
    public int getMthdNbrArg(String className, String MethodName, String MethodArgs) throws ClassNotFoundException, MethodNotFoundException {
        Logger logger = LoggerFactory.getLogger(id + "getMthdNbrArg");
        int s = -1;
        boolean classFound = false;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                classFound=true;
                for (MethodInfo m : c.getMethods()){
                    if (m.getName().equals(MethodName)){
                        if (m.getArgTypes().equals(MethodArgs)) {
                            s = m.getNargs();
                        }
                    }
                }
            }
        }
        if (classFound == false) throw new ClassNotFoundException("Class not found");
        else if (s == -1) throw new MethodNotFoundException("Method not found");
        return s;
    }

    /**
     * Return the number of arguments in the method MethodName in the classname class.
     * @param className Name of the class
     * @param MethodName Name of the method
     * @return the number of arguments in the method MethodName in the classname class.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     * @throws MethodNotFoundException if the method MethodName is not present in the classname methods
     */
    public int getMthdNbrIns(String className, String MethodName, String MethodArgs) throws ClassNotFoundException, MethodNotFoundException {
        Logger logger = LoggerFactory.getLogger(id + "getMthdNbrIns");
        int s = -1;
        boolean classFound = false;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)) {
                classFound=true;
                for (MethodInfo m : c.getMethods()){
                    if (m.getName().equals(MethodName)){
                        if (m.getArgTypes().equals(MethodArgs)) {
                            s = m.getInstpos().size();
                        }
                    }
                }
            }
        }
        if (classFound == false) throw new ClassNotFoundException("Class not found");
        else if (s == -1) throw new MethodNotFoundException("Method not found");
        return s;
    }

    /**
     * Return the number attributes in the classname class.
     * @param className Name of the class
     * @return the number attributes in the classname class.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     */
    public int getAttributesSize(String className) throws ClassNotFoundException {
        int size = -1;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)){
                size = c.getAttributes().size();
            }
        }
        if (size == -1) throw new ClassNotFoundException("Class not found");
    return size;
    }

    /**
     * Return the name attribute i in the classname class.
     * @param className Name of the class
     * @param i position of the attribute
     * @return the name attribute i in the classname class.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     * @throws AttributeNotFoundException if i is not a valid position of attribute
     */
    public String getAttributeAt(String className, int i) throws ClassNotFoundException, AttributeNotFoundException {
        String att = null;
        boolean classFound = false;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)){
                classFound = true;
                att = c.getAttributes().get(i);
            }
        }
        if (classFound == false) throw new ClassNotFoundException("Class not found");
        if (att == null) throw new AttributeNotFoundException("Attribute not found");
        return att;
    }

    /**
     * Return the position the attribute field in the classname class.
     * @param className Name of the class
     * @param field name of the attribute
     * @return the the position the attribute field in the classname class.
     * @throws ClassNotFoundException if the class classname is not present in Jarclasses field
     * @throws AttributeNotFoundException if i is not a valid position of attribute
     */
    public int getAttributeNumber(String className, String field) throws ClassNotFoundException, AttributeNotFoundException {
        int number = -1;
        boolean classFound = false;
        for (ClassInfo c : Jarclasses){
            if (c.getName().equals(className)){
                classFound = true;
                number = c.getAttributes().indexOf(field)+1;
            }
        }
        if (classFound == false) throw new ClassNotFoundException("Class not found");
        if (number == -1) throw new AttributeNotFoundException("Attribute not found");
        return number;
    }

    /**
     * Return a list of String arrays of the form [ClassName,MethodReturnType,MethodName,MethodArgs].
     * @return a list of String arrays of the form [ClassName,MethodReturnType,MethodName,MethodArgs].
     */
    public List<String[]> getAllMethInfos(){
            List<String[]> list = new ArrayList<>();
            String[] methodInfo;
        for (ClassInfo c : Jarclasses){
            for (MethodInfo mi : c.getMethodsInfos()){
                methodInfo = new String[4];
                methodInfo[0] = c.getName();
                methodInfo[1] = mi.getType();
                methodInfo[2] = mi.getName();
                methodInfo[3] = mi.getArgTypes();
                list.add(methodInfo);
            }
        }

        return list;
    }

    @Override
    /**
     * Provide a String representation of the JarInfo object
     * @retun a String representation of the JarInfo object
     */
    public String toString() {
        String s =  "JarInfo{\n";
        for (ClassInfo classe : Jarclasses){
            s = s + classe.toString();
        }
        return s + "}\n";
    }
}
