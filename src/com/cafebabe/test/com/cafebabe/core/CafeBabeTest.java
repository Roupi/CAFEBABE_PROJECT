package com.cafebabe.core;

import exceptions.ClassNotFoundException;
import exceptions.MethodNotFoundException;
import exceptions.NoMainMethodException;
import org.apache.bcel.classfile.JavaClass;
import org.jpl7.*;
import org.junit.Test;

import java.io.File;
import java.io.IOException;
import java.lang.Integer;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.cafebabe.core.CafeBabe.getClasses;
import static com.cafebabe.core.CafeBabe.objectNumber;
import static org.junit.Assert.assertTrue;

public class CafeBabeTest {

    private String TR = "/home/laffineur/Dropbox/IdeaProjects/CAFEBABE/src/com/cafebabe/test/TestRessources/";
    Query loadConverter =
            new Query(
                    "consult",
                    new Term[] {new Atom("/home/laffineur/Dropbox/IdeaProjects/CAFEBABE/src/com/cafebabe/test/CLPtoProlog.pl")}
            );

    private Map prepareTest(String testName, JarInfo jarInfo, int entryNum) throws NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException{
        //Get number of registers for pStart
        int number_of_args = -1;
        int number_of_lv = -1;
        Menu menu = new Menu(jarInfo);
        String[] entryPoint = menu.menuDisplay(entryNum);
        number_of_args = jarInfo.getMthdNbrArg(entryPoint[0],entryPoint[2],entryPoint[3]);
        number_of_lv = jarInfo.getMthdNbrLocalVar(entryPoint[0],entryPoint[2],entryPoint[3]);
        //init tab of terms..
        Term[] lt = new Term[(number_of_args+number_of_lv)+1];

        for(int i=0; i<number_of_args;i++){
            lt[i] = new Variable("IV"+i);
        }

        for(int i=0; i<number_of_lv;i++){
            lt[number_of_args+i] = new Variable("OV"+i);
        }

        lt[(number_of_args+number_of_lv)] = new Variable("R");
        //init tab of terms  : OK
        Query pStart = new Query("p_startD",lt);
        System.out.println(pStart.toString());

        String outputFolder = TR+testName+"/";
        String args[] = new String[4];
        args[0] = TR+testName+"/out/artifacts/"+testName+"_jar/"+testName+".jar";
        args[1] = outputFolder;
        args[2] = Integer.toString(entryNum);
        args[3] = "";
        CafeBabe.main(args);
        final File result = new File(outputFolder+testName+".clp");

        Query loadProgram =
                new Query(
                        "convert",
                        new Term[] {new Atom(testName+".clp"),new Atom(TR+testName+"/")}
                );
        loadConverter.hasSolution();
        loadProgram.hasSolution();
        Map solution = pStart.oneSolution();
    return solution;
    }

