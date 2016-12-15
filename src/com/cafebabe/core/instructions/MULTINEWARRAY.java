package com.cafebabe.core.instructions;

import exceptions.*;
import exceptions.ClassNotFoundException;
import org.apache.bcel.classfile.ConstantPool;
import org.apache.bcel.generic.InstructionHandle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import exceptions.NotImplementedException;
import org.apache.bcel.classfile.ConstantPool;
import org.apache.bcel.classfile.Method;
import org.apache.bcel.generic.InstructionHandle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.cafebabe.core.CafeBabe.*;
import static com.cafebabe.core.Consts.*;

/**
 * MULTINEWARRAY is the representation of the meta instruction that relate to the creation of a non initialized array
 * of multiple dimensions in the memory,
 * this meta instruction include the following bytecode instructions
 * {multinewarray}
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
public class MULTINEWARRAY extends InstructionGen {
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.clause.MULTINEWARRAY.";
    /**
     * Constant pool representation of the instruction's class
     */
    private static ConstantPool cp;

    /**
     * Constructor of the MULTINEWARRAY representation
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
    public MULTINEWARRAY(InstructionHandle ih, short opcode, short length, int numberOfRegisters,int maxInsPos, int insNumber, String methName, String classIndex, ConstantPool cp, String methArgs) {
        super(ih, opcode, length, numberOfRegisters,maxInsPos,insNumber, methName, classIndex,methArgs);
        this.cp = cp;
        nWrites = 1;
        INSTRUCTION_ARGS = getInstructionArgs();
        nreads = Integer.valueOf(INSTRUCTION_ARGS[0]);
        NEXT_HS_1 = IHSN;
        WM_NBR = nreads+1;
        NEXT_HEAP_1 ="HI_NEW";
        WM_ARGS = new String[WM_NBR][5];
        //Init field 0 with the ClassID number
        WM_ARGS[0][0] = HI; WM_ARGS[0][1] = (WM_NBR>1)?HI+1:"HI_NEW";
        WM_ARGS[0][2] = IHS; WM_ARGS[0][3] = "-1"; WM_ARGS[0][4] = String.valueOf(nreads);
        System.out.println("FIRST OK");
        //Init other fields of the object to 0 value
        for(int i= 1; i<WM_NBR; i++) {
            System.out.println(" i :" + i);
            WM_ARGS[i][0] = HI+i;
            WM_ARGS[i][1] = (i<WM_NBR-1)?HI+(i+1):"HI_NEW";
            WM_ARGS[i][2] = AREF+i;
            WM_ARGS[i][3] = "-1";
            WM_ARGS[i][4] = RV+i;
        }
        //INIT CONSTRAINTS..
        for (int i = 1; i<=nreads; i++){
            CONSTRAINTS.add(RI+i+" = "+SP+" - "+(nreads-i));
        }
        for (int i = 1; i<=nreads; i++){
            CONSTRAINTS.add(AREF+i+" = "+IHS+"+"+i);
        }
        CONSTRAINTS.add(WI+"1 = "+SP+" - "+(nreads-1));
        CONSTRAINTS.add(WV+"1 = "+IHS);
        CONSTRAINTS.add(IHSN+" = "+IHS+" + "+(nreads+1));
        CONSTRAINTS.add(SPN+" = "+SP+" - "+(nreads-1));
        CONSTRAINTS_LIST.add(CONSTRAINTS);
        //INIT CONSTRAINTS :OK

    }
}

