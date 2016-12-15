package com.cafebabe.core.instructions;

import exceptions.AttributeNotFoundException;
import exceptions.ClassNotFoundException;
import exceptions.MethodNotFoundException;
import exceptions.NotImplementedException;
import org.apache.bcel.classfile.ConstantPool;
import org.apache.bcel.classfile.Method;
import org.apache.bcel.generic.Instruction;
import org.apache.bcel.generic.InstructionHandle;
import org.apache.bcel.generic.InstructionList;
import org.apache.bcel.generic.Type;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Arrays;

import static com.cafebabe.core.CafeBabe.*;
import static com.cafebabe.core.Consts.*;


/**
 * InstructionTools contains methods related to the workflow to translate a list of instructions, essentially to run through instructions
 * of a method and sort them into families (meta instructions).
 * This class keep information about the virtual topStack value.
 *
 * @author Laffineur Gerome
 */
public class InstructionTools {
    /**
     * ID used for the logger
     */
private static final String id = "com.cafebabe.core.instructions.InstructionTool.";
private static int MAX_PATTERN_SIZE = 4; //Define size of the windows that detect bytecode patterns
    /**
     *
     * Translate a java method stack based representation to an horn clauses register based representation.
     * @param instList list of instructions contained in method
     * @param method method that contains instList
     * @param className Name of the class
     */
    public static String translateList(InstructionList instList, Method method, String className){
        Logger logger = LoggerFactory.getLogger(id + "translateList");
        String clauses ="";
        int insNumber = 0;
        InstructionHandle i;
        InstructionHandle[] instHandleList = instList.getInstructionHandles();
        InstructionHandle[] pattern;
        int patternNumber = 0;
        while(insNumber < instHandleList.length){
            i = instHandleList[insNumber];

            pattern = Arrays.copyOfRange(instHandleList,insNumber,insNumber+MAX_PATTERN_SIZE);
            patternNumber = checkPattern(pattern);
            int patternLength =0;
            switch(patternNumber){
                case 1 : patternLength = 2; break;
                case 2 : patternLength = 4; break;
            }
            if (patternNumber>0 && optimise){ //Optimisation : translate detected pattern in a single clause
            clauses = clauses + translatePattern(patternNumber,insNumber,pattern,className,method);
            insNumber = insNumber + patternLength;

            } else { //Normal flow
                logger.debug(i.toString());
                clauses = clauses + "%" + i.toString() + "\n";
                clauses = clauses + translateIns(i.getInstruction(), method, i, instList.getLength() - 1, insNumber, method.getName(),
                        className, translateArgs(method.getArgumentTypes()));
                insNumber = insNumber + 1;
            }
        }
    return clauses;
    }

