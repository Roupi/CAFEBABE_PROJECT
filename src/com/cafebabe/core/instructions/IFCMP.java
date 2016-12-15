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
 * IFCMP is the representation of the meta instruction that relate to the act of branching or not toward a given instruction,
 * depending on the result of a comparison or the evaluation of one or two values at the top of the operand stack,
 * this meta instruction include the following bytecode instructions
 * {if_acmpeq, if_acmpne, if_icmpeq, if_icmpne, if_icmplt, if_icmpge, if_icmpgt, if_icmple}
 * This representation contains information about the bytecode instruction and its context, those information are
 * an InstructionHandle object(BCEL) that contain also information about the instruction as the name), the number of registers used by
 * the method in which this instruction is located, the topStack value of the method at the time this instruction is executed, the number
 * of instruction present in the method were this instruction take place, the number of the instruction in the instructions list of the
 * instruction's method, the method name of the instruction's method, the name of the instruction's class.
 * This class also contains specific methods for the translation this meta instruction.
 *
 * @author Laffineur Gerome
 */
public class IFCMP extends InstructionGen{
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.instructions.IFCMP.";

    /**
     * Constructor of the IFCMP representation
     * @param ih representation of the bytecode instruction from BCEL library
     * @param opcode opcode of the instruction
     * @param length length of the instruction
     * @param numberOfRegisters number of register used by the instruction's method in the CLP clause
     * @param maxInsPos number of instruction in the instruction's method
     * @param insNumber number of the instruction in the instruction list of the instruction's method
     * @param methName name of instruction's method
     * @param classIndex name of instruction's class
     */
    public IFCMP(InstructionHandle ih, short opcode, short length, int numberOfRegisters,int maxInsPos, int insNumber, String methName, String classIndex, String methArgs) {
        super(ih, opcode, length, numberOfRegisters,maxInsPos, insNumber, methName, classIndex,methArgs);
        nreads = 2;
        nWrites = 0;
        NEXT_STACK_1 = IV;
        NEXT_STACK_2 = NV;
        BRANCHS_NUMBER = 2;
        INSTRUCTION_ARGS = getInstructionArgs();
        //Init constraints..
        CONSTRAINTS.add(RI+"1 = "+SP);
        CONSTRAINTS.add(RI+"2 = "+SP_M1);
        CONSTRAINTS.add(SPN+" = "+SP+" - 2");
        CONSTRAINTS_LIST.add(CONSTRAINTS);
        CONSTRAINTS = new ArrayList<>(CONSTRAINTS); //break dependency
        CONSTRAINTS_LIST.add(CONSTRAINTS);
        if (ih.toString().matches(REGEX_IFCMPEQ)) {
            CONSTRAINTS_LIST.get(0).add(RV+"2 \\= "+RV+1);
            CONSTRAINTS_LIST.get(1).add(RV+"2 = "+RV+1);
        }else if (ih.toString().matches(REGEX_IFCMPNE)) {
            CONSTRAINTS_LIST.get(0).add(RV+"2 = "+RV+1);
            CONSTRAINTS_LIST.get(1).add(RV+"2 \\= "+RV+1);
        } else if (ih.toString().matches(REGEX_IFCMPLT)) {
            CONSTRAINTS_LIST.get(0).add(RV+"2 >= "+RV+1);
            CONSTRAINTS_LIST.get(1).add(RV+"2 < "+RV+1);
        } else if (ih.toString().matches(REGEX_IFCMPLE)) {
            CONSTRAINTS_LIST.get(0).add(RV+"2 > "+RV+1);
            CONSTRAINTS_LIST.get(1).add(RV+"2 =< "+RV+1);
        } else if (ih.toString().matches(REGEX_IFCMPGT)) {
            CONSTRAINTS_LIST.get(0).add(RV+"2 =< "+RV+1);
            CONSTRAINTS_LIST.get(1).add(RV+"2 > "+RV+1);
        } else if (ih.toString().matches(REGEX_IFCMPGE)) {
            CONSTRAINTS_LIST.get(0).add(RV+"2 < "+RV+1);
            CONSTRAINTS_LIST.get(1).add(RV+"2 >= "+RV+1);
        }
        //Init constraints :OK
    }
}
