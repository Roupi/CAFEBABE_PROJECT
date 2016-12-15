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
 * PATTERN_BINOP is the representation of the block of meta-instruction that matches the pattern of binary operator execution.
 *(addition,substration,modulo,division,multiplication)
 * @author Laffineur Gerome
 */
public class PATTERN_BINOP extends InstructionGen {
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.instructions.PATTERN_BINOP.";

    /**
     * List of pattern's instrcutions
     */
    private InstructionHandle[] instlist;

    /**
     * Constant pool of the class
     */
    private ConstantPool cp;

    /**
     * Indicate if the operation contains constantLoad on the right(1) or on the left(2), or any(0)
     */
    private int constPos = 0;




    /**
     * Constructor of the INITIALISATION OF VARIABLE PATTERN representation
     */
    public PATTERN_BINOP(InstructionHandle ih, short opcode, short length, int numberOfRegisters,int maxInsPos, int insNumber, String methName, String classIndex, ConstantPool cp, String methArgs, Method method, InstructionHandle[] instList) {
        super(ih, opcode, length, numberOfRegisters,maxInsPos, insNumber, methName, classIndex,methArgs);
        Logger logger = LoggerFactory.getLogger(id + "PATTERN_BINOP");
        try{
            this.instlist = instList;
            this.className = classIndex;
            this.methName = method.getName();
            this.methArgs = translateArgs(method.getArgumentTypes());
            this.numberOfRegisters = method.getLocalVariableTable().getTableLength()+method.getCode().getMaxStack();
            this.cp = method.getConstantPool();
            NEXT_STACK_1 = "IV";
            NEXT_RES_REG = "RES";
            NEXT_INST_JUMP = 4;
            CONSTRAINTS_LIST = new ArrayList<>();
            CONSTRAINTS = new ArrayList<>();
            CONSTRAINTS.add(SPN+" = "+SP);
            CONSTRAINTS_LIST.add(CONSTRAINTS);
        } catch(Exception e){
            logger.info("Exception : " + e.toString());
        }
    }

    private int[] getCstDest(){
        int[] sd = new int[3];
        String pattern;
        Pattern r;
        Matcher m;
        //Source 1
        if (instlist[0].toString().matches(REGEX_LOAD_N)) {
            pattern = REGEX_LOAD_N;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[0].toString());
            m.matches();
            sd[0] = Integer.parseInt(m.group(3));
        } else if (instlist[0].toString().matches(REGEX_LOAD)) {
            pattern = REGEX_LOAD;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[0].toString());
            m.matches();
            sd[0] = Integer.parseInt(m.group(3));
        } else if (instlist[0].toString().matches(REGEX_CONST_N)) {
            pattern = REGEX_CONST_N;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[0].toString());
            m.matches();
            sd[0] = Integer.parseInt(m.group(3));
            constPos = 1;
        } else if (instlist[0].toString().matches(REGEX_CONSTM1)) {
            sd[0] = -1;
            constPos = 1;
        } else if (instlist[0].toString().matches(REGEX_BIPUSH)) {
            pattern = REGEX_BIPUSH;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[0].toString());
            m.matches();
            sd[0] = Integer.parseInt(m.group(3));
            constPos = 1;
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
            constPos = 1;
        }

        //Source 2
        if (instlist[1].toString().matches(REGEX_LOAD_N)) {
            pattern = REGEX_LOAD_N;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[1].toString());
            m.matches();
            sd[1] = Integer.parseInt(m.group(3));
        } else  if (instlist[1].toString().matches(REGEX_LOAD)) {
            pattern = REGEX_LOAD;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[1].toString());
            m.matches();
            sd[1] = Integer.parseInt(m.group(3));
        } else if (instlist[1].toString().matches(REGEX_CONST_N)) {
            pattern = REGEX_CONST_N;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[1].toString());
            m.matches();
            sd[1] = Integer.parseInt(m.group(3));
            constPos = 2;
        } else if (instlist[1].toString().matches(REGEX_CONSTM1)) {
            sd[1] = -1;
            constPos = 2;
        } else if (instlist[1].toString().matches(REGEX_BIPUSH)) {
            pattern = REGEX_BIPUSH;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[1].toString());
            m.matches();
            sd[1] = Integer.parseInt(m.group(3));
            constPos = 2;
        } else if (instlist[1].toString().matches(REGEX_LDC)){
            pattern = REGEX_LDC;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[1].toString());
            m.matches();
            String constant = cp.getConstant(Integer.parseInt(m.group(3))).toString();
            pattern = REGEX_CONSTANT_DOUBLE_LONG_FLOAT;
            r = Pattern.compile(pattern);
            m = r.matcher(constant);
            m.matches();
            Float f  = Float.valueOf(m.group(2));
            int i = f.intValue();
            sd[1] = Integer.parseInt((f.floatValue() == i)? String.valueOf(i) : String.valueOf(f)); //IF int of form x.0, return x
            constPos = 2;
        }

        //DEST
        if (instlist[3].toString().matches(REGEX_STORE_N)) {
            pattern = REGEX_STORE_N;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[3].toString());
            m.matches();
            sd[2] = Integer.parseInt(m.group(3));
        } else if (instlist[3].toString().matches(REGEX_STORE)) {
            pattern = REGEX_STORE;
            r = Pattern.compile(pattern);
            m = r.matcher(instlist[3].toString());
            m.matches();
            sd[2] = Integer.parseInt(m.group(3));
        }

        return sd;
    }

    @Override
    public String toCLP(){
        Logger logger = LoggerFactory.getLogger(id + "toCLP");
        String clauses = "";
            clauses = printHead();
            int[] sd = getCstDest();
            NEXT_NUM_RES_REG = sd[2];
            addInitConstraints();
            String op = getOperator();
            switch(constPos){
                case 0 :
                    clauses  = clauses + ":-\n" + "         {"+
                            "RES = IV"+sd[0]+op+"IV"+sd[1]+",";
                    break;
                case 1 :
                    clauses  = clauses + ":-\n" + "         {"+
                            "RES = "+sd[0]+op+"IV"+sd[1]+",";
                    break;
                case 2 :
                    clauses  = clauses + ":-\n" + "         {"+
                            "RES = IV"+sd[0]+op+sd[1]+",";
                    break;
            }
            clauses = clauses + printConstraints(0) + "}";
            clauses = clauses + ",\n"+ printNextIns();
            clauses = clauses+".\n";
            logger.debug("\n" + clauses);
        return clauses;
    }

    private String getOperator(){
        String op = "";

        switch(instlist[2].getInstruction().getName()){
            case "dadd":case "fadd":case "iadd":case "ladd":
                op = "+";
                break;

            case "dsub":case "fsub":case "isub":case "lsub":
                op = "-";
                break;
            case "dmul":case "fmul" :case "imul":case "lmul":
                op = "*";
                break;
            case "ddiv":case "fdiv" :case "idiv":case "ldiv":
                op = "//";
                break;
            case "drem":case "frem" :case "irem":case "lrem":
                op = "mod";
                break;

        }

        return op;
    }

}

