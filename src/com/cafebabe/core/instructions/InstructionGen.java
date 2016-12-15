package com.cafebabe.core.instructions;

import com.cafebabe.core.JarInfo;
import exceptions.AttributeNotFoundException;
import exceptions.ClassNotFoundException;
import exceptions.MethodNotFoundException;
import exceptions.NotImplementedException;
import org.apache.bcel.classfile.ConstantPool;
import org.apache.bcel.generic.Instruction;
import org.apache.bcel.generic.InstructionHandle;
import org.apache.bcel.generic.Visitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.cafebabe.core.CafeBabe.externalCalls;
import static com.cafebabe.core.CafeBabe.jarInfo;
import static com.cafebabe.core.CafeBabe.last_args;
import static com.cafebabe.core.Consts.*;
import static com.cafebabe.core.Consts.REGEX_CONSTANT_DOUBLE_LONG_FLOAT;
import static com.cafebabe.core.Consts.REGEX_LDC;

/**
 * InstructionGen is the representation of the meta-meta instruction that contains general information about a bytecode instruction.
 *This class contains all methods related to the construction of CLP clause's parts.
 * This representation contains information about the bytecode instruction and its context, those information are
 * an InstructionHandle object(BCEL) that contain also information about the instruction as the name), the number of registers used by
 * the method in which this instruction is located, the topStack value of the method at the time this instruction is executed, the number
 * of instruction present in the method were this instruction take place, the number of the instruction in the instructions list of the
 * instruction's method, the method name of the instruction's method, the name of the instruction's class.
 * This class also contains general methods for the translation the specialized meta instructions that extends InstructionGen.
 *
 * @author Laffineur Gerome
 */
public abstract class InstructionGen extends Instruction {
    /**
     * ID used for the logger
     */
    private static final String id = "com.cafebabe.core.instructions.InstructionGen.";
    /**
     * number of registers used by the method in which this instruction is located
     */
    protected int numberOfRegisters;
    /**
     * instruction representation from BCEL library
     */
    protected InstructionHandle ih;
    /**
     * the size of the instructions list of the instruction's method
     */
    protected int maxInsPos;
    /**
     * the number of the instruction in the instructions list of the instruction's method
     */
    protected int insNumber;
    /**
     * the name of the instruction's method
     */
    protected String methName;
    /**
     * the name of the instruction's class
     */
    protected String className;

    /**
     * number of read call for the instruction
     */
    protected  int nreads;

    /**
     * number of write call for the instruction
     */
    protected  int nWrites;

    /**
     * Args of the method that holds the instruction
     */
    protected  String methArgs;
    /**
     * Determine the return type of the call if instruction contains a call
     */
    protected String returnTypeCall;
    /**
     *Indentation used in CLP clauses display
     */
    protected String HSPACE = "         ";

    /**
     * Name of the input stack for the next instruction call
     */
    protected String NEXT_STACK_1;
    /**
     * Name of the output stack for the next instruction call
     */
    protected String NEXT_STACK_2;

    /**
     * Name of the input heap size for the next instruction call
     */
    protected String NEXT_HS_1;
    /**
     * Name of the input heap for the next instruction call
     */
    protected String NEXT_HEAP_1;

    /**
     * Name of the output for the next instruction call
     */
    protected String NEXT_HEAP_2;
    /**
     * In optimised pattern for operation case :
     * Number of the register that take the result value of the operation
     */
    protected int NEXT_NUM_RES_REG;
    /**
     * In optimised pattern
     * Name of register that represent the result of the pattern
     */
    protected String NEXT_RES_REG;
    /**
     * Number of instructions to jump after the current instruction
     * Always 1 except for optimised patterns cases that groups multiple instructions
     */
    protected  int NEXT_INST_JUMP;
    /**
     * Number of memory's(heap) reads for the current instruction
     */
    protected  int RM_NBR;
    /**
     * Number of memory's(heap) writes for the current instruction
     */
    protected  int WM_NBR;
    /**
     * Values to put in readMemory clause
     */
    protected String[] RM_ARGS;
    /**
     * Values to put in writeMemory clause
     */
    protected String[][] WM_ARGS;
    /**
     * Arguments of the bytecode instruction
     */
    protected String[] INSTRUCTION_ARGS;
    /**
     * Number of calls in the instruction's clause(invoke..)
     */
    protected int CALLS_NUMBER;
    /**
     * Sources of classes to match for lookup method
     */
    protected String[] CALLS_INFOS;
    /**
     * Number of register in each call clause of the instruction
     */
    protected static int[] nRegCall;
    /**
     * Number of branch to other point of the method in the instruction (if,compare,goto,..)
     */
    protected static int BRANCHS_NUMBER;
    /**
     * List of Constraints of the clauses that represent the instruction
     */
    protected List<List<String>> CONSTRAINTS_LIST;
    /**
     * Used to construct CONSTRAINTS_LIST
     */
    protected List<String> CONSTRAINTS;
    /**
     * Constant pool of the method
     */
    protected ConstantPool cp;
    /**
     * Cases values
     */
    protected List<Integer> cases = new ArrayList<>();





