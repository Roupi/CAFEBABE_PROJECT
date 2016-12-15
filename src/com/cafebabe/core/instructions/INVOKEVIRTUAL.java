package com.cafebabe.core.instructions;

import ch.qos.logback.core.util.SystemInfo;
import exceptions.AttributeNotFoundException;
import exceptions.ClassNotFoundException;
import exceptions.MethodNotFoundException;
import exceptions.NotImplementedException;
import org.apache.bcel.classfile.ConstantPool;
import org.apache.bcel.generic.InstructionHandle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.cafebabe.core.CafeBabe.*;
import static com.cafebabe.core.Consts.*;

/**
 * INVOKEVIRTUAL is the representation of the meta instruction that relate to the invocation of an instance method,
 * this meta instruction include the following bytecode instructions
 * {invokevirtual}
 * This representation contains information about the bytecode instruction and its context, those information are
 * an InstructionHandle object(BCEL) that contain also information about the instruction as the name), the number of registers used by
 * the method in which this instruction is located, the topStack value of the method at the time this instruction is executed, the number
 * of instruction present in the method were this instruction take place, the number of the instruction in the instructions list of the
 * instruction's method, the method name of the instruction's method, the name of the instruction's class.
 * This representation also contain the representation of the constant pool of the class.
 * This class also contains specific methods for the translation this meta instruction.
 *
 * @author Laffineur Gerome
 */
public class INVOKEVIRTUAL extends InstructionGen {
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.instructions.INVOKEVIRTUAL.";

    /**
     * Constructor of the INVOKEVIRTUAL representation
     * @param ih representation of the bytecode instruction from BCEL library
     * @param opcode opcode of the instruction
     * @param length length of the instruction
     * @param numberOfRegisters number of register used by the instruction's method in the CLP clause
     * @param maxInsPos number of instruction in the instruction's method
     * @param insNumber number of the instruction in the instruction list of the instruction's method
     * @param methName name of instruction's method
     * @param classIndex name of instruction's class
     * @param cp constant pool representation of the instruction's class
     */
    public INVOKEVIRTUAL(InstructionHandle ih, short opcode, short length, int numberOfRegisters,int maxInsPos, int insNumber, String methName, String classIndex, ConstantPool cp, String methArgs) {
        super(ih, opcode, length, numberOfRegisters,maxInsPos, insNumber, methName, classIndex, methArgs);
        this.cp = cp;
        nreads = 0;
        nWrites = 0;
        NEXT_HS_1 = "OHS_CALL";
        NEXT_HEAP_1 =HON;
        RM_NBR = 1;
        RM_ARGS = new String[]{
                HI,
                RV+"1",
                "0",
                "ClassID"};
        INSTRUCTION_ARGS = getInstructionArgs();

        List<String> subclasses = jarInfo.getClassSubClasses(INSTRUCTION_ARGS[0]); //Subclasses of the symbolic ref's declared type
        subclasses.add(INSTRUCTION_ARGS[0]); //Adding the declared type's class in the list of classes to visit (not really a subclass)
        CALLS_NUMBER = subclasses.size();
        CALLS_INFOS = new String[CALLS_NUMBER]; //classes names which contains method's definition for each call
        nRegCall = new int[CALLS_NUMBER];

        int ncall = 0;
        for (String subclass : subclasses) {//Go downstairs in the class hierarchy

            //Getting the closest class from subclass that implements the method..
            for (String supclass : jarInfo.getClassSuperClasses(subclass)) { //Go upstairs in the class hierarchy
                if (jarInfo.containsMethod(supclass, INSTRUCTION_ARGS[1], INSTRUCTION_ARGS[2]) &&
                        !jarInfo.getMthdAbstractFlag(supclass, INSTRUCTION_ARGS[1], INSTRUCTION_ARGS[2])) {
                    CALLS_INFOS[ncall] = supclass;
                    ncall++;
                    break;
                }
            }
        }
            //Init constraints..
            for (int i = 0; i<CALLS_NUMBER; i++){
                CONSTRAINTS_LIST.add(new ArrayList<>());
            }
            for (int cn = 0; cn<CALLS_NUMBER; cn++){
                nreads = jarInfo.getMthdNbrArg(CALLS_INFOS[cn], INSTRUCTION_ARGS[1],INSTRUCTION_ARGS[2]) + 1; //must read objectref plus input args
                nRegCall[cn] = jarInfo.getMthdNbrReg(CALLS_INFOS[cn],INSTRUCTION_ARGS[1],INSTRUCTION_ARGS[2]);
                returnTypeCall = jarInfo.getMthdReturnType(CALLS_INFOS[cn],INSTRUCTION_ARGS[1],INSTRUCTION_ARGS[2]);
                NEXT_STACK_1 = ((!returnTypeCall.equals("void"))?OV:IV);
                int nbrArgs = jarInfo.getMthdNbrArg(CALLS_INFOS[cn], INSTRUCTION_ARGS[1],INSTRUCTION_ARGS[2]) + 1; // +1 for implicit the objectref
            int j = 0;
            for (int i = 1; i <= nbrArgs; i++) {
                CONSTRAINTS.add(WV+i+" = "+RV+i);
                j = i;
            }
            for (int i = j+1; i<=jarInfo.getMthdNbrReg(CALLS_INFOS[cn],INSTRUCTION_ARGS[1],INSTRUCTION_ARGS[2]); i++){
                CONSTRAINTS.add(WV+i+" = 0");
            }
            for (int i = 1; i <= nbrArgs; i++) { //must read objectref plus input args of the method
                CONSTRAINTS.add(RI+i+" = "+SP+" - "+(nbrArgs-i));
            }
            returnTypeCall = jarInfo.getMthdReturnType(CALLS_INFOS[cn],INSTRUCTION_ARGS[1],INSTRUCTION_ARGS[2]);
            if (!returnTypeCall.equals("void")) {
                CONSTRAINTS.add(SPN+" = "+SP+" - "+(nbrArgs-1));
            }else {
                CONSTRAINTS.add(SPN+" = "+SP+" - "+(nbrArgs));
            }
                CONSTRAINTS.add(("ClassID = " + jarInfo.getClassIndex(subclasses.get(cn))));
                CONSTRAINTS_LIST.get(cn).addAll(CONSTRAINTS);
                CONSTRAINTS = new ArrayList<>(); //break dependency
            }
            //Init constraints :OK
    }
}
