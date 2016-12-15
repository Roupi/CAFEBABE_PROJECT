package com.cafebabe.core;

/**
 * This class regroup all constants used in the CAFEBABE project
 * @author Laffineur Gerome
 */
public final class Consts {

    public static final String REGEX_CONSTM1 = "(\\s*\\d+:\\s.const_m1\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_CONST_N = "(\\s*\\d+:\\s(d|i|l|f)const_(\\d)\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_BINOP = "(\\s*\\d+:\\s(d|i|l|f)(add|sub|mul|div|rem)\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_LDC = "(\\s*\\d+:\\s(ldc2_w|ldc)\\[\\d*\\]\\(\\d*\\)\\s(\\d*))";
    public static final String REGEX_BIPUSH = "(\\s*\\d+:\\s(b|s)ipush\\[\\d*\\]\\(\\d*\\)\\s)(\\d*)";
    public static final String REGEX_STORE_N = "(\\s*\\d+:\\s(a|d|f|i|l)store_(\\d)\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_STORE = "(\\s*\\d+:\\s(a|d|f|i|l)store\\[\\d*\\]\\(\\d*\\)\\s(\\d+))";
    public static final String REGEX_LOAD_N = "(\\s*\\d+:\\s(a|d|f|i|l)load_(\\d)\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_ACONST = "(\\s*\\d+:\\saconst_null\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_LOAD = "(\\s*\\d+:\\s(a|d|f|i|l)load\\[\\d*\\]\\(\\d*\\)\\s(\\d+))";
    public static final String REGEX_RETURNVOID = "(\\s*\\d+:\\sreturn\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_RETURN = "(\\s*\\d+:\\s.return\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_NEW = "(\\s*\\d+:\\snew\\[\\d*\\]\\(\\d*\\)\\s(\\d+))";
    public static final String REGEX_NEWARRAY = "(\\s*\\d+:\\snewarray\\[\\d*\\]\\(\\d*\\)\\s(.*))";
    public static final String REGEX_DUP = "(\\s*\\d+:\\sdup\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_DUPX1 = "(\\s*\\d+:\\sdup_x1\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_DUPX2 = "(\\s*\\d+:\\sdup_x2\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_DUP2 = "(\\s*\\d+:\\sdup2\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_DUP2X1 = "(\\s*\\d+:\\sdup2_x1\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_DUP2X2 = "(\\s*\\d+:\\sdup2_x2\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_INVOKESPECIAL = "(\\s*\\d+:\\sinvokespecial\\[\\d*\\]\\(\\d*\\)\\s(\\d+))";
    public static final String REGEX_INVOKEVIRTUAL = "(\\s*\\d+:\\sinvokevirtual\\[\\d*\\]\\(\\d*\\)\\s(\\d+))";
    public static final String REGEX_INVOKEINTERFACE = "(\\s*\\d+:\\sinvokeinterface\\[\\d*\\]\\(\\d*\\)\\s(\\d+))";
    public static final String REGEX_INVOKESTATIC = "(\\s*\\d+:\\sinvokestatic\\[\\d*\\]\\(\\d*\\)\\s(\\d+))";
    public static final String REGEX_CONVERT = "(\\s*\\d+:\\s(d|f|i|l)2(f|i|l|d|s)\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_COMPAREL = "(\\s*\\d+:\\s(d|f)cmpl\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_COMPAREG = "(\\s*\\d+:\\s(d|f)cmpg\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_COMPARELONG = "(\\s*\\d+:\\s(l)cmp\\[\\d*\\]\\(\\d*\\))";
    public static final String REGEX_GOTO = "\\s*\\d*:\\s(goto|goto_w)\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFCMPGEN = "\\s*\\d*:\\sif_(a|i)cmp(ne|eq|lt|ge|gt|le)\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFGEN = "\\s*\\d*:\\sif(eq|ge|gt|le|lt|ne|nonnull|null)\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFCMPNE = "\\s*\\d*:\\sif_(a|i)cmpne\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFCMPEQ = "\\s*\\d*:\\sif_(a|i)cmpeq\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFCMPLT = "\\s*\\d*:\\sif_(i)cmplt\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFCMPLE = "\\s*\\d*:\\sif_(i)cmple\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFCMPGT = "\\s*\\d*:\\sif_(i)cmpgt\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFCMPGE = "\\s*\\d*:\\sif_(i)cmpge\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFEQ = "\\s*\\d*:\\sifeq\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFGE = "\\s*\\d*:\\sifge\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFGT = "\\s*\\d*:\\sifgt\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFLE = "\\s*\\d*:\\sifle\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFLT = "\\s*\\d*:\\siflt\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFNE = "\\s*\\d*:\\sifne\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFNONNULL = "\\s*\\d*:\\sifnonnull\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_IFNULL = "\\s*\\d*:\\sifnull\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d*)";
    public static final String REGEX_INC = "\\s*\\d*:\\siinc\\[\\d*\\]\\(\\d*\\)\\s(\\d*)\\s(\\d*)";
    public static final String REGEX_DEC = "\\s*\\d*:\\siinc\\[\\d*\\]\\(\\d*\\)\\s(\\d*)\\s\\-(\\d*)";
    public static final String REGEX_GETFIELD = "(\\s*\\d+:\\sgetfield\\[\\d*\\]\\(\\d*\\)\\s(\\d+))";
    public static final String REGEX_GETSTATIC = "(\\s*\\d+:\\sgetstatic\\[\\d*\\]\\(\\d*\\)\\s(\\d+))";
    public static final String REGEX_PUTFIELD = "(\\s*\\d+:\\sputfield\\[\\d*\\]\\(\\d*\\)\\s(\\d+))";
    public static final String REGEX_PUTSTATIC = "(\\s*\\d+:\\sputstatic\\[\\d*\\]\\(\\d*\\)\\s(\\d+))";
    public static final String REGEX_LOOKUPSWITCH = "\\s*(\\d+):\\slookupswitch\\[\\d*\\]\\(\\d*\\)\\s->\\s(\\d+)(.*)";
    public static final String REGEX_MULTNEWARRAY = "\\s*\\d+:\\smultianewarray\\[\\d*\\]\\(\\d*\\)\\s(\\d+)\\s(\\d+)\\s(\\d+)";



    public static final String REGEX_CONSTANT_CLASS = "CONSTANT_Class\\[\\d+\\]\\(name_index\\s=\\s(\\d+)\\)";
    public static final String REGEX_CONSTANT_STRING = "CONSTANT_String\\[\\d+\\]\\(string_index\\s=\\s(\\d+)\\)";
    public static final String REGEX_CONSTANT_DOUBLE_LONG_FLOAT = "CONSTANT_(Double|Long|Float)\\[\\d*\\]\\(bytes\\s=\\s(\\d*\\.*\\d*)\\)";
    public static final String REGEX_CONSTANT_UTF8 = "CONSTANT_Utf8\\[\\d+\\]\\(\\\"(.*)\\\"\\)";
    public static final String REGEX_CONSTANT_UTF8_SIGN = "CONSTANT_Utf8\\[\\d+\\]\\(\\\"\\((.*)\\).*\\)";
    public static final String REGEX_CONSTANT_NAMEANDTYPE = "CONSTANT_NameAndType\\[\\d+\\]\\(name_index\\s=\\s(\\d+),\\ssignature_index\\s=\\s(\\d+)\\)";
    public static final String REGEX_CONSTANT_FIELDREF = "CONSTANT_Fieldref\\[\\d+\\]\\(class_index\\s=\\s(\\d+),\\sname_and_type_index\\s=\\s(\\d+)\\)";
    public static final String REGEX_CONSTANT_INTERFACEMETHODEREF = "CONSTANT_InterfaceMethodref\\[\\d+\\]\\(class_index\\s=\\s(\\d+),\\sname_and_type_index\\s=\\s(\\d+)\\)";
    public static final String REGEX_CONSTANT_METHODEREF = "CONSTANT_Methodref\\[\\d+\\]\\(class_index\\s=\\s(\\d+),\\sname_and_type_index\\s=\\s(\\d+)\\)";


    public static final String SP ="SP_INDEX";
    public static final String RI ="READ_INDEX_";
    public static final String RV ="READ_VALUE_";
    public static final String WI ="WRITE_INDEX_";
    public static final String WV ="WRITE_VALUE_";
    public static final String FV ="FIELD_VALUE";
    public static final String IHS ="IHS";
    public static final String IHSN ="IHS_NEW";
    public static final String OHS ="OHS";
    public static final String AREF ="AREF";
    public static final String IV = "IV";
    public static final String NV ="NV";
    public static final String OV ="OV";
    public static final String HI ="HI";
    public static final String HO ="HO";
    public static final String HON ="HO_NEW";



    public static final String MAJ_SP_ID ="SP_INDEX_NEW = SP_INDEX";
    public static final String SPN ="SP_INDEX_NEW";
    public static final String MAJ_SP_INC ="SP_INDEX_NEW = SP_INDEX  + 1";
    public static final String SP_P1 ="SP_INDEX  + 1";
    public static final String MAJ_SP_DEC ="SP_INDEX_NEW = SP_INDEX  - 1";
    public static final String SP_M1 ="SP_INDEX  - 1";

}