    /**
     * Constructor of the InstructionGen representation
     * (Initialise all defaults values)
     * @param ih representation of the bytecode instruction from BCEL library
     * @param opcode opcode of the instruction
     * @param length length of the instruction
     * @param numberOfRegisters number of register used by the instruction's method in the CLP clause
     * @param maxInsPos number of instruction in the instruction's method
     * @param insNumber number of the instruction in the instruction list of the instruction's method
     * @param methName name of instruction's method
     * @param className name of the class
     */
    public InstructionGen(InstructionHandle ih, short opcode, short length, int numberOfRegisters,int maxInsPos,int insNumber, String methName, String className, String methArgs) {
        super(opcode, length);
        this.numberOfRegisters = numberOfRegisters;
        this.ih = ih;
        this.maxInsPos = maxInsPos;
        this.insNumber = insNumber;
        this.methName = methName;
        this.className = className;
        this.methArgs = methArgs;
        NEXT_STACK_1 = "OV";
        NEXT_STACK_2 = "NV";
        NEXT_HS_1 = "IHS";
        NEXT_NUM_RES_REG = -1;
        NEXT_RES_REG = "";
        NEXT_INST_JUMP = 1;
        NEXT_HEAP_1 = HI;
        NEXT_HEAP_2 = HO;
        RM_NBR = 0;
        WM_NBR = 0;
        RM_ARGS = null;
        WM_ARGS = null;
        INSTRUCTION_ARGS = null;
        nWrites = 0;
        nreads =0;
        nRegCall = null;
        CALLS_NUMBER = 0;
        CALLS_INFOS = null;
        BRANCHS_NUMBER = 0;
        returnTypeCall = "";
        CONSTRAINTS_LIST = new ArrayList<>();
        CONSTRAINTS = new ArrayList<>();
        cases = null;
    }


    @Override
    public void accept(Visitor visitor) {

    }

    /**
     *Provide a string representation of the instruction in CLP format
     * @return The horn clause representation of the instruction given his context.
     */
    public String toCLP() {
        Logger logger = LoggerFactory.getLogger(id + "toCLP");
        String clauses = "";
        String printhead = "";
        String thirdPart = "";
            addInitConstraints();
            for (int i = 0; i < CONSTRAINTS_LIST.size(); i++) {
                printhead = printHead();
                clauses = clauses + printhead;
                clauses = clauses + ":-\n" + HSPACE + "{" + printConstraints(i) + "}";
                clauses = clauses + ((nreads > 0) ? ",\n" : "") + printRS() + ((nWrites > 0) ? ",\n" : "\n") + printWS();
                String wm = printWM();
                clauses = clauses + ((wm.equals("")) ? "" : ",\n" + wm);
                String rm = printRM();
                clauses = clauses + ((rm.equals("")) ? "" : ",\n" + rm);
                String pc = printCalls(i);
                clauses = clauses + ((pc.equals("")) ? "" : ",\n" + pc);
                String pb = printBranchs(i);
                clauses = clauses + ((pb.equals("")) ? "" : ",\n" + pb);
                //If it's the last instruction the method we don't go to the next instruction
                thirdPart = (this.maxInsPos == this.insNumber) ? "" : printNextIns();
                clauses = clauses + ((thirdPart.equals("")) ? "" : (",\n" + thirdPart));
                clauses = clauses + ".\n";
                logger.debug("\n" + clauses);
            }
        return clauses;
    }


