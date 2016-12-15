package com.cafebabe.core.instructions;

import exceptions.AttributeNotFoundException;
import exceptions.ClassNotFoundException;
import exceptions.MethodNotFoundException;
import exceptions.NotImplementedException;
import org.apache.bcel.generic.InstructionHandle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.cafebabe.core.CafeBabe.externalCalls;
import static com.cafebabe.core.CafeBabe.jarInfo;
import static com.cafebabe.core.Consts.*;

/**
 * DUP_X1 is the representation of the meta instruction that relate to the duplication of the value at the top of the operand stack,
 * this meta instruction include the following bytecode instructions
 * {dup_x1}
 * This representation contains information about the bytecode instruction and its context, those information are
 * an InstructionHandle object(BCEL) that contain also information about the instruction as the name), the number of registers used by
 * the method in which this instruction is located, the topStack value of the method at the time this instruction is executed, the number
 * of instruction present in the method were this instruction take place, the number of the instruction in the instructions list of the
 * instruction's method, the method name of the instruction's method, the name of the instruction's class.
 * This class also contains specific methods for the translation this meta instruction.
 *
 * @author Laffineur Gerome
 */
public class DUP_X1 extends InstructionGen {
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.instructions.DUP_X1.";

    /**
     * Constructor of the DUP representation
     * @param ih representation of the bytecode instruction from BCEL library
     * @param opcode opcode of the instruction
     * @param length length of the instruction
     * @param numberOfRegisters number of register used by the instruction's method in the CLP clause
     * @param maxInsPos number of instruction in the instruction's method
     * @param insNumber number of the instruction in the instruction list of the instruction's method
     * @param methName name of instruction's method
     * @param classIndex name of instruction's class
     */
    public DUP_X1(InstructionHandle ih, short opcode, short length, int numberOfRegisters,int maxInsPos, int insNumber, String methName, String classIndex, String methArgs) {
        super(ih, opcode, length, numberOfRegisters,maxInsPos, insNumber, methName, classIndex, methArgs);
        this.nreads = 2;
        this.nWrites = 3;
        CONSTRAINTS.add(RI+"1 ="+SP);
        CONSTRAINTS.add(RI+"2 ="+SP_M1);
        CONSTRAINTS.add(WV+"1 ="+RV+"1");
        CONSTRAINTS.add(WV+"2 ="+RV+"2");
        CONSTRAINTS.add(WV+"3 ="+RV+"1");
        CONSTRAINTS.add(WI+"1 ="+SP_M1);
        CONSTRAINTS.add(WI+"2 ="+SP);
        CONSTRAINTS.add(WI+"3 ="+SP_P1);
        CONSTRAINTS.add(MAJ_SP_INC);
        CONSTRAINTS_LIST.add(CONSTRAINTS);
    }
}