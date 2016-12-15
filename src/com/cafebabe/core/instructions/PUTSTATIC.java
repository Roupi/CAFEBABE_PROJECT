package com.cafebabe.core.instructions;

import exceptions.AttributeNotFoundException;
import exceptions.ClassNotFoundException;
import exceptions.MethodNotFoundException;
import exceptions.NotImplementedException;
import org.apache.bcel.classfile.ConstantPool;
import org.apache.bcel.generic.InstructionHandle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.cafebabe.core.CafeBabe.externalCalls;
import static com.cafebabe.core.CafeBabe.jarInfo;
import static com.cafebabe.core.Consts.*;

/**
 * PUTSTATIC is the representation of the meta instruction that relate to the act of setting a value in a static field of an object present in the memory,
 * this meta instruction include the following bytecode instructions
 * {putstatic}
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
public class PUTSTATIC extends InstructionGen {
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.instructions.PUTFIELD.";

    /**
     * Constructor of the PUTSTATIC representation
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
    public PUTSTATIC(InstructionHandle ih, short opcode, short length, int numberOfRegisters,int maxInsPos, int insNumber, String methName, String classIndex, ConstantPool cp, String methArgs) {
        super(ih, opcode, length, numberOfRegisters,maxInsPos, insNumber, methName, classIndex,methArgs);
        this.cp = cp;
        this.nWrites = 0;
        this.nreads = 1;
        NEXT_HEAP_1 = "HI_NEW";
        INSTRUCTION_ARGS = getInstructionArgs();
        WM_NBR = 1;
        WM_ARGS = new String[WM_NBR][5];
        WM_ARGS[0][0]= HI;
        WM_ARGS[0][1]= "HI_NEW";
        WM_ARGS[0][2]= "-"+jarInfo.getClassIndex(INSTRUCTION_ARGS[0]);
        WM_ARGS[0][3]= String.valueOf(jarInfo.getAttributeNumber(INSTRUCTION_ARGS[0],INSTRUCTION_ARGS[1]));
        WM_ARGS[0][4]= RV+"1";

        CONSTRAINTS.add(RI+"1 = "+SP);
        CONSTRAINTS.add(MAJ_SP_DEC);
        CONSTRAINTS_LIST.add(CONSTRAINTS);
    }
}

