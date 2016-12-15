package com.cafebabe.core.instructions;

import exceptions.AttributeNotFoundException;
import exceptions.ClassNotFoundException;
import exceptions.MethodNotFoundException;
import exceptions.NotImplementedException;
import org.apache.bcel.generic.Instruction;
import org.apache.bcel.generic.InstructionHandle;
import org.apache.bcel.generic.Visitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.cafebabe.core.CafeBabe.externalCalls;
import static com.cafebabe.core.CafeBabe.jarInfo;
import static com.cafebabe.core.Consts.*;

/**
 * STORE is the representation of the meta instruction that relate to the act of setting a numerical value into a local variable,
 * this meta instruction include the following bytecode instructions
 * {astore_0,astore_1,astore_2,astore_3, astore, dstore, dstore_0,dstore_1,dstore_2,dstore_3,fstore,fstore_0,
 * fstore_1,fstore_2,fstore_3,istore, istore_0, istore_1, istore_2, istore_3,lstore,lstore_0,lstore_1,lstore_2,lstore_3}
 * This representation contains information about the bytecode instruction and its context, those information are
 * an InstructionHandle object(BCEL) that contain also information about the instruction as the name), the number of registers used by
 * the method in which this instruction is located, the topStack value of the method at the time this instruction is executed, the number
 * of instruction present in the method were this instruction take place, the number of the instruction in the instructions list of the
 * instruction's method, the method name of the instruction's method, the name of the instruction's class.
 * This class also contains specific methods for the translation this meta instruction.
 *
 * @author Laffineur Gerome
 */
public class STORE extends InstructionGen {
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.instructions.STORE.";

    /**
     * Constructor of the STORE representation
     * @param ih representation of the bytecode instruction from BCEL library
     * @param opcode opcode of the instruction
     * @param length length of the instruction
     * @param numberOfRegisters number of register used by the instruction's method in the CLP clause
     * @param maxInsPos number of instruction in the instruction's method
     * @param insNumber number of the instruction in the instruction list of the instruction's method
     * @param methName name of instruction's method
     * @param classIndex name of instruction's class
     */
    public STORE(InstructionHandle ih, short opcode, short length, int numberOfRegisters,int maxInsPos,int insNumber, String methName, String classIndex, String methArgs) {
        super(ih, opcode, length, numberOfRegisters,maxInsPos,insNumber, methName, classIndex,methArgs);
        nreads = 1;
        nWrites = 1;
        INSTRUCTION_ARGS = getInstructionArgs();
        CONSTRAINTS.add(RI+"1 = "+SP);
        CONSTRAINTS.add(WV+"1 = "+RV+"1");
        CONSTRAINTS.add(WI+"1 = "+INSTRUCTION_ARGS[0]);
        CONSTRAINTS.add(MAJ_SP_DEC);
        CONSTRAINTS_LIST.add(CONSTRAINTS);
    }
}