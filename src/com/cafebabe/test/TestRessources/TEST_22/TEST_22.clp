p_start(IV0,R) :-
         {IHS = 0, unify(HI,[])},
         p1_1_0(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX,IHS,OHS,HI,HO,R).
p_startD(IV0,NV0,NV1,NV2,R) :-
         {IHS = 0, unify(HI,[])},
         p1_1_0(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX,IHS,OHS,HI,HO,R).
p0_0_0(A,0,0,IHS,OHS,HI,HO,0) :- {OHS = IHS, unify(HI,HO)}.
writeMemory(HI,HO,OBJECTREF,FIELD,VALUE) :- {}, select(object(OBJECTREF,FIELD,_),HI,HO1),writeMemory(HO1,HO,OBJECTREF,FIELD,VALUE).
writeMemory(HI,[object(OBJECTREF,FIELD,VALUE)|HI],OBJECTREF,FIELD,VALUE).
readMemory([object(OBJECTREF,FIELD,VALUE)|Hs],OBJECTREF,FIELD,VALUE) :- {}.
readMemory([object(OBJECTREF1,FIELD1,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {OBJECTREF1\=OBJECTREF, FIELD1\=FIELD}, readMemory(HS,OBJECTREF,FIELD,VALUE).
readMemory([object(OBJECTREF,FIELD1,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {FIELD1\=FIELD}, readMemory(HS,OBJECTREF,FIELD,VALUE).
readMemory([object(OBJECTREF1,FIELD,VALUE1)|HS],OBJECTREF,FIELD,VALUE) :- {OBJECTREF1\=OBJECTREF}, readMemory(HS,OBJECTREF,FIELD,VALUE).
readMemory(_,_,_,0) :- {}.
%CLASSFILE:TEST_22
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
%   0: new[187](3) 2
p1_1_0(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_VALUE_1 = IHS,IHS_NEW = IHS + 1,SP_INDEX = 2,IV0 = 0,IV1 = 0,IV2 = 0,IV3 = 0,IV4 = 0,R = 0},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,WRITE_VALUE_1),
         writeMemory(HI,HI1,IHS,0,2),
         writeMemory(HI1,HI2,IHS,1,0),
         writeMemory(HI2,HI_NEW,IHS,2,0),
         p1_1_1(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX_NEW,IHS_NEW,OHS,HI_NEW,HO,R).
%   3: dup[89](1)
p1_1_1(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_INDEX_1 = SP_INDEX  + 1,WRITE_VALUE_1 = READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,WRITE_VALUE_1),
         p1_1_2(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   4: invokespecial[183](3) 3
p1_1_2(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,WRITE_VALUE_3 = 0,WRITE_VALUE_4 = 0,WRITE_VALUE_5 = 0,WRITE_VALUE_6 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,READ_VALUE_1)
,
         p2_0_0(WRITE_VALUE_1,WRITE_VALUE_2,WRITE_VALUE_3,WRITE_VALUE_4,WRITE_VALUE_5,WRITE_VALUE_6,_,_,_,_,_,_,SP_INDEX_CALL,IHS,OHS_CALL,HI,HO_NEW,R_NEW),
         p1_1_3(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX_NEW,OHS_CALL,OHS,HO_NEW,HO,R).
%   7: astore_1[76](1)
p1_1_3(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 1,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,WRITE_VALUE_1),
         p1_1_4(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   8: aload_1[43](1)
p1_1_4(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 1,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,WRITE_VALUE_1),
         p1_1_5(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   9: getfield[180](3) 4
p1_1_5(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = FIELD_VALUE,SP_INDEX_NEW = SP_INDEX},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,WRITE_VALUE_1),
         readMemory(HI,READ_VALUE_1,2,FIELD_VALUE),
         p1_1_6(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  12: istore_2[61](1)
p1_1_6(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 2,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,WRITE_VALUE_1),
         p1_1_7(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  13: return[177](1)
p1_1_7(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {IV0 = NV0,IV1 = NV1,IV2 = NV2,IV3 = NV3,IV4 = NV4,IHS = OHS,unify(HI,HO)}
.
%READ AND WRITE PREDICATES OF:main([Ljava/lang/String;)V
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV0) :- {SP = 0}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV1) :- {SP = 1}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV2) :- {SP = 2}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV3) :- {SP = 3}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV4) :- {SP = 4}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,W0,W1,W2,W3,W4,VAL) :- {SP = 0,W0=VAL,W1=IV1,W2=IV2,W3=IV3,W4=IV4}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,W0,W1,W2,W3,W4,VAL) :- {SP = 1,W0=IV0,W1=VAL,W2=IV2,W3=IV3,W4=IV4}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,W0,W1,W2,W3,W4,VAL) :- {SP = 2,W0=IV0,W1=IV1,W2=VAL,W3=IV3,W4=IV4}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,W0,W1,W2,W3,W4,VAL) :- {SP = 3,W0=IV0,W1=IV1,W2=IV2,W3=VAL,W4=IV4}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,W0,W1,W2,W3,W4,VAL) :- {SP = 4,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=VAL}.
%END OF METHOD:main([Ljava/lang/String;)V

%CLASSFILE:O1_T22
%METHOD:<init>()V
%   0: aload_0[42](1)
p2_0_0(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,SP_INDEX = 0,IV1 = 0,IV2 = 0,IV3 = 0,IV4 = 0,IV5 = 0,R = 0},
         read_0(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p2_0_1(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   1: invokespecial[183](3) 1
p2_0_1(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1},
         read_0(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1)
,
         p0_0_0(WRITE_VALUE_1,_,SP_INDEX_CALL,IHS,OHS_CALL,HI,HO_NEW,R_NEW),
         p2_0_2(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,OHS_CALL,OHS,HO_NEW,HO,R).
%   4: aload_0[42](1)
p2_0_2(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_0(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p2_0_3(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   5: bipush[16](2) 6
p2_0_3(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 6,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_0(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p2_0_4(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   7: putfield[181](3) 2
p2_0_4(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_2 = SP_INDEX  - 1,READ_INDEX_1 = SP_INDEX,SP_INDEX_NEW = SP_INDEX - 2},
         read_0(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         read_0(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_2)
,
         writeMemory(HI,HI_NEW,READ_VALUE_2,1,READ_VALUE_1),
         p2_0_5(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI_NEW,HO,R).
%  10: aload_0[42](1)
p2_0_5(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_0(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p2_0_6(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  11: aload_0[42](1)
p2_0_6(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_0(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p2_0_7(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  12: bipush[16](2) 19
p2_0_7(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 19,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_0(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p2_0_8(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  14: aload_0[42](1)
p2_0_8(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_0(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p2_0_9(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  15: getfield[180](3) 2
p2_0_9(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = FIELD_VALUE,SP_INDEX_NEW = SP_INDEX},
         read_0(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         readMemory(HI,READ_VALUE_1,1,FIELD_VALUE),
         p2_0_10(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  18: bipush[16](2) 54
p2_0_10(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 54,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_0(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,WRITE_VALUE_1),
         p2_0_11(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  20: invokespecial[183](3) 3
p2_0_11(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = READ_VALUE_2,WRITE_VALUE_3 = READ_VALUE_3,WRITE_VALUE_4 = READ_VALUE_4,WRITE_VALUE_5 = 0,WRITE_VALUE_6 = 0,WRITE_VALUE_7 = 0,READ_INDEX_1 = SP_INDEX - 3,READ_INDEX_2 = SP_INDEX - 2,READ_INDEX_3 = SP_INDEX - 1,READ_INDEX_4 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 3},
         read_0(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         read_0(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_2),
         read_0(READ_INDEX_3,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_3),
         read_0(READ_INDEX_4,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_4)
,
         p2_1_0(WRITE_VALUE_1,WRITE_VALUE_2,WRITE_VALUE_3,WRITE_VALUE_4,WRITE_VALUE_5,WRITE_VALUE_6,WRITE_VALUE_7,_,_,_,_,_,_,_,SP_INDEX_CALL,IHS,OHS_CALL,HI,HO_NEW,R_NEW),
         write_0(SP_INDEX_NEW,IV0,IV1,IV2,IV3,IV4,IV5,OV0,OV1,OV2,OV3,OV4,OV5,R_NEW)
,
         p2_0_12(OV0,OV1,OV2,OV3,OV4,OV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,OHS_CALL,OHS,HO_NEW,HO,R).
%  23: putfield[181](3) 4
p2_0_12(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_2 = SP_INDEX  - 1,READ_INDEX_1 = SP_INDEX,SP_INDEX_NEW = SP_INDEX - 2},
         read_0(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_1),
         read_0(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,READ_VALUE_2)
,
         writeMemory(HI,HI_NEW,READ_VALUE_2,2,READ_VALUE_1),
         p2_0_13(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX_NEW,IHS,OHS,HI_NEW,HO,R).
%  26: return[177](1)
p2_0_13(IV0,IV1,IV2,IV3,IV4,IV5,NV0,NV1,NV2,NV3,NV4,NV5,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {IV0 = NV0,IV1 = NV1,IV2 = NV2,IV3 = NV3,IV4 = NV4,IV5 = NV5,IHS = OHS,unify(HI,HO)}
.
%READ AND WRITE PREDICATES OF:<init>()V
read_0(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV0) :- {SP = 0}.
read_0(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV1) :- {SP = 1}.
read_0(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV2) :- {SP = 2}.
read_0(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV3) :- {SP = 3}.
read_0(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV4) :- {SP = 4}.
read_0(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV5) :- {SP = 5}.
write_0(SP,IV0,IV1,IV2,IV3,IV4,IV5,W0,W1,W2,W3,W4,W5,VAL) :- {SP = 0,W0=VAL,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=IV5}.
write_0(SP,IV0,IV1,IV2,IV3,IV4,IV5,W0,W1,W2,W3,W4,W5,VAL) :- {SP = 1,W0=IV0,W1=VAL,W2=IV2,W3=IV3,W4=IV4,W5=IV5}.
write_0(SP,IV0,IV1,IV2,IV3,IV4,IV5,W0,W1,W2,W3,W4,W5,VAL) :- {SP = 2,W0=IV0,W1=IV1,W2=VAL,W3=IV3,W4=IV4,W5=IV5}.
write_0(SP,IV0,IV1,IV2,IV3,IV4,IV5,W0,W1,W2,W3,W4,W5,VAL) :- {SP = 3,W0=IV0,W1=IV1,W2=IV2,W3=VAL,W4=IV4,W5=IV5}.
write_0(SP,IV0,IV1,IV2,IV3,IV4,IV5,W0,W1,W2,W3,W4,W5,VAL) :- {SP = 4,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=VAL,W5=IV5}.
write_0(SP,IV0,IV1,IV2,IV3,IV4,IV5,W0,W1,W2,W3,W4,W5,VAL) :- {SP = 5,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=VAL}.
%END OF METHOD:<init>()V
%METHOD:arit(III)I
%   0: iload_1[27](1)
p2_1_0(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 1,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,SP_INDEX = 3,IV4 = 0,IV5 = 0,IV6 = 0},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p2_1_1(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   1: iconst_2[5](1)
p2_1_1(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 2,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p2_1_2(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   2: iload_2[28](1)
p2_1_2(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 2,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p2_1_3(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   3: imul[104](1)
p2_1_3(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,WRITE_VALUE_1 = READ_VALUE_2 * READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_2),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p2_1_4(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   4: isub[100](1)
p2_1_4(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,WRITE_VALUE_1 = READ_VALUE_2 -READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_2),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p2_1_5(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   5: iload_1[27](1)
p2_1_5(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 1,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p2_1_6(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   6: iadd[96](1)
p2_1_6(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,WRITE_VALUE_1 = READ_VALUE_2 +READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_2),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p2_1_7(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   7: bipush[16](2) 8
p2_1_7(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {WRITE_VALUE_1 = 8,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p2_1_8(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%   9: isub[100](1)
p2_1_8(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,WRITE_VALUE_1 = READ_VALUE_2 -READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_2),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p2_1_9(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  10: iload_3[29](1)
p2_1_9(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = 3,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p2_1_10(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  11: iadd[96](1)
p2_1_10(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,WRITE_VALUE_1 = READ_VALUE_2 +READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_2),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,OV0,OV1,OV2,OV3,OV4,OV5,OV6,WRITE_VALUE_1),
         p2_1_11(OV0,OV1,OV2,OV3,OV4,OV5,OV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX_NEW,IHS,OHS,HI,HO,R).
%  12: ireturn[172](1)
p2_1_11(IV0,IV1,IV2,IV3,IV4,IV5,IV6,NV0,NV1,NV2,NV3,NV4,NV5,NV6,SP_INDEX,IHS,OHS,HI,HO,R) :-
         {IV0 = NV0,IV1 = NV1,IV2 = NV2,IV3 = NV3,IV4 = NV4,IV5 = NV5,IV6 = NV6,READ_INDEX_1 = SP_INDEX,R = READ_VALUE_1,IHS = OHS,unify(HI,HO)},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,READ_VALUE_1)
.
%READ AND WRITE PREDICATES OF:arit(III)I
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
%END OF METHOD:arit(III)I

