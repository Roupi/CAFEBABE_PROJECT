package com.cafebabe.core.instructions;

import exceptions.ClassNotFoundException;
import exceptions.MethodNotFoundException;
import exceptions.NotImplementedException;
import org.apache.bcel.generic.InstructionHandle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.cafebabe.core.CafeBabe.jarInfo;
import static com.cafebabe.core.Consts.*;

/**
 * LOOKUPSWITCH is the representation of the meta instruction that relate to the act of branching or not toward a given instruction,
 * depending on the result of  the evaluation of one value at the top of the operand stack,
 * this meta instruction include the following bytecode instructions
 * {lookupswitch}
 * This representation contains information about the bytecode instruction and its context, those information are
 * an InstructionHandle object(BCEL) that contain also information about the instruction as the name), the number of registers used by
 * the method in which this instruction is located, the topStack value of the method at the time this instruction is executed, the number
 * of instruction present in the method were this instruction take place, the number of the instruction in the instructions list of the
 * instruction's method, the method name of the instruction's method, the name of the instruction's class.
 * This class also contains specific methods for the translation this meta instruction.
 *
 * @author Laffineur Gerome
 */
public class LOOKUPSWITCH extends InstructionGen{
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.instructions.LOOKUPSWITCH.";


    /**
     * Constructor of the LOOKUPSWITCH representation
     * @param ih representation of the bytecode instruction from BCEL library
     * @param opcode opcode of the instruction
     * @param length length of the instruction
     * @param numberOfRegisters number of register used by the instruction's method in the CLP clause
     * @param maxInsPos number of instruction in the instruction's method
     * @param insNumber number of the instruction in the instruction list of the instruction's method
     * @param methName name of instruction's method
     * @param classIndex name of instruction's class
     */
    public LOOKUPSWITCH(InstructionHandle ih, short opcode, short length, int numberOfRegisters,int maxInsPos, int insNumber, String methName, String classIndex, String methArgs) {
        super(ih, opcode, length, numberOfRegisters,maxInsPos, insNumber, methName, classIndex,methArgs);
        nreads = 1;
        nWrites = 0;
        INSTRUCTION_ARGS = getInstructionArgs();
        BRANCHS_NUMBER = cases.size();

        CONSTRAINTS.add(RI+"1 = "+SP);
        CONSTRAINTS.add(MAJ_SP_DEC);
        for(int i = 0; i<BRANCHS_NUMBER;i++){
            CONSTRAINTS_LIST.add(CONSTRAINTS);
            CONSTRAINTS = new ArrayList<>(CONSTRAINTS); //break dependency
        }
        for(int i = 0; i<BRANCHS_NUMBER-1;i++) {
            CONSTRAINTS_LIST.get(i).add(RV+"1 = "+cases.get(i));
        }


    }



    /**
     *Provide a string representation of the instruction in CLP format
     *
     * @return The horn clause representation of the instruction given his context.
     */
    public String toCLP(){
        Logger logger = LoggerFactory.getLogger(id + "toCLP");
        String clauses = "";
        try {
            for(int i=0; i<cases.size(); i++) {
                clauses = clauses + printHead();
                //String spi = printSPinit();
                String spi = "";
                addInitConstraints();
                String pr = printConstraints(i);
                        //printRegistersMult(numberOfRegisters, topStack, INSTRUCTION_ARGS, ih.toString(),i);
                clauses = clauses + ":-\n" + "         {" +
                        (!spi.equals("") ? (!pr.equals("")) ? spi + "," + pr : spi : (!pr.equals("")) ? pr : "") +
                        "}";
                clauses = clauses + ((nreads > 0) ? ",\n" : "") + printRS() + ((nWrites > 0) ? ",\n" : "\n") + printWS();
                String pc = printBranchs(i);
                clauses = clauses + ((pc.equals("")) ? "." : ",\n" + pc+".\n");
                //If it's the last instruction the method we don't go to the next instruction
                logger.debug("\n" + clauses);
            }
        } catch (Exception e) {
            logger.info("Exeption : " + e.toString());
        }
        return clauses;
    }



}
