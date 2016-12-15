package com.cafebabe.core.instructions;

import exceptions.AttributeNotFoundException;
import exceptions.ClassNotFoundException;
import exceptions.MethodNotFoundException;
import exceptions.NotImplementedException;
import org.apache.bcel.classfile.ConstantPool;
import org.apache.bcel.generic.InstructionHandle;
import org.omg.CORBA.DynAnyPackage.InvalidValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.cafebabe.core.CafeBabe.*;
import static com.cafebabe.core.Consts.*;

/**
 * INVOKESTATIC is the representation of the meta instruction that relate to the invocation of particular instance method
 * as init, private methods and methods called with the super keyword.
 * this meta instruction include the following bytecode instructions
 * {invokestatic}
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
public class INVOKESTATIC extends InstructionGen {
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.instructions.INVOKESTATIC.";

    /**
     * Constructor of the INVOKESTATIC representation
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
    public INVOKESTATIC(InstructionHandle ih, short opcode, short length, int numberOfRegisters,int maxInsPos, int insNumber, String methName, String classIndex, ConstantPool cp, String methArgs) {
        super(ih, opcode, length, numberOfRegisters,maxInsPos, insNumber, methName, classIndex,methArgs);
        this.cp = cp;
        nWrites = 0;
        nRegCall = new int[1];
        INSTRUCTION_ARGS = getInstructionArgs();
        nreads = jarInfo.getMthdNbrArg(INSTRUCTION_ARGS[0], INSTRUCTION_ARGS[1],INSTRUCTION_ARGS[2]); //must read objectref plus input args
        nRegCall[0] = jarInfo.getMthdNbrReg(INSTRUCTION_ARGS[0],INSTRUCTION_ARGS[1],INSTRUCTION_ARGS[2]);
        returnTypeCall = jarInfo.getMthdReturnType(INSTRUCTION_ARGS[0],INSTRUCTION_ARGS[1],INSTRUCTION_ARGS[2]);
        NEXT_STACK_1 = ((!returnTypeCall.equals("void"))?OV:IV);
        NEXT_HS_1 = "OHS_CALL";
        NEXT_HEAP_1 =HON;
        CALLS_NUMBER = 1;
        CALLS_INFOS = new String[]{INSTRUCTION_ARGS[0]};

        //Init constraints..
            int nbrArgs = jarInfo.getMthdNbrArg(CALLS_INFOS[0], INSTRUCTION_ARGS[1],INSTRUCTION_ARGS[2]);
            int j = 0;
            for (int i = 1; i <= nbrArgs; i++) {
                CONSTRAINTS.add(WV+i+" = "+RV+i);
                j = i;
            }
            for (int i = j+1; i<=nRegCall[0]; i++){
                CONSTRAINTS.add(WV+i+" = 0");
            }
            for (int i = 1; i <= nbrArgs; i++) { //must read objectref plus input args of the method
                CONSTRAINTS.add(RI+i+" = "+SP+" - "+(nbrArgs-i));
            }
            if (!returnTypeCall.equals("void")) {
                CONSTRAINTS.add(SPN+" = "+SP+" - "+(nbrArgs-1));
            }else {
                CONSTRAINTS.add(SPN+" = "+SP+" - "+(nbrArgs));
            }
        CONSTRAINTS_LIST.add(CONSTRAINTS);
        //Init constraints :OK
    }
}
