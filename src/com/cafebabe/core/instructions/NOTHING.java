package com.cafebabe.core.instructions;

import exceptions.NotImplementedException;
import org.apache.bcel.generic.InstructionHandle;

import static com.cafebabe.core.Consts.IV;
import static com.cafebabe.core.Consts.MAJ_SP_ID;

/**
 * NOTHING is the representation of the meta instruction that have no effect in the CLP representation,
 * this meta instruction include the following bytecode instructions
 * {nop,pop,pop2}
 * This representation contains information about the bytecode instruction and its context, those information are
 * an InstructionHandle object(BCEL) that contain also information about the instruction as the name), the number of registers used by
 * the method in which this instruction is located, the topStack value of the method at the time this instruction is executed, the number
 * of instruction present in the method were this instruction take place, the number of the instruction in the instructions list of the
 * instruction's method, the method name of the instruction's method, the name of the instruction's class.
 * This class also contains specific methods for the translation this meta instruction.
 *
 * @author Laffineur Gerome
 */
public class NOTHING extends InstructionGen {
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.instructions.NOTHING.";

    /**
     * Constructor of the NOTHING representation
     * @param ih representation of the bytecode instruction from BCEL library
     * @param opcode opcode of the instruction
     * @param length length of the instruction
     * @param numberOfRegisters number of register used by the instruction's method in the CLP clause
     * @param maxInsPos number of instruction in the instruction's method
     * @param insNumber number of the instruction in the instruction list of the instruction's method
     * @param methName name of instruction's method
     * @param classIndex name of instruction's class
     */
    public NOTHING(InstructionHandle ih, short opcode, short length, int numberOfRegisters,int maxInsPos, int insNumber, String methName, String classIndex, String methArgs) {
        super(ih, opcode, length, numberOfRegisters,maxInsPos,insNumber, methName, classIndex,methArgs);
        nreads = 0;
        nWrites = 0;
        NEXT_STACK_1 = IV;
        CONSTRAINTS.add(MAJ_SP_ID);
        CONSTRAINTS_LIST.add(CONSTRAINTS);
    }
}

