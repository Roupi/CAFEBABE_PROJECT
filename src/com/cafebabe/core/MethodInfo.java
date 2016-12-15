package com.cafebabe.core;

import exceptions.MethodNotFoundException;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * MethodInfo is the representation of a method that take part in the ClassInfo representation.
 * This representation help to keep information needed about methods while translating bytecode instructions to CLP clauses.
 * MethodInfo keep information about the name of the method, the position of the method in the list of methods from the class.
 * This class contains also information about the number of registers used by the method in CLP clause, the number of local variables in the method,
 * the number of arguments took by the method and a list that map position of instruction relative to their hexadecimal representation and their
 * order in the list of instruction of the method.
 *
 * @author Laffineur Gerome
 */
class MethodInfo{
    /**
     * Name of the method
     */
    private String name;
    /**
     * Position of the method in the method list of the ClassInfo representation
     */
    private int index;
    /**
     * Number of registers used by the method in the CLP clause (maximum stack size + number of local variables)
     */
    private int nbrReg;
    /**
     * Number of local variables in the method (include arguments and this)
     */
    private int localVarLength;
    /**
     * Number of arguments took by the method
     */
    private int nArgs;
    /**
     * List that map position of instruction relative to their hexadecimal representation and their order in the list of instruction of the method.
     */
    private Map instpos = new HashMap();
    /**
     * List that map position of variable in local variable table relative to their size and ther order in the list of local var
     */
    private Map varpos = new HashMap();

    /**
     * Return type of the method
     */
    private String type;

    /**
     * Types of arguments for the method
     */
    private String argTypes;

    /**
     * Initial value of stack pointer for the method
     */
    private int SPinit;

    /**
     * Abstract flag of a method
     */
    private boolean isAbstract;

    /**
     * Static flag of a method
     */
    private boolean isStatic;

    /**
     * Constructor of MethodInfo object
     * @param name name of the method
     * @param index position of the method in the method list of the ClassInfo representation
     * @param nbrReg Number of registers used by the method in the CLP clause (maximum stack size + number of local variables)
     * @param localVarLength Number of local variables in the method (include arguments and this)
     * @param nArgs Number of arguments took by the method
     * @param instpos List that map position of instruction relative to their hexadecimal representation and their order in the list of instruction of the method.
     * @param varpos List that map position of variable in local variable table relative to their size and ther order in the list of local var
     */
    public MethodInfo(String name, int index, int nbrReg, int localVarLength, int nArgs, Map instpos, Map varpos, String type, String argTypes, int SPinit, boolean isAbstract, boolean isStatic) {
        this.name = name;
        this.index = index;
        this.nbrReg = nbrReg;
        this.localVarLength = localVarLength;
        this.nArgs = nArgs;
        this.instpos = instpos;
        this.varpos = varpos;
        this.type = type;
        this.argTypes = argTypes;
        this.SPinit = SPinit;
        this.isAbstract = isAbstract;
        this.isStatic = isStatic;

    }

    /**
     * Return the number of local variable in the method
     * @return the number of local variable in the method
     */
    public int getLocalVarLength(){return localVarLength;}

    /**
     * Return the initial SP index that must be used
     * in order to execute the method
     * @return the initial SP index that must be used
     */
    public int getSPinit(){return SPinit;}

    /**
     * Return types of arguments in the order they appear
     * @return types of arguments in the order they appear
     */
    public String getArgTypes(){return argTypes;}


    /**
     * Return the return type of the method
     * @return the return type of the method
     */
    public String getType(){return type;}

    /**
     * Return the number of arguments took by the method
     * @return the number of arguments took by the method
     */
    public int getNargs() { return nArgs;}

    /**
     * Return the position of the method
     * @return the position of the method
     */
    public int getIndex() {
        return index;
    }

    /**
     * Return the name of the method
     * @return the name of the method
     */
    public String getName() {
        return name;
    }

    /**
     * Return the abstract flag of the method
     * @return the abstract flag of the method
     */
    public boolean isAbstract() {
        return isAbstract;
    }

    /**
     * Return the static flag of the method
     * @return the static flag of the method
     */
    public boolean isStatic() {
        return isStatic;
    }

    /**
     * Initialize the position number of the method
     * @param index the position number of the method
     */
    public void setIndex(int index) {
        this.index = index;
    }

    /**
     * Return the number of registers used by the method in the CLP clause
     * @return the number of registers used by the method in the CLP clause
     */
    public int getNbrReg() {
        return nbrReg;
    }

    /**
     * Return  a List that map position of instruction relative to their hexadecimal representation and their order in the list of instruction of the method.
     * @return a List that map position of instruction relative to their hexadecimal representation and their order in the list of instruction of the method.
     */
    public Map getInstpos(){ return instpos;}

    /**
     * Return  a List that map position of variable in local variable table relative to their size and ther order in the list of local var
     * @return a List that map position of variable in local variable table relative to their size and ther order in the list of local var
     */
    public Map getVarpos(){ return varpos;}

    @Override
    /**
     * Provide a String representation of the MethodInfo object
     * @retun a String representation of the Method Info object
     */
    public String toString() {
        return name+ "["+index+"](" + nbrReg + " reg) " + nArgs + " arg instpos " + instpos + " varpos " + varpos + "returnType " + type + " argtypes :" + argTypes+ " isAbstract :" +isAbstract()+"\n   ";
    }
}