    /**
     * Print the constraint part of the clause
     * @param numClause number of the clause in the instruction clause's representation
     * @return
     */
    public String printConstraints(int numClause){
        String c = "";
        int constraint_size = CONSTRAINTS_LIST.get(numClause).size();
        int i = 0;
        for(String item : CONSTRAINTS_LIST.get(numClause)){
            c = c + item;
            i++;
            if (i < constraint_size) c = c +",";
        }
        return c;
    }

    /**
     * Print the call part of the clause
     * @param numCall number of the clause in the instruction clause's representation
     * @return
     */
    public String printCalls(int numCall){
        String call = "";
            if (CALLS_NUMBER > 0) {
                call = HSPACE+"p" + jarInfo.getClassIndex(CALLS_INFOS[numCall]) + "_" +
                        jarInfo.getMthdIndex(CALLS_INFOS[numCall], INSTRUCTION_ARGS[1], INSTRUCTION_ARGS[2]) + "_0(";
                for (int i = 1; i <= nRegCall[numCall]; i++) {
                    call = call + WV + i;
                    call = call + ",";
                }
                for (int i = 0; i < nRegCall[numCall]; i++) {
                    call = call + "_";
                    if (i != nRegCall[numCall] - 1) call = call + ",";
                }
                call = call + ",SP_INDEX_CALL,IHS,OHS_CALL,"+HI+","+HON+",R_NEW)";
                //If return type of the call is not void, must associate a write stack predicate to push the result
                //of the call in the caller's stack
                if (!returnTypeCall.equals("void")) { //push R on the stack
                    call = call +",\n"+HSPACE+"write_" + jarInfo.getMthdIndex(className, methName,methArgs) + "("+SPN+",";
                    for (int j = 0; j < this.numberOfRegisters; j++) {
                        call = call + IV + j + ",";
                    }
                    for (int j = 0; j < this.numberOfRegisters; j++) {
                        call = call + OV + j + ",";
                    }
                    call = call +"R_NEW)\n";
                }
            }
        return call;
    }

    /**
     * Print branching part of the clause
     * @param numBranch  number of the clause in the instruction clause's representation
     * @return
     */
    public String printBranchs(int numBranch){
        String branch = "";
        if(BRANCHS_NUMBER > 0) {
            branch = HSPACE+"p" + jarInfo.getClassIndex(className) + "_" +
                    jarInfo.getMthdIndex(className, methName, methArgs) + "_" +
                    INSTRUCTION_ARGS[numBranch] + "(";
            for (int i = 0; i < numberOfRegisters; i++) {
                branch = branch + IV + i + ",";
            }
            for (int i = 0; i < numberOfRegisters; i++) {
                branch = branch + "NV" + i;
                if (i != numberOfRegisters - 1) branch = branch + ",";
            }
            branch = branch +",SP_INDEX_NEW," + "IHS,OHS,"+HI+","+HO+",R)";
        }
        return branch;
    }

    /**
     * Print write memory parts of the clause
     * @return
     */
    public String printWM(){
        String wm = "";
        //for (int i=WM_NBR-1; i>=0; i--){
        for (int i=0; i<WM_NBR; i++){
            wm = wm +HSPACE+"writeMemory("+
                    WM_ARGS[i][0]+","+
                    WM_ARGS[i][1]+","+
                    WM_ARGS[i][2]+","+
                    WM_ARGS[i][3]+","+
                    WM_ARGS[i][4]+
                    ")";
            if(i<WM_NBR-1) wm = wm + ",\n";
        }
        return wm;
    }

    /**
     * Print read memory parts of the clause
     * @return
     */
    public String printRM(){
        String rm = "";
        if (RM_NBR != 0){
            rm = rm +HSPACE+"readMemory("+
                    RM_ARGS[0]+","+
                    RM_ARGS[1]+","+
                    RM_ARGS[2]+","+
                    RM_ARGS[3]+
                    ")";
        }
        return rm;
    }

