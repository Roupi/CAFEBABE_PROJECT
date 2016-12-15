p_start(IV0,R) :-
         {IHS = 0, unify(HI,[])},
         p1_1_0(IV0,IV1,IV2,NV0,NV1,NV2,SP_INDEX,IHS,OHS,HI,HO,R).
p_startD(IV0,NV0,NV1,R) :-
         {IHS = 0, unify(HI,[])},
         p1_1_0(IV0,IV1,IV2,NV0,NV1,NV2,SP_INDEX,IHS,OHS,HI,HO,R).
p0_0_0(A,0,0,IHS,OHS,HI,HO,0) :- {OHS = IHS, unify(HI,HO)}.
writeMemory(HI,HO,OBJECTREF,FIELD,VALUE) :- {}, select(object(OBJECTREF,FIELD,_),HI,HO1),writeMemory(HO1,HO,OBJECTREF,FIELD,VALUE).
writeMemory(HI,[object(OBJECTREF,FIELD,VALUE)|HI],OBJECTREF,FIELD,VALUE).
readMemory([object(OBJECTREF,FIELD,VALUE)|Hs],OBJECTREF,FIELD,VALUE) :- {}.
readMemory([object(OBJECTREF1,FIELD1,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {OBJECTREF1\=OBJECTREF, FIELD1\=FIELD}, readMemory(HS,OBJECTREF,FIELD,VALUE).
readMemory([object(OBJECTREF,FIELD1,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {FIELD1\=FIELD}, readMemory(HS,OBJECTREF,FIELD,VALUE).
readMemory([object(OBJECTREF1,FIELD,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {OBJECTREF1\=OBJECTREF}, readMemory(HS,OBJECTREF,FIELD,VALUE).
readMemory(_,_,_,0) :- {}.
%CLASSFILE:TEST_36
%METHOD:<init>()V
%   0: aload_0[42](1)
p1_0_0(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,SP_INDEX = 0,IV1 = 0,R = 0},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p1_0_1(OV0,OV1,NV0,NV1,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   1: invokespecial[183](3) 1
p1_0_1(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1)
,
         p0_0_0(WRITE_VALUE_1,_,SP_INDEX_CALL,IHS,OHS_CALL,HI,HO_NEW,R_NEW),
         p1_0_2(IV0,IV1,NV0,NV1,SP_INDEX_NEW,OHS_CALL,OHS,HO_NEW,HO,R).
%   4: return[177](1)
p1_0_2(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {IV0 = NV0,IV1 = NV1,IHS = OHS,unify(HI,HO)}
.
%READ AND WRITE PREDICATES OF:<init>()V
read_0(SP,IV0,IV1,IV0) :- {SP = 0}.
read_0(SP,IV0,IV1,IV1) :- {SP = 1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 0,W0=VAL,W1=IV1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 1,W0=IV0,W1=VAL}.
%END OF METHOD:<init>()V
%METHOD:main([Ljava/lang/String;)V
%   0: invokestatic[184](3) 2
p1_1_0(IV0,IV1,IV2,NV0,NV1,NV2,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 0,WRITE_VALUE_2 = 0,SP_INDEX_NEW = SP_INDEX - -1,SP_INDEX = 1,IV0 = 0,IV1 = 0,IV2 = 0,R = 0}
,
         p1_2_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,SP_INDEX_CALL,IHS,OHS_CALL,HI,HO_NEW,R_NEW),
         write_1(SP_INDEX_NEW,IV0,IV1,IV2,OV0,OV1,OV2,R_NEW)
,
         p1_1_1(OV0,OV1,OV2,NV0,NV1,NV2,SP_INDEX_NEW,OHS_CALL,OHS,HO_NEW,HO,R).
%   3: istore_1[60](1)
p1_1_1(IV0,IV1,IV2,NV0,NV1,NV2,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 1,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,OV0,OV1,OV2,WRITE_VALUE_1),
         p1_1_2(OV0,OV1,OV2,NV0,NV1,NV2,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   4: return[177](1)
p1_1_2(IV0,IV1,IV2,NV0,NV1,NV2,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {IV0 = NV0,IV1 = NV1,IV2 = NV2,IHS = OHS,unify(HI,HO)}
.
%READ AND WRITE PREDICATES OF:main([Ljava/lang/String;)V
read_1(SP,IV0,IV1,IV2,IV0) :- {SP = 0}.
read_1(SP,IV0,IV1,IV2,IV1) :- {SP = 1}.
read_1(SP,IV0,IV1,IV2,IV2) :- {SP = 2}.
write_1(SP,IV0,IV1,IV2,W0,W1,W2,VAL) :- {SP = 0,W0=VAL,W1=IV1,W2=IV2}.
write_1(SP,IV0,IV1,IV2,W0,W1,W2,VAL) :- {SP = 1,W0=IV0,W1=VAL,W2=IV2}.
write_1(SP,IV0,IV1,IV2,W0,W1,W2,VAL) :- {SP = 2,W0=IV0,W1=IV1,W2=VAL}.
%END OF METHOD:main([Ljava/lang/String;)V
%METHOD:giveNumber()I
%   0: iconst_0[3](1)
p1_2_0(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 0,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX = 0,IV0 = 0,IV1 = 0},
         write_2(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p1_2_1(OV0,OV1,NV0,NV1,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   1: istore_0[59](1)
p1_2_1(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 0,SP_INDEX_NEW = SP_INDEX  - 1},
         read_2(READ_INDEX_1,IV0,IV1,READ_VALUE_1),
         write_2(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p1_2_2(OV0,OV1,NV0,NV1,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   2: iconst_5[8](1)
p1_2_2(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 5,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_2(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p1_2_3(OV0,OV1,NV0,NV1,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   3: ireturn[172](1)
p1_2_3(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {IV0 = NV0,IV1 = NV1,READ_INDEX_1 = SP_INDEX,R = READ_VALUE_1,IHS = OHS,unify(HI,HO)},
         read_2(READ_INDEX_1,IV0,IV1,READ_VALUE_1)
.
%READ AND WRITE PREDICATES OF:giveNumber()I
read_2(SP,IV0,IV1,IV0) :- {SP = 0}.
read_2(SP,IV0,IV1,IV1) :- {SP = 1}.
write_2(SP,IV0,IV1,W0,W1,VAL) :- {SP = 0,W0=VAL,W1=IV1}.
write_2(SP,IV0,IV1,W0,W1,VAL) :- {SP = 1,W0=IV0,W1=VAL}.
%END OF METHOD:giveNumber()I