    private void closeTest(JarInfo jarInfo, String testName, int entryNum) throws ClassNotFoundException, MethodNotFoundException {
        List<Query> queries = new ArrayList<>();
        Menu menu = new Menu(jarInfo);
        String[] entryPoint = menu.menuDisplay(entryNum);


        String mainClass = "";
        //Create list of retractall queries..
        for (String c : jarInfo.getClassSubClasses("java/lang/Object")){
                String class_index = jarInfo.getClassIndex(c);
                for (String m : jarInfo.getClassMethodsNames(c)) {
                    for (String argTypes : jarInfo.getMthdArgsTypes(c, m)){
                        String method_index = jarInfo.getMthdIndex(c, m,argTypes);
                    //initialize arguments of the p predicates of the method
                    int nbreg = jarInfo.getMthdNbrReg(c, m,argTypes) * 2;
                    Term[] args = new Term[nbreg + 6];
                    for (int i = 0; i < nbreg; i++) {
                        args[i] = new Variable("_");
                    }
                    args[nbreg] = new Variable("_");
                    args[nbreg + 1] = new Variable("_");
                    args[nbreg + 2] = new Variable("_");
                    args[nbreg + 3] = new Variable("_");
                    args[nbreg + 4] = new Variable("_");
                    args[nbreg + 5] = new Variable("_");

                    if (c.equals(entryPoint[0])&&m.equals(entryPoint[2])&&argTypes.equals(entryPoint[3])) { //If this method is referenced by pStart
                        int argsPstart = jarInfo.getMthdNbrArg(entryPoint[0],entryPoint[2],entryPoint[3]);
                        int lvPstart = jarInfo.getMthdNbrLocalVar(entryPoint[0],entryPoint[2],entryPoint[3]);

                        //init tab of terms p_startDebug..
                        Term[] ltPS = new Term[(argsPstart+lvPstart)+1];
                        for(int i=0; i<argsPstart;i++){
                            ltPS[i] = new Variable("IV"+i);
                        }
                        for(int i=0; i<lvPstart;i++){
                            ltPS[argsPstart+i] = new Variable("OV"+i);
                        }
                        ltPS[(argsPstart+lvPstart)] = new Variable("R");
                        //init tab of terms p_startDebug: OK

                        //init tab of terms p_start..
                        boolean Static = jarInfo.getMthdStaticFlag(entryPoint[0],entryPoint[2],entryPoint[3]);
                        Term[] ltPS2;
                        if(!Static){

                            ltPS2 = new Term[(argsPstart-1)+1];
                            for(int i=1; i<argsPstart;i++){
                                ltPS2[i] = new Variable("IV"+i);
                            }
                            ltPS2[(argsPstart-1)] = new Variable("R");

                        } else{

                            ltPS2 = new Term[(argsPstart)+1];
                            for(int i=0; i<argsPstart;i++){
                                ltPS2[i] = new Variable("IV"+i);
                            }
                            ltPS2[(argsPstart)] = new Variable("R");

                        }
                        //init tab of terms p_start: OK


                        queries.add(new Query("retractall", new Compound("p_startD", ltPS)));
                        queries.add(new Query("retractall", new Compound("p_start", ltPS2)));
                    }

                    for (int i = 0; i < jarInfo.getMthdNbrIns(c, m,argTypes); i++) {
                        queries.add(new Query("retractall", new Compound(("p" + class_index + "_" + method_index + "_" + i), args)));
                    }
                }
                }
        }
        Term[] oargs = new Term[3];
        oargs[0] = new Variable("_");
        oargs[1] = new Variable("_");
        oargs[2] = new Variable("_");
        queries.add(new Query("retractall", new Compound("object", oargs)));
        objectNumber = 0;
        //call all retractall queries
        for (Query q : queries){
            q.hasSolution();
        }
    }

    private JarInfo getJarInfo(String testName) throws java.lang.ClassNotFoundException {
        List<JavaClass> classes = getClasses(TR+testName+"/out/artifacts/"+testName+"_jar/"+testName+".jar");
        return new JarInfo(classes);
    }

