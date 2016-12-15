package com.cafebabe.core.instructions;

import exceptions.NotImplementedException;
import org.apache.bcel.Const;
import org.apache.bcel.classfile.ConstantPool;
import org.apache.bcel.classfile.Method;
import org.apache.bcel.generic.Instruction;
import org.apache.bcel.generic.InstructionHandle;
import org.apache.bcel.generic.Visitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.cafebabe.core.CafeBabe.jarInfo;
import static com.cafebabe.core.Consts.*;
import static com.cafebabe.core.instructions.InstructionTools.translateArgs;

/**
 * PATTERN_INITVAR is the representation of the block of meta-instruction that matches the pattern of initialising a variable.
 *
 * @author Laffineur Gerome
 */
public class PATTERN_INITVAR extends InstructionGen {
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.instructions.PATTERN_INITVAR.";

    /**
     * List of pattern's instrcutions
     */
    private InstructionHandle[] instlist;

    /**
     * Constant pool of the class
     */
    private ConstantPool cp;




    /**
     * Constructor of the INITIALISATION OF VARIABLE PATTERN representation
     */
    public PATTERN_INITVAR(InstructionHandle ih, short opcode, short length, int numberOfRegisters,int maxInsPos, int insNumber, String methName, String classIndex, ConstantPool cp, String methArgs, Method method, InstructionHandle[] instList) {
        super(ih, opcode, length, numberOfRegisters,maxInsPos, insNumber, methName, classIndex,methArgs);
        Logger logger = LoggerFactory.getLogger(id + "PATTERN_INITVAR");
            this.instlist = instList;
            this.className = classIndex;
            this.methName = method.getName();
            this.methArgs = translateArgs(method.getArgumentTypes());
            this.numberOfRegisters = method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack();
            this.cp = method.getConstantPool();
            NEXT_STACK_1 = IV;
            NEXT_INST_JUMP = 2;
            CONSTRAINTS_LIST = new ArrayList<>();
            CONSTRAINTS = new ArrayList<>();
            CONSTRAINTS.add(SPN+" = "+SP);
            CONSTRAINTS_LIST.add(CONSTRAINTS);
    }

    private int[] getCstDest(){
        int[] sd = new int[2];
        String pattern;
        Pattern r;
        Matcher m;
        //Constant
        if (instlist[0].toString().matches(REGEX_CONST_N)) {
            pattern = REGEX_CONST_N;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[0].toString());
            m.matches();
            sd[0] = Integer.parseInt(m.group(3));
        } else if (instlist[0].toString().matches(REGEX_CONSTM1)) {
            sd[0] = -1;
        } else if (instlist[0].toString().matches(REGEX_BIPUSH)) {
            pattern = REGEX_BIPUSH;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[0].toString());
            m.matches();
            sd[0] = Integer.parseInt(m.group(3));
        } else if (instlist[0].toString().matches(REGEX_LDC)){
            pattern = REGEX_LDC;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[0].toString());
            m.matches();
            String constant = cp.getConstant(Integer.parseInt(m.group(3))).toString();
            pattern = REGEX_CONSTANT_DOUBLE_LONG_FLOAT;
            r = Pattern.compile(pattern);
            m = r.matcher(constant);
            m.matches();
            Float f  = Float.valueOf(m.group(2));
            int i = f.intValue();
            sd[0] = Integer.parseInt((f.floatValue() == i)? String.valueOf(i) : String.valueOf(f)); //IF int of form x.0, return x
        }



        //LocalVar number
        if (instlist[1].toString().matches(REGEX_STORE_N)) {
            pattern = REGEX_STORE_N;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[1].toString());
            m.matches();
            sd[1] = Integer.parseInt(m.group(3));
        } else if (instlist[1].toString().matches(REGEX_STORE)) {
            pattern = REGEX_STORE;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[1].toString());
            m.matches();
            sd[1] = Integer.parseInt(m.group(3));
        }

        return sd;
    }

    @Override
    public String toCLP(){
        Logger logger = LoggerFactory.getLogger(id + "toCLP");
        String clauses = "";
            clauses = printHead();
            int[] sd = getCstDest();
            NEXT_NUM_RES_REG = sd[1];
            NEXT_RES_REG = String.valueOf(sd[0]);
            addInitConstraints();
            clauses  = clauses + ":-\n" + "         {"+ printConstraints(0)+"}";
            clauses = clauses + ",\n"+ printNextIns();
            clauses = clauses+".\n";
            logger.debug("\n" + clauses);
        return clauses;
    }

}

