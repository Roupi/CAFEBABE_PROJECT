p_start(IV0,R) :-
         {IHS = 0, unify(HI,[])},
         p1_1_0(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R).
p_startD(IV0,NV0,NV1,NV2,NV3,NV4,R) :-
         {IHS = 0, unify(HI,[])},
         p1_1_0(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R).
p0_0_0(A,0,0,IHS,OHS,HI,HO,0) :- {OHS = IHS, unify(HI,HO)}.
writeMemory(HI,HO,OBJECTREF,FIELD,VALUE) :- {}, select(object(OBJECTREF,FIELD,_),HI,HO1),writeMemory(HO1,HO,OBJECTREF,FIELD,VALUE).
writeMemory(HI,[object(OBJECTREF,FIELD,VALUE)|HI],OBJECTREF,FIELD,VALUE).
readMemory([object(OBJECTREF,FIELD,VALUE)|Hs],OBJECTREF,FIELD,VALUE) :- {}.
readMemory([object(OBJECTREF1,FIELD1,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {OBJECTREF1\=OBJECTREF, FIELD1\=FIELD}, readMemory(HS,OBJECTREF,FIELD,VALUE).
readMemory([object(OBJECTREF,FIELD1,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {FIELD1\=FIELD}, readMemory(HS,OBJECTREF,FIELD,VALUE).
readMemory([object(OBJECTREF1,FIELD,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {OBJECTREF1\=OBJECTREF}, readMemory(HS,OBJECTREF,FIELD,VALUE).
readMemory(_,_,_,0) :- {}.
%CLASSFILE:TEST_13
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
%   0: iconst_0[3](1)
p1_1_0(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 0,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX = 4,IV0 = 0,IV1 = 0,IV2 = 0,IV3 = 0,IV4 = 0,IV5 = 0,IV6 = 0,IV7 = 0,IV8 = 0,R = 0},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_1(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   1: istore_1[60](1)
p1_1_1(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 1,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_2(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   2: bipush[16](2) 11
p1_1_2(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 11,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_3(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   4: istore_2[61](1)
p1_1_3(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 2,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_4(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   5: ldc2_w[20](3) 2
p1_1_4(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 10,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_5(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   8: dstore_3[74](1)
p1_1_5(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 3,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_6(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   9: ldc2_w[20](3) 4
p1_1_6(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 30,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_7(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  12: dstore[57](2) 5
p1_1_7(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 4,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_8(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  14: dload_3[41](1)
p1_1_8(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 3,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_9(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  15: dload[24](2) 5
p1_1_9(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 4,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_10(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  17: dcmpg[152](1)
p1_1_10(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1,READ_VALUE_2 > READ_VALUE_1,WRITE_VALUE_1 = 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_2),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_11(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
p1_1_10(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1,READ_VALUE_2 = READ_VALUE_1,WRITE_VALUE_1 = 0},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_2),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_11(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
p1_1_10(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1,READ_VALUE_2 < READ_VALUE_1,WRITE_VALUE_1 = -1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_2),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_11(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  18: ifge[156](3) -> 57
p1_1_11(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,SP_INDEX_NEW = SP_INDEX  - 1,READ_VALUE_1 < 0},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1)
,
         p1_1_12(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
p1_1_11(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,SP_INDEX_NEW = SP_INDEX  - 1,READ_VALUE_1 >= 0},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1)
,
         p1_1_33(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  21: iload_1[27](1)
p1_1_12(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 1,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_13(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  22: bipush[16](2) 10
p1_1_13(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 10,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_14(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  24: if_icmpge[162](3) -> 33
p1_1_14(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,SP_INDEX_NEW = SP_INDEX - 2,READ_VALUE_2 < READ_VALUE_1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_2)
,
         p1_1_15(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
p1_1_14(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,SP_INDEX_NEW = SP_INDEX - 2,READ_VALUE_2 >= READ_VALUE_1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_2)
,
         p1_1_17(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  27: iinc[132](3) 1 1
p1_1_15(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 1,WRITE_INDEX_1 = 1,WRITE_VALUE_1 = READ_VALUE_1 +1,SP_INDEX_NEW = SP_INDEX},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_16(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  30: goto[167](3) -> 21
p1_1_16(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {SP_INDEX_NEW = SP_INDEX}
,
         p1_1_12(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  33: dload_3[41](1)
p1_1_17(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 3,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_18(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  34: dload[24](2) 5
p1_1_18(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 4,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_19(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  36: dcmpg[152](1)
p1_1_19(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1,READ_VALUE_2 > READ_VALUE_1,WRITE_VALUE_1 = 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_2),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_20(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
p1_1_19(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1,READ_VALUE_2 = READ_VALUE_1,WRITE_VALUE_1 = 0},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_2),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_20(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
p1_1_19(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1,READ_VALUE_2 < READ_VALUE_1,WRITE_VALUE_1 = -1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_2),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_20(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  37: ifge[156](3) -> 14
p1_1_20(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,SP_INDEX_NEW = SP_INDEX  - 1,READ_VALUE_1 < 0},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1)
,
         p1_1_21(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
p1_1_20(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,SP_INDEX_NEW = SP_INDEX  - 1,READ_VALUE_1 >= 0},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1)
,
         p1_1_8(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  40: dload_3[41](1)
p1_1_21(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 3,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_22(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  41: dload_3[41](1)
p1_1_22(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 3,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_23(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  42: dadd[99](1)
p1_1_23(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,WRITE_VALUE_1 = READ_VALUE_2 +READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_2),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_24(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  43: dstore_3[74](1)
p1_1_24(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 3,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_25(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  44: iload_2[28](1)
p1_1_25(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 2,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_26(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  45: bipush[16](2) 11
p1_1_26(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 11,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_27(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  47: if_icmpne[160](3) -> 14
p1_1_27(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,SP_INDEX_NEW = SP_INDEX - 2,READ_VALUE_2 = READ_VALUE_1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_2)
,
         p1_1_28(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
p1_1_27(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,SP_INDEX_NEW = SP_INDEX - 2,READ_VALUE_2 \= READ_VALUE_1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_2)
,
         p1_1_8(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  50: iload_2[28](1)
p1_1_28(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 2,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_29(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  51: iconst_2[5](1)
p1_1_29(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 2,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_30(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  52: isub[100](1)
p1_1_30(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,WRITE_VALUE_1 = READ_VALUE_2 -READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_2),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_31(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  53: istore_2[61](1)
p1_1_31(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 2,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,WRITE_VALUE_1),
         p1_1_32(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,OV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  54: goto[167](3) -> 14
p1_1_32(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {SP_INDEX_NEW = SP_INDEX}
,
         p1_1_8(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  57: return[177](1)
p1_1_33(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,NV8,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {IV0 = NV0,IV1 = NV1,IV2 = NV2,IV3 = NV3,IV4 = NV4,IV5 = NV5,IV6 = NV6,IV7 = NV7,IV8 = NV8,IHS = OHS,unify(HI,HO)}
.
%READ AND WRITE PREDICATES OF:main([Ljava/lang/String;)V
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,IV0) :- {SP = 0}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,IV1) :- {SP = 1}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,IV2) :- {SP = 2}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,IV3) :- {SP = 3}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,IV4) :- {SP = 4}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,IV5) :- {SP = 5}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,IV6) :- {SP = 6}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,IV7) :- {SP = 7}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,IV8) :- {SP = 8}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,W0,W1,W2,W3,W4,W5,W6,W7,W8,VAL) :- {SP = 0,W0=VAL,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=IV5,W6=IV6,W7=IV7,W8=IV8}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,W0,W1,W2,W3,W4,W5,W6,W7,W8,VAL) :- {SP = 1,W0=IV0,W1=VAL,W2=IV2,W3=IV3,W4=IV4,W5=IV5,W6=IV6,W7=IV7,W8=IV8}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,W0,W1,W2,W3,W4,W5,W6,W7,W8,VAL) :- {SP = 2,W0=IV0,W1=IV1,W2=VAL,W3=IV3,W4=IV4,W5=IV5,W6=IV6,W7=IV7,W8=IV8}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,W0,W1,W2,W3,W4,W5,W6,W7,W8,VAL) :- {SP = 3,W0=IV0,W1=IV1,W2=IV2,W3=VAL,W4=IV4,W5=IV5,W6=IV6,W7=IV7,W8=IV8}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,W0,W1,W2,W3,W4,W5,W6,W7,W8,VAL) :- {SP = 4,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=VAL,W5=IV5,W6=IV6,W7=IV7,W8=IV8}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,W0,W1,W2,W3,W4,W5,W6,W7,W8,VAL) :- {SP = 5,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=VAL,W6=IV6,W7=IV7,W8=IV8}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,W0,W1,W2,W3,W4,W5,W6,W7,W8,VAL) :- {SP = 6,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=IV5,W6=VAL,W7=IV7,W8=IV8}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,W0,W1,W2,W3,W4,W5,W6,W7,W8,VAL) :- {SP = 7,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=IV5,W6=IV6,W7=VAL,W8=IV8}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV8,W0,W1,W2,W3,W4,W5,W6,W7,W8,VAL) :- {SP = 8,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=IV5,W6=IV6,W7=IV7,W8=VAL}.
%END OF METHOD:main([Ljava/lang/String;)V