    @Test //SUB
    public void test_1() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_1";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 4);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 5);
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 1);
        closeTest(jarInfo,testName,0);
    }

    @Test //SUB
    public void test_2() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_2";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 500);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 300);
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 200);
        closeTest(jarInfo,testName,0);
    }

    @Test //DIV
    public void test_3() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_3";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 100);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 2);
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 50);
        closeTest(jarInfo,testName,0);
    }

    @Test //MUL
    public void test_4() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_4";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 4);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 3);
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 12);
        closeTest(jarInfo,testName,0);
    }

    @Test //MODULO
    public void test_5() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_5";
        JarInfo jarInfo;
        jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 26);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 3);
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 2);
        closeTest(jarInfo,testName,0);
    }

    @Test //ARITHMETICS
    public void test_6() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_6";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 30);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 20);
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 10);
        assertTrue(Integer.valueOf(solution.get("OV4").toString()) == 2);
        assertTrue(Integer.valueOf(solution.get("OV5").toString()) == 100);
        closeTest(jarInfo,testName,0);
    }

    @Test //CONDITIONAL STRUCTURES (if var>var)
    public void test_7() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_7";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 2);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 3);
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 10);
        closeTest(jarInfo,testName,0);
    }

    @Test //CONDITIONAL STRUCTURES (if (var<var)  )
    public void test_8() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_8";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 2);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 3);
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 10);
        closeTest(jarInfo,testName,0);
    }

    @Test //CONDITIONAL STRUCTURES (if (var == const) else  )
    public void test_9() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_9";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 10);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 18);
        closeTest(jarInfo,testName,0);
    }

    @Test //CONDITIONAL STRUCTURES (if (var >= const) op  )
    public void test_10() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_10";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 20);
        closeTest(jarInfo,testName,0);
    }

    @Test //WHILE IF(var<const) INC
    public void test_11() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_11";
        JarInfo jarInfo = getJarInfo(testName);
        int entryNum = 3;
        Map solution = prepareTest(testName,jarInfo,entryNum);
        System.out.println(solution);
        assertTrue(Integer.valueOf(solution.get("R").toString()) == 10);
        closeTest(jarInfo,testName,0);
    }

    @Test //WHILE IF(var<const) break
    public void test_12() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_12";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 0);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 11);
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 10);
        assertTrue(Integer.valueOf(solution.get("OV4").toString()) == 19);
        closeTest(jarInfo,testName,0);
    }

    @Test //NESTED WHILE AND NESTED IF
    public void test_13() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_13";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 10);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 9);
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 40);
        assertTrue(Integer.valueOf(solution.get("OV4").toString()) == 30);
        closeTest(jarInfo,testName,0);
    }

    @Test //FOR LOOP
    public void test_14() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_14";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 10);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 100);
        closeTest(jarInfo,testName,0);
    }

    @Test //ONE OBJECT ONE FIELD INIT PUTFIELD AND GETFIELD
    public void test_15() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_15";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 10);
        closeTest(jarInfo,testName,0);
    }

    @Test //TWO OBJECT MULTIPLES FIELDS INIT PUTFIELD AND GETFIELD
    public void test_16() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_16";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 50);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 12);
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 20);
        assertTrue(Integer.valueOf(solution.get("OV4").toString()) == 30);
        assertTrue(Integer.valueOf(solution.get("OV5").toString()) == 1);
        closeTest(jarInfo,testName,0);
    }

    @Test //FIELD MODIFICATION OF AN OBJECT
    public void test_17() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_17";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 999);
        closeTest(jarInfo,testName,0);
    }

    @Test //OBJECT FIELD IS AN OBJECT
    public void test_18() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_18";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 10);
        closeTest(jarInfo,testName,0);
    }

    @Test //OBJECT FIELD WITH EXTENDS
    public void test_19() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_19";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 19);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 99);
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 1995);
        //assertTrue(Integer.valueOf(solution.get("OV4").toString()) == 69);
        closeTest(jarInfo,testName,0);
    }

    @Test //CALL OF PRIVATE METHOD WITH RETURN VALUE
    public void test_20() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_20";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 5);
        closeTest(jarInfo,testName,0);
    }

    @Test //CALL OF PRIVATE METHOD WITH OBJECT AS RETURN VALUE
    public void test_21() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_21";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 11);
        assertTrue(Integer.valueOf(solution.get("OV4").toString()) == 22);
        closeTest(jarInfo,testName,0);
    }

    @Test //CALL OF PRIVATE METHOD WITH MULTIPLE ARGS
    public void test_22() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_22";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 72);
        closeTest(jarInfo,testName,0);
    }

    @Test //CALL OF PRIVATE METHOD WITH MULTIPLE ARGS
    public void test_23() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_23";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 16);
        closeTest(jarInfo,testName,0);
    }


    @Test //CAST AND CALL OF PUBLIC INSTANCE METHOD
    public void test_25() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_25";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 5);
        closeTest(jarInfo,testName,0);
    }

    @Test //CLASS EXTENDS AND METHOD OVERWRITE
    public void test_26() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_26";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 11);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 22);
        closeTest(jarInfo,testName,0);
    }

    @Test //LOOKUP PROCESS TEST
    public void test_27() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_27";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 2);
        closeTest(jarInfo,testName,0);
    }

    @Test //LOOKUP PROCESS TEST EXAMPLE FROM THE PAPER
    public void test_28() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_28";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 10);
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 8);
        closeTest(jarInfo,testName,0);
    }

    @Test //DIFFERENT DEF OF A METHOD BASED ON ARGUMENTS
    public void test_30() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_30";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 10);
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 100);
        closeTest(jarInfo,testName,0);
    }
    @Test //DIFFERENT DEF OF A METHOD BASED ON ARGUMENTS IN SUBCLASSES
    public void test_31() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_31";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 111);
        assertTrue(Integer.valueOf(solution.get("OV4").toString()) == 333);
        closeTest(jarInfo,testName,0);
    }

    @Test //METHOD CALL FROM OBJECT DECLARED AS INTERFACE
    public void test_32() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_32";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 93);
        closeTest(jarInfo,testName,0);
    }

    @Test //MULTIPLE DEFINITIONS OF INTERFACES METHODS IN DIFFERENT OBJECTS
    public void test_33() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_33";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == -107);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 51);
        assertTrue(Integer.valueOf(solution.get("OV3").toString()) == -75);
        assertTrue(Integer.valueOf(solution.get("OV4").toString()) == 69);
        closeTest(jarInfo,testName,0);
    }

    @Test //INTERFACE METHOD IN EXTENDED OBJECT THAT NOT DIRECTLY OVERWRITE THE METHOD
    public void test_34() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_34";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 53);
        closeTest(jarInfo,testName,0);
    }

    @Test //STATIC METHOD INVOCATION
    public void test_36() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_36";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 5);
        closeTest(jarInfo,testName,0);
    }

    @Test //STATIC METHOD INVOCATION WITH ARGS
    public void test_37() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_37";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 20);
        closeTest(jarInfo,testName,0);
    }

    @Test //STATIC METHOD INVOCATION WITH ARGS
    public void test_38() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_38";
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,0);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 10);
        closeTest(jarInfo,testName,0);
    }

    @Test //TEST OF ENTRY POINT SELECTION AND RETURN VALUE
    public void test_39() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_39";
        int entryNum = 3;
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,entryNum);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("R").toString()) == 14);
        closeTest(jarInfo,testName,entryNum);
    }

    @Test //TEST OF ENTRY POINT SELECTION AND RETURN VALUE
    public void test_40() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_40";
        int entryNum = 3;
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,entryNum);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("R").toString()) == 18);
        closeTest(jarInfo,testName,entryNum);
    }

    @Test //STATIC METHOD CALL
    public void test_41() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_41";
        int entryNum = 0;
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,entryNum);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 18);
        closeTest(jarInfo,testName,entryNum);
    }

    @Test //DEMO PROGRAM GONZAGUE EXPONENT(15 NOVEMBRE 2016)
    public void test_43() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_43";
        int entryNum = 0;
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,entryNum);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 8);
        closeTest(jarInfo,testName,entryNum);
    }

    @Test //ARRAY TEST
    public void test_44() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_44";
        int entryNum = 0;
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,entryNum);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV4").toString()) == 10);
        assertTrue(Integer.valueOf(solution.get("OV5").toString()) == 69);
        assertTrue(Integer.valueOf(solution.get("OV6").toString()) == 50);
        assertTrue(Integer.valueOf(solution.get("OV7").toString()) == 3);
        assertTrue(Integer.valueOf(solution.get("OV8").toString()) == 18);
        assertTrue(Integer.valueOf(solution.get("OV9").toString()) == 2);
        closeTest(jarInfo,testName,entryNum);
    }

    @Test //GETSTATIC PUTSTATIC TEST
    public void test_45() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_45";
        int entryNum = 0;
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,entryNum);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
       assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 8);
       assertTrue(Integer.valueOf(solution.get("OV3").toString()) == 3);
       assertTrue(Integer.valueOf(solution.get("OV4").toString()) == 50);
       assertTrue(Integer.valueOf(solution.get("OV5").toString()) == 21);
        closeTest(jarInfo,testName,entryNum);
    }

    @Test //SWITCH TEST
    public void test_46() throws IOException, NoMainMethodException, ClassNotFoundException, MethodNotFoundException, java.lang.ClassNotFoundException {
        String testName = "TEST_46";
        int entryNum = 0;
        JarInfo jarInfo = getJarInfo(testName);
        Map solution = prepareTest(testName,jarInfo,entryNum);
        System.out.println(solution);
        Query ls = new Query("listing", new Atom("object"));
        System.out.println(ls.oneSolution());
        assertTrue(Integer.valueOf(solution.get("OV1").toString()) == 18);
        assertTrue(Integer.valueOf(solution.get("OV2").toString()) == 70);
        closeTest(jarInfo,testName,entryNum);
    }


}

