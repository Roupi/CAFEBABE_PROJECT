package com.cafebabe.core;

import org.apache.bcel.classfile.JavaClass;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * ClassInfo is the representation of a class that take part in the JarInfo representation.
 * This representation help to keep information needed about classes while translating bytecode instructions to CLP clauses.
 * ClassInfo keep information about the name of the class, the position of the class in the list of classes from the jar.
 * This class contains also information about methods and attributes it contains via the methods and attributes fields.
 *
 * @author Laffineur Gerome
 */
class ClassInfo{
    private static final String id = "com.cafebabe.core.instructions.ClassInfo.";
    /**
     * Name of the class
     */
    private String name;
    /**
     * Position of the class in the list of classes of the .jar
     */
    private int index;
    /**
     * List of methods of the class name
     */
    private List<MethodInfo> methods;
    /**
     * List of attributes of the class name
     */
    private List<String> attributes;

    /**
     * Nameof parentClass from the class
     */
    private String superClass;
    /**
     * List of interfaces names from the class
     */
    private List<String> interfaces;

    /**
     * Construct a classInfo object
     * @param name Name of the class
     * @param index index of the class
     */
    public ClassInfo(String name, int index) {
        this.name = name;
        this.index = index;
        this.superClass = null;
        this.methods = new ArrayList<>();
        this.attributes = new ArrayList<>();
        this.interfaces = new ArrayList<>();
    }

    /**
     * Construct a classInfo object
     * @param  c JavaClass representation of the class
     * @param index index of the class
     */
    public ClassInfo(JavaClass c, int index) {
        this.name = c.getClassName();
        this.index = index;
        this.superClass = (c.getSuperclassName().equals("java.lang.Object")?"java/lang/Object":c.getSuperclassName());
        this.methods = new ArrayList<>();
        this.attributes = new ArrayList<>();
        this.interfaces = new ArrayList<>();
        for (String interf  : c.getInterfaceNames()) interfaces.add(interf);
    }


    /**
     * Add an attribute the the attributes list of the class
     * @param attributeName name of the field
     */
    public void addAttribute(String attributeName){
        this.attributes.add(attributeName);
    }

    /**
     * Add a method the the attributes list of the class
     * @param mi representation of the method
     */
    public void addMethod(MethodInfo mi){
        this.methods.add(mi);
    }

    /**
     * Return the name of the class
     * @return the name of the class
     */
    public String getName() {
        return name;
    }

    /**
     * Initialize the name of the class
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Return the position of the class relative to the jar
     * @return the position of the class relative to the jar
     */
    public int getIndex() {
        return index;
    }

    /**
     * Return the subclass of the class
     * @return the subclass of the class
     */
    public String getSuperClass() {
        return superClass;
    }

    /**
     * Initialize the position of the class
     * @param index Position of the class
     */
    public void setIndex(int index) {
        this.index = index;
    }

    /**
     * Return the list of methods representations from the class
     * @return the list of methods representations from the class
     */
    public List<MethodInfo> getMethods() {
        return methods;
    }

    /**
     * Initialize the methods list of the class
     * @param methods list of methods representations
     */
    public void setMethods(List<MethodInfo> methods) {
        this.methods = methods;
    }

    /**
     * Return the attributes list of the class
     * @return the attributes list of the class
     */
    public List<String> getAttributes() {
        return attributes;
    }

    /**
     * Return the interfaces list of the class
     * @return the interfaces list of the class
     */
    public List<String> getInterfaces() {
        return interfaces;
    }

    /**
     * Initialize the attributes list of the class
     * @param attributes list of attributes of the class
     */
    public void setAttributes(List<String> attributes) {
        this.attributes = attributes;
    }

    /**
     * List of MethodInfos representations of the class
     * @return List of MethodInfos representations of the class
     */
    public List<MethodInfo> getMethodsInfos(){
        return methods;
    }

    @Override
    /**
     * Provide a String representation of the ClassInfo object
     * @retun a String representation of the ClassInfo object
     */
    public String toString() {
        String s = "   "+name+ "["+index+"]"+"{\n";
        s = s+ "   ";
        for (String att : attributes){
            s = s + "["+att + "]";
        }
        s = s + "\n";
        s = s+ "   Methods :\n   {" + methods.toString();
        s = s + "}\n";

        s = s + "   SuperClass : " + superClass+"\n";
        s = s + "   Interfaces : " + interfaces+"\n";
        return s + "   }\n\n";
    }
}

