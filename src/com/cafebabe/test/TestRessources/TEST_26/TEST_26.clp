p_start(IV0,R) :-
         {IHS = 0, unify(HI,[])},
         p1_1_0(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R).
p_startD(IV0,NV0,NV1,NV2,NV3,NV4,R) :-
         {IHS = 0, unify(HI,[])},
         p1_1_0(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R).
p0_0_0(A,0,0,IHS,OHS,HI,HO,0) :- {OHS = IHS, unify(HI,HO)}.
writeMemory(HI,HO,OBJECTREF,FIELD,VALUE) :- {}, select(object(OBJECTREF,FIELD,_),HI,HO1),writeMemory(HO1,HO,OBJECTREF,FIELD,VALUE).
writeMemory(HI,[object(OBJECTREF,FIELD,VALUE)|HI],OBJECTREF,FIELD,VALUE).
readMemory([object(OBJECTREF,FIELD,VALUE)|Hs],OBJECTREF,FIELD,VALUE) :- {}.
readMemory([object(OBJECTREF1,FIELD1,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {OBJECTREF1\=OBJECTREF, FIELD1\=FIELD}, readMemory(HS,OBJECTREF,FIELD,VALUE).
readMemory([object(OBJECTREF,FIELD1,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {FIELD1\=FIELD}, readMemory(HS,OBJECTREF,FIELD,VALUE).
readMemory([object(OBJECTREF1,FIELD,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {OBJECTREF1\=OBJECTREF}, readMemory(HS,OBJECTREF,FIELD,VALUE).
readMemory(_,_,_,0) :- {}.
%CLASSFILE:TEST_26
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
p1_1_0(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 0,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX = 4,IV0 = 0,IV1 = 0,IV2 = 0,IV3 = 0,IV4 = 0,IV5 = 0,IV6 = 0,R = 0},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p1_1_1(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   1: istore_1[60](1)
p1_1_1(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 1,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p1_1_2(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   2: iconst_0[3](1)
p1_1_2(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 0,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p1_1_3(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   3: istore_2[61](1)
p1_1_3(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 2,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p1_1_4(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   4: new[187](3) 2
p1_1_4(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_VALUE_1 = IHS,IHS_NEW = IHS + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         writeMemory(HI,HI_NEW,IHS,0,2),
         p1_1_5(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS_NEW,OHS,HI_NEW,HO,R).
%   7: dup[89](1)
p1_1_5(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_INDEX_1 = SP_INDEX  + 1,WRITE_VALUE_1 = READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p1_1_6(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   8: invokespecial[183](3) 3
p1_1_6(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1)
,
         p2_0_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,SP_INDEX_CALL,IHS,OHS_CALL,HI,HO_NEW,R_NEW),
         p1_1_7(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,OHS_CALL,OHS,HO_NEW,HO,R).
%  11: astore_3[78](1)
p1_1_7(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 3,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p1_1_8(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  12: new[187](3) 4
p1_1_8(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_VALUE_1 = IHS,IHS_NEW = IHS + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         writeMemory(HI,HI_NEW,IHS,0,3),
         p1_1_9(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS_NEW,OHS,HI_NEW,HO,R).
%  15: dup[89](1)
p1_1_9(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_INDEX_1 = SP_INDEX  + 1,WRITE_VALUE_1 = READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p1_1_10(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  16: invokespecial[183](3) 5
p1_1_10(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1)
,
         p3_0_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,SP_INDEX_CALL,IHS,OHS_CALL,HI,HO_NEW,R_NEW),
         p1_1_11(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,OHS_CALL,OHS,HO_NEW,HO,R).
%  19: astore[58](2) 4
p1_1_11(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 4,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p1_1_12(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  21: aload_3[45](1)
p1_1_12(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 3,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p1_1_13(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  22: invokevirtual[182](3) 6
p1_1_13(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 0,ClassID = 3},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1)
,
         readMemory(HI,READ_VALUE_1,0,ClassID),
         p3_1_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,SP_INDEX_CALL,IHS,OHS_CALL,HI,HO_NEW,R_NEW),
         write_1(SP_INDEX_NEW,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,R_NEW)
,
         p1_1_14(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,OHS_CALL,OHS,HO_NEW,HO,R).
p1_1_13(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 0,ClassID = 2},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1)
,
         readMemory(HI,READ_VALUE_1,0,ClassID),
         p2_1_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,SP_INDEX_CALL,IHS,OHS_CALL,HI,HO_NEW,R_NEW),
         write_1(SP_INDEX_NEW,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,R_NEW)
,
         p1_1_14(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,OHS_CALL,OHS,HO_NEW,HO,R).
%  25: istore_1[60](1)
p1_1_14(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 1,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p1_1_15(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  26: aload[25](2) 4
p1_1_15(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 4,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p1_1_16(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  28: invokevirtual[182](3) 7
p1_1_16(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 0,ClassID = 3},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1)
,
         readMemory(HI,READ_VALUE_1,0,ClassID),
         p3_1_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,SP_INDEX_CALL,IHS,OHS_CALL,HI,HO_NEW,R_NEW),
         write_1(SP_INDEX_NEW,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,R_NEW)
,
         p1_1_17(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,OHS_CALL,OHS,HO_NEW,HO,R).
%  31: istore_2[61](1)
p1_1_17(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 2,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p1_1_18(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  32: return[177](1)
p1_1_18(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {IV0 = NV0,IV1 = NV1,IV2 = NV2,IV3 = NV3,IV4 = NV4,IV5 = NV5,IV6 = NV6,IHS = OHS,unify(HI,HO)}
.
%READ AND WRITE PREDICATES OF:main([Ljava/lang/String;)V
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV0) :- {SP = 0}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV1) :- {SP = 1}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV2) :- {SP = 2}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV3) :- {SP = 3}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV4) :- {SP = 4}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV5) :- {SP = 5}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV6) :- {SP = 6}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,W0,W1,W2,W3,W4,W5,W6,VAL) :- {SP = 0,W0=VAL,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=IV5,W6=IV6}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,W0,W1,W2,W3,W4,W5,W6,VAL) :- {SP = 1,W0=IV0,W1=VAL,W2=IV2,W3=IV3,W4=IV4,W5=IV5,W6=IV6}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,W0,W1,W2,W3,W4,W5,W6,VAL) :- {SP = 2,W0=IV0,W1=IV1,W2=VAL,W3=IV3,W4=IV4,W5=IV5,W6=IV6}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,W0,W1,W2,W3,W4,W5,W6,VAL) :- {SP = 3,W0=IV0,W1=IV1,W2=IV2,W3=VAL,W4=IV4,W5=IV5,W6=IV6}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,W0,W1,W2,W3,W4,W5,W6,VAL) :- {SP = 4,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=VAL,W5=IV5,W6=IV6}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,W0,W1,W2,W3,W4,W5,W6,VAL) :- {SP = 5,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=VAL,W6=IV6}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,W0,W1,W2,W3,W4,W5,W6,VAL) :- {SP = 6,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=IV5,W6=VAL}.
%END OF METHOD:main([Ljava/lang/String;)V

%CLASSFILE:O1_T26
%METHOD:<init>()V
%   0: aload_0[42](1)
p2_0_0(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,SP_INDEX = 0,IV1 = 0,R = 0},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p2_0_1(OV0,OV1,NV0,NV1,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   1: invokespecial[183](3) 1
p2_0_1(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1)
,
         p0_0_0(WRITE_VALUE_1,_,SP_INDEX_CALL,IHS,OHS_CALL,HI,HO_NEW,R_NEW),
         p2_0_2(IV0,IV1,NV0,NV1,SP_INDEX_NEW,OHS_CALL,OHS,HO_NEW,HO,R).
%   4: return[177](1)
p2_0_2(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {IV0 = NV0,IV1 = NV1,IHS = OHS,unify(HI,HO)}
.
%READ AND WRITE PREDICATES OF:<init>()V
read_0(SP,IV0,IV1,IV0) :- {SP = 0}.
read_0(SP,IV0,IV1,IV1) :- {SP = 1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 0,W0=VAL,W1=IV1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 1,W0=IV0,W1=VAL}.
%END OF METHOD:<init>()V
%METHOD:giveNumber()I
%   0: bipush[16](2) 11
p2_1_0(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 11,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX = 0,IV1 = 0},
         write_1(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p2_1_1(OV0,OV1,NV0,NV1,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   2: ireturn[172](1)
p2_1_1(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {IV0 = NV0,IV1 = NV1,READ_INDEX_1 = SP_INDEX,R = READ_VALUE_1,IHS = OHS,unify(HI,HO)},
         read_1(READ_INDEX_1,IV0,IV1,READ_VALUE_1)
.
%READ AND WRITE PREDICATES OF:giveNumber()I
read_1(SP,IV0,IV1,IV0) :- {SP = 0}.
read_1(SP,IV0,IV1,IV1) :- {SP = 1}.
write_1(SP,IV0,IV1,W0,W1,VAL) :- {SP = 0,W0=VAL,W1=IV1}.
write_1(SP,IV0,IV1,W0,W1,VAL) :- {SP = 1,W0=IV0,W1=VAL}.
%END OF METHOD:giveNumber()I

%CLASSFILE:O2_T26
%METHOD:<init>()V
%   0: aload_0[42](1)
p3_0_0(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,SP_INDEX = 0,IV1 = 0,R = 0},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p3_0_1(OV0,OV1,NV0,NV1,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   1: invokespecial[183](3) 1
p3_0_1(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1)
,
         p2_0_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,SP_INDEX_CALL,IHS,OHS_CALL,HI,HO_NEW,R_NEW),
         p3_0_2(IV0,IV1,NV0,NV1,SP_INDEX_NEW,OHS_CALL,OHS,HO_NEW,HO,R).
%   4: return[177](1)
p3_0_2(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {IV0 = NV0,IV1 = NV1,IHS = OHS,unify(HI,HO)}
.
%READ AND WRITE PREDICATES OF:<init>()V
read_0(SP,IV0,IV1,IV0) :- {SP = 0}.
read_0(SP,IV0,IV1,IV1) :- {SP = 1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 0,W0=VAL,W1=IV1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 1,W0=IV0,W1=VAL}.
%END OF METHOD:<init>()V
%METHOD:giveNumber()I
%   0: bipush[16](2) 22
p3_1_0(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 22,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX = 0,IV1 = 0},
         write_1(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p3_1_1(OV0,OV1,NV0,NV1,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   2: ireturn[172](1)
p3_1_1(IV0,IV1,NV0,NV1,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {IV0 = NV0,IV1 = NV1,READ_INDEX_1 = SP_INDEX,R = READ_VALUE_1,IHS = OHS,unify(HI,HO)},
         read_1(READ_INDEX_1,IV0,IV1,READ_VALUE_1)
.
%READ AND WRITE PREDICATES OF:giveNumber()I
read_1(SP,IV0,IV1,IV0) :- {SP = 0}.
read_1(SP,IV0,IV1,IV1) :- {SP = 1}.
write_1(SP,IV0,IV1,W0,W1,VAL) :- {SP = 0,W0=VAL,W1=IV1}.
write_1(SP,IV0,IV1,W0,W1,VAL) :- {SP = 1,W0=IV0,W1=VAL}.
%END OF METHOD:giveNumber()I