    /**
     * Take a bytecode instruction in a given context and translate it to a horn clause representation.
     * Note :   ins and ih must be related to the same instruction.
     *          similar bytecode instructions are grouped in a same class representation because they need similar treatment.
     * @param ins representation of the bytecode instruction (Instruction class).
     * @param method representation of the method that contains the given instruction.
     * @param ih representation of the bytecode instruction with more information about context (InstructionHandle class).
     * @param listLength The position(number) of the last instruction of the method.
     * @param className Name of the class
     * @param insNumber Instruction number
     * @param methodName Name of the method
     */
    public static String translateIns(Instruction ins, Method method, InstructionHandle ih, int listLength, int insNumber, String methodName, String className, String methArgs){
        Logger logger = LoggerFactory.getLogger(id + "translateIns");
        InstructionGen i;
        String clauses = "";
        try{
        switch (ins.getName()){
            case "aconst_null":case "aload":case "aload_0":case "aload_1":case "aload_2":case "aload_3":case "aload_4":
            case "aload_5":case "dload":case "dload_0":case "dload_1":case "dload_2":case "dload_3":case "fload" :
            case "fload_0" :case "fload_1" :case "fload_2" :case "fload_3" :case "iload":case "iload_0":case "iload_1":
            case "iload_2":case "iload_3":case "lload":case "lload_0":case "lload_1":case "lload_2":case "lload_3":
                ins = new LOAD(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "baload":case "caload":case "daload":case "faload":case "iaload":case "laload":case "saload":case "aaload":
                ins = new ARRAYLOAD(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className, method.getConstantPool(),methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "multianewarray":
                ins = new MULTINEWARRAY(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className, method.getConstantPool(),methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;


            case "newarray":case "anewarray":
                ins = new NEWARRAY(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className, method.getConstantPool(),methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "areturn":case "dreturn":case "freturn" :case "ireturn":case "lreturn":case "ret": case "return":
                ins = new RETURN(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "arraylength":
                ins = new ARRAYLENGTH(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "astore":case "astore_0":case "astore_1":case "astore_2":case "astore_3":case "astore_4":
            case "astore_5":case "dstore":case "dstore_0":case "dstore_1":case "dstore_2":case "dstore_3":case "fstore":
            case "fstore_0":case "fstore_1":case "fstore_2":case "fstore_3":case "istore":case "istore_0":case "istore_1":
            case "istore_2":case "istore_3":case "lstore":case "lstore_0":case "lstore_1":case "lstore_2":case "lstore_3":
                ins = new STORE(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "bastore":case "castore":case"dastore":case "fastore":case "iastore":case "lastore":case "sastore":case"aastore":
                ins = new ARRAYSTORE(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "athrow":
                break;

            //Those cases concern bytecode operation related to direct push manipulations of the stack
            case "bipush":case "dconst_0":case "dconst_1":case "fconst_0":case "fconst_1":case "fconst_2":case "iconst_m1":
            case "iconst_0":case "iconst_1":case "iconst_2":case "iconst_3":case "iconst_4":case "iconst_5":
            case "lconst_0":case "lconst_1":case "ldc":case "ldc_w":case "ldc2_w":case "sipush":
                ins = new CONST(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className, method.getConstantPool(),methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "d2f":case "d2i":case "d2l":case "f2d":case "f2i":case "f2l":case "i2b":case "i2c":case "i2d":case "i2f":
            case "i2l":case "i2s":case "l2d":case "l2f":case "l2i":
                ins = new CONVERT(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "dadd":case "fadd":case "iadd":case "ladd":
                ins = new ADD(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "iinc":
                ins = new INC(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "dcmpg":case"dcmpl":case "fcmpg":case "fcmpl":case "lcmp":
                ins = new COMPARE(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "ddiv":case "fdiv" :case "idiv":case "ldiv":
                ins = new DIV(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "dmul":case "fmul" :case "imul":case "lmul":
                ins = new MUL(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "dneg":case "fneg" :case "ineg":case "lneg":
                ins = new NEG(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "drem":case "frem" :case "irem":case "lrem":
                ins = new MODULO(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "dsub":case "fsub":case "isub":case "lsub":
                ins = new SUB(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "dup":
                ins = new DUP(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;
            case "dup_x1":
                ins = new DUP_X1(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;
            case "dup_x2":
                throw new NotImplementedException("dup_x2 not implemented");

            case "dup2" :case "dup2_x1" :case "dup2_x2" :
                throw new NotImplementedException("DUP2 not implemented");

            case "getfield":
                ins = new GETFIELD(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className, method.getConstantPool(),methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "getstatic":
                ins = new GETSTATIC(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className, method.getConstantPool(),methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "goto":case "goto_w":case "jsr":case "jsr_w":
                ins = new GOTO(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "iand":case "ior":case "ixor":case "land":case "lor":case "lxor":
                break;

            case "if_acmpeq":case "if_acmpne":case "if_icmpeq":case "if_icmpne":case "if_icmplt":case "if_icmpge":
            case "if_icmpgt":case "if_icmple":
                ins = new IFCMP(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "ifeq":case "ifne":case "iflt":case "ifge":case "ifgt":case "ifle":
            case "ifnonnull":case "ifnull":
                ins = new IFCMPONEREAD(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "instanceof":
                break;

            case "invokespecial":
                ins = new INVOKESPECIAL(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className, method.getConstantPool(),methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                //topStack decremented inside INVOKESPECIAL from nargs+1 (+-1 for if return value?)
                break;

            case "invokevirtual":
                ins = new INVOKEVIRTUAL(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className, method.getConstantPool(),methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "invokeinterface":
                ins = new INVOKEINTERFACE(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className, method.getConstantPool(),methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "invokestatic":
                ins = new INVOKESTATIC(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className, method.getConstantPool(),methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;


            case "invokedynamic":
                throw new NotImplementedException("invokedynamic not implemented");

            case "ishl":case "ishr":case "iushr":case "lshl":case "lshr":case "lushr":
                break;

            case "lookupswitch":
                ins = new LOOKUPSWITCH(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case"tableswitch":
                throw new NotImplementedException("tableswitch not implemented");

            case "monitorenter":case "monitorexit":
                throw new NotImplementedException("monitor not implemented");

            case "new":
                ins = new NEW(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className, method.getConstantPool(),methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "nop": case "checkcast":
                ins = new NOTHING(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;
            case "pop2":
                ins = new NOTHING(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;
            case "pop":
                ins = new NOTHING(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className,methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;


            case "putfield":
                ins = new PUTFIELD(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className, method.getConstantPool(),methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "putstatic":
                ins = new PUTSTATIC(ih, ins.getOpcode(),new Integer(ins.getLength()).shortValue(),
                        ((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack()),listLength,insNumber, methodName, className, method.getConstantPool(),methArgs);
                i = (InstructionGen) ins;
                clauses = i.toCLP();
                break;

            case "swap":
                throw new NotImplementedException("swap not implemented");

            case "wide":
                throw new NotImplementedException("wide not implemented");

        }
        //Handle code not included in .jar
    }catch(ClassNotFoundException | AttributeNotFoundException | MethodNotFoundException e){
            int nreg =((method.getLocalVariableTable() != null)?method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack():method.getCode().getMaxStack());

            String head = "p"+jarInfo.getClassIndex(className)+"_"+
                    jarInfo.getMthdIndex(className,methodName,methArgs)+"_"+
                    String.valueOf(insNumber)+"(";
            for (int r=0; r<nreg; r++){head = head+IV+r+",";}
            for (int r=0; r<nreg; r++){head = head+NV+r+",";}
            head = head +"SP_INDEX,"+"IHS,OHS,"+HI+","+HO+",R) ";

            String externalMethodName = "external_";
            switch(ins.getClass().getSimpleName()){
                case "GETFIELD":case "GETSTATIC":case "PUTFIELD":case "PUTSTATIC":
                    externalMethodName+=last_args[0]+last_args[1];
                    break;
                case "INVOKEINTERFACE":case "INVOKEVIRTUAL":case "INVOKESTATIC":case "INVOKESPECIAL":
                    externalMethodName+=last_args[0]+last_args[1]+last_args[2];
                    break;
            }
            externalMethodName = externalMethodName.replace("/","_").replace(";","");

            clauses  = head+ ":- {},\n     "+externalMethodName;

            String thirdpart = "";
            if (listLength != insNumber) {
                thirdpart = "     p" + jarInfo.getClassIndex(className) + "_" +
                        jarInfo.getMthdIndex(className, methodName, methArgs) + "_" +
                        String.valueOf(insNumber + 1) + "(";
                for (int x = 0; x < nreg; x++) {thirdpart = thirdpart + IV + x + ",";}
                for (int x = 0; x < nreg; x++) {thirdpart = thirdpart + NV + x + ",";}
                thirdpart = thirdpart + SPN + "," + IHS + "," + OHS+","+HI+","+HO+",R) ";
            }

            clauses = clauses + ((thirdpart.equals("")) ? "" : (",\n" + thirdpart));
            clauses = clauses + ".\n";
            externalCalls.add(externalMethodName+" :- {}.\n");
    }
    return clauses;
    }


    public static String translateArgs(Type[] types){
        String argTypes = "";
        for (Type t : types){
            switch (t.toString()){
                case "int" : argTypes = argTypes.concat("I"); break;
                case "long" : argTypes = argTypes.concat("J"); break;
                case "double" : argTypes = argTypes.concat("D"); break;
                case "short" : argTypes = argTypes.concat("S"); break;
                case "float" : argTypes = argTypes.concat("F"); break;
                case "java.lang.String[]" : argTypes = argTypes.concat("[Ljava/lang/String;"); break;
                default : argTypes = argTypes.concat("L"+t.toString()+";"); break;


            }
        }
        return argTypes;
    }


    public static int checkPattern(InstructionHandle[] instList){
        int patternNumber = 0;
        if (   (instList[0].toString().matches(REGEX_CONST_N) ||
                instList[0].toString().matches(REGEX_CONSTM1) ||
                instList[0].toString().matches(REGEX_BIPUSH)  ||
                instList[0].toString().matches(REGEX_LDC)

        ) &&   (instList[1].toString().matches(REGEX_STORE_N) ||
                instList[1].toString().matches(REGEX_STORE)

        ) ){
            patternNumber = 1;
        }

        if (   (instList[0].toString().matches(REGEX_LOAD_N) ||
                instList[0].toString().matches(REGEX_LOAD)   ||
                instList[0].toString().matches(REGEX_CONST_N)||
                instList[0].toString().matches(REGEX_CONSTM1)||
                instList[0].toString().matches(REGEX_BIPUSH) ||
                instList[0].toString().matches(REGEX_LDC)

                ) &&

                (instList[1].toString().matches(REGEX_LOAD_N) ||
                 instList[1].toString().matches(REGEX_LOAD)   ||
                 instList[1].toString().matches(REGEX_CONST_N)||
                 instList[1].toString().matches(REGEX_CONSTM1)||
                 instList[1].toString().matches(REGEX_BIPUSH) ||
                 instList[1
                         ].toString().matches(REGEX_LDC)

                ) && instList[2].toString().matches(REGEX_BINOP)

                &&
                (instList[3].toString().matches(REGEX_STORE_N) ||
                 instList[3].toString().matches(REGEX_STORE)
                )){
            patternNumber = 2;
        }


        return patternNumber;
    }

    public static String translatePattern(int patternNumber, int instNumber , InstructionHandle[] instList, String className, Method method){
        Instruction ins;
        InstructionGen i;
        String clauses = "";
        short x = 0;
        switch(patternNumber){

            case 1 :
                clauses = clauses + "%VARIABLE INITIALISATION PATTERN {"+instList[0].toString() + " ->" + instList[1].toString()+ "   }\n";
                ins = new PATTERN_INITVAR(instList[0],x,x,0,0,instNumber,method.getName(), className,null,null,method,instList);
                i = (InstructionGen) ins;
                clauses = clauses + i.toCLP();
                break;
            case 2 :
                clauses = clauses + "%BINARY OPERATOR PATTERN {"+instList[0].toString() + " ->" + instList[1].toString()+
                         " ->" + instList[2].toString()+  " ->" + instList[3].toString()+"   }\n";
                ins = new PATTERN_BINOP(instList[0],x,x,0,0,instNumber,method.getName(), className,null,null,method,instList);
                i = (InstructionGen) ins;
                clauses = clauses + i.toCLP();
                break;
        }

        return clauses;
    }


}
