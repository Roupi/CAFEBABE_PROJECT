package com.cafebabe.core.instructions;

import exceptions.NotImplementedException;
import org.apache.bcel.generic.InstructionHandle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.cafebabe.core.CafeBabe.jarInfo;
import static com.cafebabe.core.Consts.*;

/**
 * IFCMPONEREAD is the representation of the meta instruction that relate to the act of branching or not toward a given instruction,
 * depending on the result of a comparison or the evaluation of one or two values at the top of the operand stack,
 * this meta instruction include the following bytecode instructions
 * {ifeq, ifge, ifgt, iflt, ifle, ifne, ifnonnull, ifnull}
 * This representation contains information about the bytecode instruction and its context, those information are
 * an InstructionHandle object(BCEL) that contain also information about the instruction as the name), the number of registers used by
 * the method in which this instruction is located, the topStack value of the method at the time this instruction is executed, the number
 * of instruction present in the method were this instruction take place, the number of the instruction in the instructions list of the
 * instruction's method, the method name of the instruction's method, the name of the instruction's class.
 * This class also contains specific methods for the translation this meta instruction.
 *
 * @author Laffineur Gerome
 */
public class IFCMPONEREAD extends InstructionGen{
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.instructions.IFCMPONEREAD.";

    /**
     * Constructor of the IFCMPONEREAD representation
     * @param ih representation of the bytecode instruction from BCEL library
     * @param opcode opcode of the instruction
     * @param length length of the instruction
     * @param numberOfRegisters number of register used by the instruction's method in the CLP clause
     * @param maxInsPos number of instruction in the instruction's method
     * @param insNumber number of the instruction in the instruction list of the instruction's method
     * @param methName name of instruction's method
     * @param classIndex name of instruction's class
     */
    public IFCMPONEREAD(InstructionHandle ih, short opcode, short length, int numberOfRegisters,int maxInsPos, int insNumber, String methName, String classIndex, String methArgs) {
        super(ih, opcode, length, numberOfRegisters,maxInsPos, insNumber, methName, classIndex,methArgs);
        nreads = 1;
        nWrites = 0;
        NEXT_STACK_1 = IV;
        BRANCHS_NUMBER = 2;
        INSTRUCTION_ARGS = getInstructionArgs();
        CONSTRAINTS.add(RI+"1 = "+SP);
        CONSTRAINTS.add(MAJ_SP_DEC);
        CONSTRAINTS_LIST.add(CONSTRAINTS);
        CONSTRAINTS = new ArrayList<>(CONSTRAINTS); //break dependency
        CONSTRAINTS_LIST.add(CONSTRAINTS);
        if (ih.toString().matches(REGEX_IFEQ)) {
            CONSTRAINTS_LIST.get(0).add(RV+"1 \\= 0");
            CONSTRAINTS_LIST.get(1).add(RV+"1 = 0");
        } else if (ih.toString().matches(REGEX_IFNE)) {
            CONSTRAINTS_LIST.get(0).add(RV+"1 = 0");
            CONSTRAINTS_LIST.get(1).add(RV+"1 \\= 0");
        } else if (ih.toString().matches(REGEX_IFLT)) {
            CONSTRAINTS_LIST.get(0).add(RV+"1 >= 0");
            CONSTRAINTS_LIST.get(1).add(RV+"1 < 0");
        } else if (ih.toString().matches(REGEX_IFLE)) {
            CONSTRAINTS_LIST.get(0).add(RV+"1 > 0");
            CONSTRAINTS_LIST.get(1).add(RV+"1 =< 0");
        }  else if (ih.toString().matches(REGEX_IFGT)) {
            CONSTRAINTS_LIST.get(0).add(RV+"1 <= 0");
            CONSTRAINTS_LIST.get(1).add(RV+"1 > 0");
        }  else if (ih.toString().matches(REGEX_IFGE)) {
            CONSTRAINTS_LIST.get(0).add(RV+"1 < 0");
            CONSTRAINTS_LIST.get(1).add(RV+"1 >= 0");
        } else if (ih.toString().matches(REGEX_IFNONNULL)) {
            CONSTRAINTS_LIST.get(0).add(RV+"1 = null");
            CONSTRAINTS_LIST.get(1).add(RV+"1 \\= null");
        } else if (ih.toString().matches(REGEX_IFNULL)) {
            CONSTRAINTS_LIST.get(0).add(RV+"1 \\= null");
            CONSTRAINTS_LIST.get(1).add(RV+"1 = null");
        }
    }
}