    /**
     * Print head of CLP clause
     * @return
     */
    public String printHead(){
        String s = "p"+jarInfo.getClassIndex(className)+"_"+
                    jarInfo.getMthdIndex(className,methName,methArgs)+"_"+
                    String.valueOf(insNumber)+"(";
        for (int i=0; i<numberOfRegisters; i++){
            s = s+"IV"+i+",";
        }
        for (int i=0; i<numberOfRegisters; i++){
            s = s+"NV"+i+",";
        }
        s = s+"SP_INDEX,"+"IHS,OHS,"+HI+","+HO+","+"R) ";
        return s;
    }

    /**
     * Print reads stack in CLP clause
     * @return String representation of reads call in clp
     */
    public String printRS() {
        String rs = "";
        if (nreads > 0) {
            int nbrRegs = jarInfo.getMthdNbrReg(className, methName, methArgs);
            String methodIndex = jarInfo.getMthdIndex(className, methName, methArgs);
            //Initialisation of RS parts..
            String[] RS_INDEXES = new String[nreads];
            String[] RS_VALUES = new String[nreads];
            String[] RS_REGS = new String[nbrRegs];
            for (int i = 0; i < nreads; i++) {
                RS_INDEXES[i] = "READ_INDEX_" + (i + 1);
                RS_VALUES[i] = "READ_VALUE_" + (i + 1);
            }
            for (int i = 0; i < nbrRegs; i++) {
                RS_REGS[i] = "IV" + i;
            }
            //Initialisation of RS parts :OK
            for (int i = 0; i < nreads; i++) {
                rs = rs + HSPACE+"read_" + methodIndex + "(" + RS_INDEXES[i] + ",";
                for (String reg : RS_REGS) {
                    rs = rs + reg + ",";
                }
                rs = rs + RS_VALUES[i] + ")" + ((i < nreads - 1) ? ",\n" : "");
            }
        }
        return rs;
    }

    /**
     * Print writes stack in CLP clause
     * @return String representation of write call in clp
     */
    public String printWS(){
        String ws = "";
        if (nWrites > 0) {
            int nbrRegs = jarInfo.getMthdNbrReg(className, methName, methArgs);
            String methodIndex = jarInfo.getMthdIndex(className, methName, methArgs);
            //Initialisation of WS parts..
            String[] WS_INDEXES = new String[nWrites];
            String[] WS_VALUES = new String[nWrites];
            String[] WS_REGS_1 = new String[nWrites];
            String[] WS_REGS_2 = new String[nWrites];
            if (nWrites > 0) {
                WS_REGS_1[0] = "IV";
                WS_INDEXES[0] = "WRITE_INDEX_1";
                WS_VALUES[0] = "WRITE_VALUE_1";
                WS_REGS_2[nWrites - 1] = "OV";
            }
            for (int i = 1; i < nWrites; i++) {
                WS_INDEXES[i] = "WRITE_INDEX_" + (i + 1);
                WS_VALUES[i] = "WRITE_VALUE_" + (i + 1);
                WS_REGS_1[i] = "O" + i + "V";
                WS_REGS_2[i - 1] = "O" + i + "V";
            }
            //Initialisation of WS parts :OK
            for (int i = 0; i < nWrites; i++) {
                ws = ws + HSPACE + "write_" + methodIndex + "(" + WS_INDEXES[i] + ",";
                for (int j = 0; j < nbrRegs; j++) {
                    ws = ws + WS_REGS_1[i] + j + ",";
                }
                for (int j = 0; j < nbrRegs; j++) {
                    ws = ws + WS_REGS_2[i] + j + ",";
                }
                ws = ws + WS_VALUES[i] + ")" + ((i < nWrites - 1) ? ",\n" : "");
            }
        }
        return ws;
    }




