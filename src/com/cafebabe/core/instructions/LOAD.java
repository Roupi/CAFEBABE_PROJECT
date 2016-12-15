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
 * LOAD is the representation of the meta instruction that relate to pushing a numerical value from a local variable on the top of the stack,
 * this meta instruction include the following bytecode instructions
 * {aload_0,aload_1,aload_2,aload_3,aconst_null, aload, fload, fload_0,fload_1,fload_2,fload_3,
 * iload, iload_0,iload_1,iload_2,iload_3, lload, lload_0,lload_1,lload_2,lload_3}
 * This representation contains information about the bytecode instruction and its context, those information are
 * an InstructionHandle object(BCEL) that contain also information about the instruction as the name), the number of registers used by
 * the method in which this instruction is located, the topStack value of the method at the time this instruction is executed, the number
 * of instruction present in the method were this instruction take place, the number of the instruction in the instructions list of the
 * instruction's method, the method name of the instruction's method, the name of the instruction's class.
 * This class also contains specific methods for the translation this meta instruction.
 *
 * @author Laffineur Gerome
 */
public class LOAD extends InstructionGen {
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.instructions.LOAD.";

    /**
     * Constructor of the LOAD representation
     * @param ih representation of the bytecode instruction from BCEL library
     * @param opcode opcode of the instruction
     * @param length length of the instruction
     * @param numberOfRegisters number of register used by the instruction's method in the CLP clause
     * @param maxInsPos number of instruction in the instruction's method
     * @param insNumber number of the instruction in the instruction list of the instruction's method
     * @param methName name of instruction's method
     * @param classIndex name of instruction's class
     */
    public LOAD(InstructionHandle ih, short opcode, short length, int numberOfRegisters,int maxInsPos, int insNumber, String methName, String classIndex, String methArgs) {
        super(ih, opcode, length, numberOfRegisters,maxInsPos, insNumber, methName, classIndex,methArgs);
        nreads = 1;
        nWrites = 1;
        INSTRUCTION_ARGS = getInstructionArgs();
        if (ih.toString().matches(REGEX_LOAD_N) || ih.toString().matches(REGEX_LOAD)) {
            CONSTRAINTS.add(RI+"1 = "+INSTRUCTION_ARGS[0]);
            CONSTRAINTS.add(WV+"1 = "+RV+"1");
            CONSTRAINTS.add(WI+"1 = "+SP_P1);
            CONSTRAINTS.add(MAJ_SP_INC);
        } else if (ih.toString().matches(REGEX_ACONST)) { //TODO : 1 read en trop pour le aconst, à corriger.
            CONSTRAINTS.add(WI+"1 = "+SP_P1);
            CONSTRAINTS.add(WV+"1 = "+INSTRUCTION_ARGS[0]);
        }
        CONSTRAINTS_LIST.add(CONSTRAINTS);
    }
}


