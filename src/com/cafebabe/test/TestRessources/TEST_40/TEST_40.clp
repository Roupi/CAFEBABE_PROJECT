p_start(IV0,IV1,IV2,R) :-
         {IHS = 0, unify(HI,[])},
         p1_2_0(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R).
p_startD(IV0,IV1,IV2,NV0,NV1,NV2,NV3,R) :-
         {IHS = 0, unify(HI,[])},
         p1_2_0(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R).
p0_0_0(A,0,0,IHS,OHS,HI,HO,0) :- {OHS = IHS, unify(HI,HO)}.
writeMemory(HI,HO,OBJECTREF,FIELD,VALUE) :- {}, select(object(OBJECTREF,FIELD,_),HI,HO1),writeMemory(HO1,HO,OBJECTREF,FIELD,VALUE).
writeMemory(HI,[object(OBJECTREF,FIELD,VALUE)|HI],OBJECTREF,FIELD,VALUE).
readMemory([object(OBJECTREF,FIELD,VALUE)|Hs],OBJECTREF,FIELD,VALUE) :- {}.
readMemory([object(OBJECTREF1,FIELD1,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {OBJECTREF1\=OBJECTREF, FIELD1\=FIELD}, readMemory(HS,OBJECTREF,FIELD,VALUE).
readMemory([object(OBJECTREF,FIELD1,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {FIELD1\=FIELD}, readMemory(HS,OBJECTREF,FIELD,VALUE).
readMemory([object(OBJECTREF1,FIELD,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {OBJECTREF1\=OBJECTREF}, readMemory(HS,OBJECTREF,FIELD,VALUE).
readMemory(_,_,_,0) :- {}.
%CLASSFILE:TEST_40
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
%   0: return[177](1)
p1_1_0(IV0,NV0,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {IV0 = NV0,IHS = OHS,unify(HI,HO),SP_INDEX = 0,IV0 = 0,R = 0}
.
%READ AND WRITE PREDICATES OF:main([Ljava/lang/String;)V
read_1(SP,IV0,IV0) :- {SP = 0}.
write_1(SP,IV0,W0,VAL) :- {SP = 0,W0=VAL}.
%END OF METHOD:main([Ljava/lang/String;)V
%METHOD:gounzoum(III)I
%   0: iconst_2[5](1)
p1_2_0(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 2,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX = 3,IV3 = 0,IV4 = 0,IV5 = 0},
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_1(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   1: istore_0[59](1)
p1_2_1(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 0,SP_INDEX_NEW = SP_INDEX  - 1},
         read_2(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_2(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   2: iconst_5[8](1)
p1_2_2(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 5,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_3(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   3: istore_1[60](1)
p1_2_3(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 1,SP_INDEX_NEW = SP_INDEX  - 1},
         read_2(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_4(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   4: bipush[16](2) 8
p1_2_4(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 8,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_5(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   6: istore_2[61](1)
p1_2_5(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 2,SP_INDEX_NEW = SP_INDEX  - 1},
         read_2(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_6(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   7: iconst_0[3](1)
p1_2_6(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 0,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_7(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   8: istore_3[62](1)
p1_2_7(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 3,SP_INDEX_NEW = SP_INDEX  - 1},
         read_2(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_8(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   9: iload_3[29](1)
p1_2_8(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 3,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_2(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_9(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  10: ifne[154](3) -> 19
p1_2_9(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,SP_INDEX_NEW = SP_INDEX  - 1,READ_VALUE_1 = 0},
         read_2(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1)
,
         p1_2_10(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
p1_2_9(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,SP_INDEX_NEW = SP_INDEX  - 1,READ_VALUE_1 \= 0},
         read_2(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1)
,
         p1_2_16(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  13: iload_0[26](1)
p1_2_10(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_2(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_11(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  14: iload_1[27](1)
p1_2_11(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 1,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_2(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_12(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  15: imul[104](1)
p1_2_12(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,WRITE_VALUE_1 = READ_VALUE_2 * READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1},
         read_2(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         read_2(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_2),
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_13(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  16: iload_2[28](1)
p1_2_13(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 2,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_2(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_14(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  17: iadd[96](1)
p1_2_14(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,WRITE_VALUE_1 = READ_VALUE_2 +READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1},
         read_2(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         read_2(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_2),
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_15(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  18: istore_3[62](1)
p1_2_15(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 3,SP_INDEX_NEW = SP_INDEX  - 1},
         read_2(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_16(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  19: iload_3[29](1)
p1_2_16(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 3,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_2(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p1_2_17(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  20: ireturn[172](1)
p1_2_17(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {IV0 = NV0,IV1 = NV1,IV2 = NV2,IV3 = NV3,IV4 = NV4,IV5 = NV5,READ_INDEX_1 = SP_INDEX,R = READ_VALUE_1,IHS = OHS,unify(HI,HO)},
         read_2(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1)
.
%READ AND WRITE PREDICATES OF:gounzoum(III)I
read_2(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV0) :- {SP = 0}.
read_2(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV1) :- {SP = 1}.
read_2(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV2) :- {SP = 2}.
read_2(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV3) :- {SP = 3}.
read_2(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV4) :- {SP = 4}.
read_2(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV5) :- {SP = 5}.
write_2(SP,IV0,IV1,IV2,IV3,IV4,IV5,W0,W1,W2,W3,W4,W5,VAL) :- {SP = 0,W0=VAL,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=IV5}.
write_2(SP,IV0,IV1,IV2,IV3,IV4,IV5,W0,W1,W2,W3,W4,W5,VAL) :- {SP = 1,W0=IV0,W1=VAL,W2=IV2,W3=IV3,W4=IV4,W5=IV5}.
write_2(SP,IV0,IV1,IV2,IV3,IV4,IV5,W0,W1,W2,W3,W4,W5,VAL) :- {SP = 2,W0=IV0,W1=IV1,W2=VAL,W3=IV3,W4=IV4,W5=IV5}.
write_2(SP,IV0,IV1,IV2,IV3,IV4,IV5,W0,W1,W2,W3,W4,W5,VAL) :- {SP = 3,W0=IV0,W1=IV1,W2=IV2,W3=VAL,W4=IV4,W5=IV5}.
write_2(SP,IV0,IV1,IV2,IV3,IV4,IV5,W0,W1,W2,W3,W4,W5,VAL) :- {SP = 4,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=VAL,W5=IV5}.
write_2(SP,IV0,IV1,IV2,IV3,IV4,IV5,W0,W1,W2,W3,W4,W5,VAL) :- {SP = 5,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=VAL}.
%END OF METHOD:gounzoum(III)I