    /**
     * Print head of the clause that represent the following instruction to be executed
     * @return
     */
    public String printNextIns(){
        String s = "";
        if (BRANCHS_NUMBER == 0 && !this.getClass().getSimpleName().equals("RETURN")) {
            s = HSPACE+"p" + jarInfo.getClassIndex(className) + "_" + jarInfo.getMthdIndex(className, methName, methArgs) + "_" + String.valueOf(this.insNumber + NEXT_INST_JUMP) + "(";

            //FIRST STREAM OF REGISTERS
            switch (NEXT_NUM_RES_REG) {//LOCALVAR AND OPERAND STACK VARIABLES
                case -1:
                    for (int i = 0; i < this.numberOfRegisters; i++) { //NORMAL CASE
                        s = s + NEXT_STACK_1 + i + ",";
                    }
                    break;

                default:
                    for (int i = 0; i < this.numberOfRegisters; i++) { //OPTIMISED PATTERN CASE
                        if (i == Integer.parseInt(jarInfo.getlocvarNumber(className, methName, methArgs, NEXT_NUM_RES_REG))) {
                            s = s + NEXT_RES_REG + ",";
                        } else {
                            s = s + NEXT_STACK_1 + i + ",";
                        }
                    }
                    break;
            }
            //SECOND STREAM OF REGISTERS
            for (int i = 0; i < this.numberOfRegisters; i++) { //LOCALVAR AND OPERAND STACK VARIABLES (finals states, debug purposes)
                s = s + NEXT_STACK_2 + i + ",";
            }
            s = s + SPN+"," + NEXT_HS_1 + ","+OHS+","+NEXT_HEAP_1+","+NEXT_HEAP_2+",R)";
        }
        return s;
    }

    /**
     * Add initialisation constraints if the instrution is the first of the method
     * intialise sp index value, and set registers to 0
     */
    public void addInitConstraints(){
        int nbrArgs = jarInfo.getMthdNbrArg(className, methName, methArgs);
        int nbrRegs = jarInfo.getMthdNbrReg(className, methName, methArgs);
        if (ih.getPosition()==0)  {
            boolean Static = jarInfo.getMthdStaticFlag(className,methName,methArgs);
            for(int clause=0;clause<CONSTRAINTS_LIST.size();clause++){
                CONSTRAINTS_LIST.get(clause).add(SP+" = " + jarInfo.getMthdSPinit(className,methName,methArgs));
                if(!Static) {
                    for (int i = nbrArgs+1; i < nbrRegs; i++) {
                        if(i!=0) { CONSTRAINTS_LIST.get(clause).add(IV+i+" = 0"); }
                    }
                }else{
                    if(methName.equals("main")){ CONSTRAINTS_LIST.get(clause).add(IV+"0 = 0"); }
                    for (int i = nbrArgs; i < nbrRegs; i++) {
                        CONSTRAINTS_LIST.get(clause).add(IV+i+" = 0");
                    }
                }
                if (jarInfo.getMthdReturnType(className, methName, methArgs).equals("void")){
                    CONSTRAINTS_LIST.get(clause).add("R = 0");
                }
            }
        }
    }

    /**
     * Get the matcher of the pattern applied to item
     * @param pattern pattern to apply
     * @param item String to match
     * @return
     */
    public static Matcher getMatcher(String pattern, String item){
        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(item);
        m.matches();
        return m;
    }

    /**
     * Collect args of the bytecode instruction
     * @return
     */
    public String[] getInstructionArgs(){
        String[] instArgs = null;
        Matcher m;
        switch(this.getClass().getSimpleName()) {
            case "CONST":
                instArgs = new String[1];
                if (ih.toString().matches(REGEX_CONSTM1)) instArgs[0] = String.valueOf(-1);
                if (ih.toString().matches(REGEX_CONST_N)) {
                    m = getMatcher(REGEX_CONST_N, ih.toString());
                    instArgs[0] = m.group(3);
                }
                if (ih.toString().matches(REGEX_BIPUSH)) {
                    m = getMatcher(REGEX_BIPUSH, ih.toString());
                    instArgs[0] = m.group(3);
                }
                if (ih.toString().matches(REGEX_LDC)) {
                    m = getMatcher(REGEX_LDC, ih.toString());
                    if (cp.getConstant(Integer.parseInt(m.group(3))).toString().matches(REGEX_CONSTANT_DOUBLE_LONG_FLOAT)) {
                        m = getMatcher(REGEX_CONSTANT_DOUBLE_LONG_FLOAT, cp.getConstant(Integer.parseInt(m.group(3))).toString());
                        Float f = Float.valueOf(m.group(2));
                        int i = f.intValue();
                        instArgs[0] = ((f.floatValue() == i) ? String.valueOf(i) : String.valueOf(f)); //If int of form x.0, return x
                    } else if (cp.getConstant(Integer.parseInt(m.group(3))).toString().matches(REGEX_CONSTANT_STRING)) {
                        m = getMatcher(REGEX_CONSTANT_STRING, cp.getConstant(Integer.parseInt(m.group(3))).toString());
                        m = getMatcher(REGEX_CONSTANT_UTF8, cp.getConstant(Integer.parseInt(m.group(1))).toString());
                        instArgs[0] = "String_"+m.group(1); //Print the String as a not assigned variable
                    }
                }
                break;
            case "GETFIELD":
            case "GETSTATIC":
            case "PUTFIELD":
            case "PUTSTATIC":
                instArgs = new String[2];
                if (this.getClass().getSimpleName().equals("GETFIELD")) m = getMatcher(REGEX_GETFIELD, ih.toString());
                else if (this.getClass().getSimpleName().equals("PUTFIELD"))
                    m = getMatcher(REGEX_PUTFIELD, ih.toString());
                else if (this.getClass().getSimpleName().equals("PUTSTATIC"))
                    m = getMatcher(REGEX_PUTSTATIC, ih.toString());
                else
                    m = getMatcher(REGEX_GETSTATIC, ih.toString()); //The rest of constantPool parsing is identical (parsing a FIELDREF entry)
                m = getMatcher(REGEX_CONSTANT_FIELDREF, cp.getConstant(Integer.parseInt(m.group(2))).toString());
                String constantNameAndType = cp.getConstant(Integer.parseInt(m.group(2))).toString();
                m = getMatcher(REGEX_CONSTANT_CLASS, cp.getConstant(Integer.parseInt(m.group(1))).toString());
                m = getMatcher(REGEX_CONSTANT_UTF8, cp.getConstant(Integer.parseInt(m.group(1))).toString());
                instArgs[0] = m.group(1); //class name
                m = getMatcher(REGEX_CONSTANT_NAMEANDTYPE, constantNameAndType);
                m = getMatcher(REGEX_CONSTANT_UTF8, cp.getConstant(Integer.parseInt(m.group(1))).toString());
                instArgs[1] = m.group(1); //field name
                last_args = instArgs;
                break;
            case "GOTO":
                instArgs = new String[1];
                m = getMatcher(REGEX_GOTO, ih.toString());
                instArgs[0] = String.valueOf(jarInfo.getInstNumber(className, methName, methArgs, Integer.parseInt(m.group(2))));
                break;
            case "IFCMP":
                instArgs = new String[2];
                instArgs[0] = String.valueOf(insNumber + 1);
                m = getMatcher(REGEX_IFCMPGEN, ih.toString());
                instArgs[1] = String.valueOf(jarInfo.getInstNumber(className, methName, methArgs, Integer.parseInt(m.group(3))));
                break;
            case "IFCMPONEREAD":
                instArgs = new String[2];
                instArgs[0] = String.valueOf(insNumber + 1);
                m = getMatcher(REGEX_IFGEN, ih.toString());
                instArgs[1] = String.valueOf(jarInfo.getInstNumber(className, methName, methArgs, Integer.parseInt(m.group(2))));
                break;
            case "INC":
                instArgs = new String[2];
                if (ih.toString().matches(REGEX_INC)) {
                    m = getMatcher(REGEX_INC, ih.toString());
                } else m = getMatcher(REGEX_DEC, ih.toString());
                instArgs[0] = m.group(1);
                instArgs[1] = m.group(2);
                break;
            case "INVOKEINTERFACE":
            case "INVOKEVIRTUAL":
            case "INVOKESTATIC":
            case "INVOKESPECIAL":
                instArgs = new String[3];
                if (ih.toString().matches(REGEX_INVOKEINTERFACE)) {
                    m = getMatcher(REGEX_INVOKEINTERFACE, ih.toString());
                    m = getMatcher(REGEX_CONSTANT_INTERFACEMETHODEREF, cp.getConstant(Integer.parseInt(m.group(2))).toString());
                } else if (ih.toString().matches(REGEX_INVOKESTATIC)) {
                    m = getMatcher(REGEX_INVOKESTATIC, ih.toString());
                    m = getMatcher(REGEX_CONSTANT_METHODEREF, cp.getConstant(Integer.parseInt(m.group(2))).toString());
                } else if (ih.toString().matches(REGEX_INVOKESPECIAL)) {
                    m = getMatcher(REGEX_INVOKESPECIAL, ih.toString());
                    m = getMatcher(REGEX_CONSTANT_METHODEREF, cp.getConstant(Integer.parseInt(m.group(2))).toString());
                } else {
                    m = getMatcher(REGEX_INVOKEVIRTUAL, ih.toString());
                    m = getMatcher(REGEX_CONSTANT_METHODEREF, cp.getConstant(Integer.parseInt(m.group(2))).toString());
                }
                constantNameAndType = cp.getConstant(Integer.parseInt(m.group(2))).toString();
                m = getMatcher(REGEX_CONSTANT_CLASS, cp.getConstant(Integer.parseInt(m.group(1))).toString());
                m = getMatcher(REGEX_CONSTANT_UTF8, cp.getConstant(Integer.parseInt(m.group(1))).toString());
                instArgs[0] = m.group(1); //class name
                m = getMatcher(REGEX_CONSTANT_NAMEANDTYPE, constantNameAndType);
                m = getMatcher(REGEX_CONSTANT_UTF8, cp.getConstant(Integer.parseInt(m.group(1))).toString());
                instArgs[1] = m.group(1); //method name
                m = getMatcher(REGEX_CONSTANT_NAMEANDTYPE, constantNameAndType);
                m = getMatcher(REGEX_CONSTANT_UTF8_SIGN, cp.getConstant(Integer.parseInt(m.group(2))).toString());
                instArgs[2] = m.group(1);//signature
                last_args = instArgs;
                break;
            case "LOOKUPSWITCH":
                List<Integer> branchs = new ArrayList<>();
                cases = new ArrayList<>();
                m = getMatcher(REGEX_LOOKUPSWITCH, ih.toString());
                int baseAdress = Integer.parseInt(m.group(1));
                String defaultAdress = m.group(2);
                String pairs = m.group(3);
                String parts[] = pairs.split("\\)\\(");
                for (String s : parts) {
                    m = getMatcher("\\(?(\\d*),\\s.*\\s=\\s\\{(\\d*)\\}\\)?", s);
                    cases.add(Integer.parseInt(m.group(1)));
                    branchs.add(Integer.parseInt(m.group(2)) + baseAdress);
                }
                branchs.add(Integer.parseInt(defaultAdress));
                cases.add(0000000);
                instArgs = new String[cases.size() + 1];
                int indx = 0;
                while (indx < cases.size()) {
                    instArgs[indx] = String.valueOf(jarInfo.getInstNumber(className, methName, methArgs, branchs.get(indx)));
                    indx++;
                }
                instArgs[indx] = "DEFAULT";
                break;
            case "LOAD":
            case "STORE":
                instArgs = new String[1];
                if (ih.toString().matches(REGEX_LOAD_N)) m = getMatcher(REGEX_LOAD_N, ih.toString());
                else if (ih.toString().matches(REGEX_STORE_N)) m = getMatcher(REGEX_STORE_N, ih.toString());
                else if (ih.toString().matches(REGEX_STORE)) m = getMatcher(REGEX_STORE, ih.toString());
                else m = getMatcher(REGEX_LOAD, ih.toString());
                instArgs[0] = jarInfo.getlocvarNumber(className, methName, methArgs, Integer.parseInt(m.group(3)));
                break;
            case "MULTINEWARRAY":
                instArgs = new String[1];
                m = getMatcher(REGEX_MULTNEWARRAY, ih.toString());
                instArgs[0] = m.group(3);
                break;
            case "NEW":
                instArgs = new String[1];
                m = getMatcher(REGEX_NEW, ih.toString());
                m = getMatcher(REGEX_CONSTANT_CLASS, cp.getConstant(Integer.parseInt(m.group(2))).toString());
                m = getMatcher(REGEX_CONSTANT_UTF8, cp.getConstant(Integer.parseInt(m.group(1))).toString());
                instArgs[0] = m.group(1);
                break;
        }
        return instArgs;
    }

}
