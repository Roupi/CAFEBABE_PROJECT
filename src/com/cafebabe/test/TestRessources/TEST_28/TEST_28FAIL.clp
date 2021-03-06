p_start(IV0,R) :-
         {IHS = 0},
         p2_1_0(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R).
p_startD(IV0,NV0,NV1,NV2,NV3,NV4,NV5,R) :-
         {IHS = 0},
         p2_1_0(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R).
p0_0_0(A,0,0,0,0,IHS,OHS,0) :- {OHS = IHS}.
readMemory(OBJECTREF,FIELD,VALUE) :- {}, object(OBJECTREF,FIELD,VALUE).
readMemory(_,_,0) :- {}.
writeMemory(OBJECTREF,FIELD,VALUE) :- {}, retract(object(OBJECTREF,FIELD,X)), assert(object(OBJECTREF,FIELD,VALUE)).
writeMemory(OBJECTREF,FIELD,VALUE) :- {}, assert(object(OBJECTREF,FIELD,VALUE)).
%CLASSFILE:O2_T28
%METHOD:<init>()V
%   0: aload_0[42](1)
p1_0_0(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,SP_INDEX = 0,IV1 = 0,IM = 0,OM = 0,R = 0,SP_INDEX = 0,IV1 = 0,IM = 0,OM = 0,R = 0},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p1_0_1(OV0,OV1,NV0,NV1,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   1: invokespecial[183](3) 1
p1_0_1(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,WRITE_VALUE_3 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1)
,
         p3_0_0(WRITE_VALUE_1,WRITE_VALUE_2,WRITE_VALUE_3,_,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         p1_0_2(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%   4: return[177](1)
p1_0_2(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {IV0 = NV0,IHS = OHS,IV1 = NV1,IHS = OHS}.
%READ AND WRITE PREDICATES OF:<init>()V
read_0(SP,IV0,IV1,IV0) :- {SP = 0}.
read_0(SP,IV0,IV1,IV1) :- {SP = 1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 0,W0=VAL,W1=IV1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 1,W0=IV0,W1=VAL}.
%END OF METHOD:<init>()V
%METHOD:mm()I
%   0: bipush[16](2) 10
p1_1_0(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = 10,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX = 0,IV1 = 0,IM = 0,OM = 0,SP_INDEX = 0,IV1 = 0,IM = 0,OM = 0},
         write_1(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p1_1_1(OV0,OV1,NV0,NV1,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   2: ireturn[172](1)
p1_1_1(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {IV0 = NV0,IHS = OHS,IV1 = NV1,IHS = OHS,READ_INDEX_1 = SP_INDEX,R = READ_VALUE_1},
         read_1(READ_INDEX_1,IV0,IV1,READ_VALUE_1).
%READ AND WRITE PREDICATES OF:mm()I
read_1(SP,IV0,IV1,IV0) :- {SP = 0}.
read_1(SP,IV0,IV1,IV1) :- {SP = 1}.
write_1(SP,IV0,IV1,W0,W1,VAL) :- {SP = 0,W0=VAL,W1=IV1}.
write_1(SP,IV0,IV1,W0,W1,VAL) :- {SP = 1,W0=IV0,W1=VAL}.
%END OF METHOD:mm()I



%CLASSFILE:TEST_28
%METHOD:<init>()V
%   0: aload_0[42](1)
p2_0_0(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,SP_INDEX = 0,IV1 = 0,IM = 0,OM = 0,R = 0,SP_INDEX = 0,IV1 = 0,IM = 0,OM = 0,R = 0},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p2_0_1(OV0,OV1,NV0,NV1,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   1: invokespecial[183](3) 1
p2_0_1(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1)
,
         p0_0_0(WRITE_VALUE_1,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         p2_0_2(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%   4: return[177](1)
p2_0_2(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {IV0 = NV0,IHS = OHS,IV1 = NV1,IHS = OHS}.
%READ AND WRITE PREDICATES OF:<init>()V
read_0(SP,IV0,IV1,IV0) :- {SP = 0}.
read_0(SP,IV0,IV1,IV1) :- {SP = 1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 0,W0=VAL,W1=IV1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 1,W0=IV0,W1=VAL}.
%END OF METHOD:<init>()V
%METHOD:main([Ljava/lang/String;)V
%   0: iconst_0[3](1)
p2_1_0(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = 0,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX = 5,IV0 = 0,IV1 = 0,IV2 = 0,IV3 = 0,IV4 = 0,IV5 = 0,IV6 = 0,IV7 = 0,IM = 0,OM = 0,R = 0,SP_INDEX = 5,IV0 = 0,IV1 = 0,IV2 = 0,IV3 = 0,IV4 = 0,IV5 = 0,IV6 = 0,IV7 = 0,IM = 0,OM = 0,R = 0},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_1(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   1: istore_1[60](1)
p2_1_1(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 1,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_2(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   2: iconst_0[3](1)
p2_1_2(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = 0,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_3(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   3: istore_2[61](1)
p2_1_3(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 2,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_4(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   4: iconst_0[3](1)
p2_1_4(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = 0,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_5(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   5: istore_3[62](1)
p2_1_5(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 3,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_6(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   6: iload_1[27](1)
p2_1_6(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = 1,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_7(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   7: iconst_1[4](1)
p2_1_7(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = 1,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_8(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   8: if_icmplt[161](3) -> 21
p2_1_8(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,SP_INDEX_NEW = SP_INDEX - 2,READ_VALUE_2 >= READ_VALUE_1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_2)
,
         p2_1_9(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
p2_1_8(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,SP_INDEX_NEW = SP_INDEX - 2,READ_VALUE_2 < READ_VALUE_1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_2)
,
         p2_1_13(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  11: new[187](3) 2
p2_1_9(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_VALUE_1 = IHS,IHS_NEW = IHS + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         writeMemory(IHS,1,0),
         writeMemory(IHS,0,3),
         p2_1_10(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS_NEW,OHS,R).
%  14: dup[89](1)
p2_1_10(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_INDEX_1 = SP_INDEX  + 1,WRITE_VALUE_1 = READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_11(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  15: invokespecial[183](3) 3
p2_1_11(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,WRITE_VALUE_3 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1)
,
         p3_0_0(WRITE_VALUE_1,WRITE_VALUE_2,WRITE_VALUE_3,_,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         p2_1_12(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%  18: goto[167](3) -> 28
p2_1_12(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {SP_INDEX_NEW = SP_INDEX}
,
         p2_1_16(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  21: new[187](3) 4
p2_1_13(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_VALUE_1 = IHS,IHS_NEW = IHS + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         writeMemory(IHS,1,0),
         writeMemory(IHS,0,1),
         p2_1_14(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS_NEW,OHS,R).
%  24: dup[89](1)
p2_1_14(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_INDEX_1 = SP_INDEX  + 1,WRITE_VALUE_1 = READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_15(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  25: invokespecial[183](3) 5
p2_1_15(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1)
,
         p1_0_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         p2_1_16(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%  28: astore[58](2) 4
p2_1_16(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 4,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_17(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  30: aload[25](2) 4
p2_1_17(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = 4,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_18(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  32: invokevirtual[182](3) 6
p2_1_18(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,WRITE_VALUE_3 = 0,WRITE_VALUE_4 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1,ClassID = 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1)
,
         p3_1_0(WRITE_VALUE_1,WRITE_VALUE_2,WRITE_VALUE_3,WRITE_VALUE_4,_,_,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         readMemory(READ_VALUE_1,0,ClassID),
         p2_1_19(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
p2_1_18(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,WRITE_VALUE_3 = 0,WRITE_VALUE_4 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1,ClassID = 3},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1)
,
         p3_1_0(WRITE_VALUE_1,WRITE_VALUE_2,WRITE_VALUE_3,WRITE_VALUE_4,_,_,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         readMemory(READ_VALUE_1,0,ClassID),
         p2_1_19(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%  35: aload[25](2) 4
p2_1_19(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = 4,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_20(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  37: invokevirtual[182](3) 7
p2_1_20(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 0,ClassID = 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1)
,
         p1_1_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         write_1(SP_INDEX_NEW,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,R_NEW)
,
         readMemory(READ_VALUE_1,0,ClassID),
         p2_1_21(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
p2_1_20(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,WRITE_VALUE_3 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 0,ClassID = 3},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1)
,
         p3_2_0(WRITE_VALUE_1,WRITE_VALUE_2,WRITE_VALUE_3,_,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         write_1(SP_INDEX_NEW,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,R_NEW)
,
         readMemory(READ_VALUE_1,0,ClassID),
         p2_1_21(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%  40: istore_2[61](1)
p2_1_21(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 2,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_22(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  41: iconst_1[4](1)
p2_1_22(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = 1,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_23(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  42: istore_1[60](1)
p2_1_23(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 1,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_24(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  43: iload_1[27](1)
p2_1_24(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = 1,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_25(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  44: iconst_1[4](1)
p2_1_25(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = 1,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_26(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  45: if_icmplt[161](3) -> 58
p2_1_26(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,SP_INDEX_NEW = SP_INDEX - 2,READ_VALUE_2 >= READ_VALUE_1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_2)
,
         p2_1_27(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
p2_1_26(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,SP_INDEX_NEW = SP_INDEX - 2,READ_VALUE_2 < READ_VALUE_1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_2)
,
         p2_1_31(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  48: new[187](3) 2
p2_1_27(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_VALUE_1 = IHS,IHS_NEW = IHS + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         writeMemory(IHS,1,0),
         writeMemory(IHS,0,3),
         p2_1_28(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS_NEW,OHS,R).
%  51: dup[89](1)
p2_1_28(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_INDEX_1 = SP_INDEX  + 1,WRITE_VALUE_1 = READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_29(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  52: invokespecial[183](3) 3
p2_1_29(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,WRITE_VALUE_3 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1)
,
         p3_0_0(WRITE_VALUE_1,WRITE_VALUE_2,WRITE_VALUE_3,_,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         p2_1_30(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%  55: goto[167](3) -> 65
p2_1_30(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {SP_INDEX_NEW = SP_INDEX}
,
         p2_1_34(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  58: new[187](3) 4
p2_1_31(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_VALUE_1 = IHS,IHS_NEW = IHS + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         writeMemory(IHS,1,0),
         writeMemory(IHS,0,1),
         p2_1_32(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS_NEW,OHS,R).
%  61: dup[89](1)
p2_1_32(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_INDEX_1 = SP_INDEX  + 1,WRITE_VALUE_1 = READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_33(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  62: invokespecial[183](3) 5
p2_1_33(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1)
,
         p1_0_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         p2_1_34(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%  65: astore[58](2) 5
p2_1_34(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 5,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_35(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  67: aload[25](2) 5
p2_1_35(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = 5,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_36(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  69: invokevirtual[182](3) 6
p2_1_36(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,WRITE_VALUE_3 = 0,WRITE_VALUE_4 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1,ClassID = 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1)
,
         p3_1_0(WRITE_VALUE_1,WRITE_VALUE_2,WRITE_VALUE_3,WRITE_VALUE_4,_,_,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         readMemory(READ_VALUE_1,0,ClassID),
         p2_1_37(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
p2_1_36(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,WRITE_VALUE_3 = 0,WRITE_VALUE_4 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1,ClassID = 3},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1)
,
         p3_1_0(WRITE_VALUE_1,WRITE_VALUE_2,WRITE_VALUE_3,WRITE_VALUE_4,_,_,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         readMemory(READ_VALUE_1,0,ClassID),
         p2_1_37(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%  72: aload[25](2) 5
p2_1_37(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = 5,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_38(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  74: invokevirtual[182](3) 7
p2_1_38(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 0,ClassID = 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1)
,
         p1_1_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         write_1(SP_INDEX_NEW,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,R_NEW)
,
         readMemory(READ_VALUE_1,0,ClassID),
         p2_1_39(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
p2_1_38(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,WRITE_VALUE_3 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 0,ClassID = 3},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1)
,
         p3_2_0(WRITE_VALUE_1,WRITE_VALUE_2,WRITE_VALUE_3,_,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         write_1(SP_INDEX_NEW,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,R_NEW)
,
         readMemory(READ_VALUE_1,0,ClassID),
         p2_1_39(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%  77: istore_3[62](1)
p2_1_39(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 3,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,WRITE_VALUE_1),
         p2_1_40(OV0,OV1,OV2,OV3,OV4,OV5,OV6,OV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  78: return[177](1)
p2_1_40(IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,NV0,NV1,NV2,NV3,NV4,NV5,NV6,NV7,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {IV0 = NV0,IHS = OHS,IV1 = NV1,IHS = OHS,IV2 = NV2,IHS = OHS,IV3 = NV3,IHS = OHS,IV4 = NV4,IHS = OHS,IV5 = NV5,IHS = OHS,IV6 = NV6,IHS = OHS,IV7 = NV7,IHS = OHS}.
%READ AND WRITE PREDICATES OF:main([Ljava/lang/String;)V
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV0) :- {SP = 0}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV1) :- {SP = 1}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV2) :- {SP = 2}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV3) :- {SP = 3}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV4) :- {SP = 4}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV5) :- {SP = 5}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV6) :- {SP = 6}.
read_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,IV7) :- {SP = 7}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,W0,W1,W2,W3,W4,W5,W6,W7,VAL) :- {SP = 0,W0=VAL,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=IV5,W6=IV6,W7=IV7}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,W0,W1,W2,W3,W4,W5,W6,W7,VAL) :- {SP = 1,W0=IV0,W1=VAL,W2=IV2,W3=IV3,W4=IV4,W5=IV5,W6=IV6,W7=IV7}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,W0,W1,W2,W3,W4,W5,W6,W7,VAL) :- {SP = 2,W0=IV0,W1=IV1,W2=VAL,W3=IV3,W4=IV4,W5=IV5,W6=IV6,W7=IV7}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,W0,W1,W2,W3,W4,W5,W6,W7,VAL) :- {SP = 3,W0=IV0,W1=IV1,W2=IV2,W3=VAL,W4=IV4,W5=IV5,W6=IV6,W7=IV7}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,W0,W1,W2,W3,W4,W5,W6,W7,VAL) :- {SP = 4,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=VAL,W5=IV5,W6=IV6,W7=IV7}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,W0,W1,W2,W3,W4,W5,W6,W7,VAL) :- {SP = 5,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=VAL,W6=IV6,W7=IV7}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,W0,W1,W2,W3,W4,W5,W6,W7,VAL) :- {SP = 6,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=IV5,W6=VAL,W7=IV7}.
write_1(SP,IV0,IV1,IV2,IV3,IV4,IV5,IV6,IV7,W0,W1,W2,W3,W4,W5,W6,W7,VAL) :- {SP = 7,W0=IV0,W1=IV1,W2=IV2,W3=IV3,W4=IV4,W5=IV5,W6=IV6,W7=VAL}.
%END OF METHOD:main([Ljava/lang/String;)V



%CLASSFILE:O1_T28
%METHOD:<init>()V
%   0: aload_0[42](1)
p3_0_0(IV0,IV1,IV2,NV0,NV1,NV2,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,SP_INDEX = 0,IV1 = 0,IV2 = 0,IM = 0,OM = 0,R = 0,SP_INDEX = 0,IV1 = 0,IV2 = 0,IM = 0,OM = 0,R = 0},
         read_0(READ_INDEX_1,IV0,IV1,IV2,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,IV2,OV0,OV1,OV2,WRITE_VALUE_1),
         p3_0_1(OV0,OV1,OV2,NV0,NV1,NV2,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   1: invokespecial[183](3) 1
p3_0_1(IV0,IV1,IV2,NV0,NV1,NV2,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 1},
         read_0(READ_INDEX_1,IV0,IV1,IV2,READ_VALUE_1)
,
         p0_0_0(WRITE_VALUE_1,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         p3_0_2(IV0,IV1,IV2,NV0,NV1,NV2,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%   4: aload_0[42](1)
p3_0_2(IV0,IV1,IV2,NV0,NV1,NV2,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_0(READ_INDEX_1,IV0,IV1,IV2,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,IV2,OV0,OV1,OV2,WRITE_VALUE_1),
         p3_0_3(OV0,OV1,OV2,NV0,NV1,NV2,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   5: iconst_5[8](1)
p3_0_3(IV0,IV1,IV2,NV0,NV1,NV2,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = 5,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_0(WRITE_INDEX_1,IV0,IV1,IV2,OV0,OV1,OV2,WRITE_VALUE_1),
         p3_0_4(OV0,OV1,OV2,NV0,NV1,NV2,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   6: putfield[181](3) 2
p3_0_4(IV0,IV1,IV2,NV0,NV1,NV2,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_2 = SP_INDEX  - 1,READ_INDEX_1 = SP_INDEX,SP_INDEX_NEW = SP_INDEX - 2},
         read_0(READ_INDEX_1,IV0,IV1,IV2,READ_VALUE_1),
         read_0(READ_INDEX_2,IV0,IV1,IV2,READ_VALUE_2)
,
         writeMemory(READ_VALUE_2,1,READ_VALUE_1),
         p3_0_5(IV0,IV1,IV2,NV0,NV1,NV2,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   9: return[177](1)
p3_0_5(IV0,IV1,IV2,NV0,NV1,NV2,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {IV0 = NV0,IHS = OHS,IV1 = NV1,IHS = OHS,IV2 = NV2,IHS = OHS}.
%READ AND WRITE PREDICATES OF:<init>()V
read_0(SP,IV0,IV1,IV2,IV0) :- {SP = 0}.
read_0(SP,IV0,IV1,IV2,IV1) :- {SP = 1}.
read_0(SP,IV0,IV1,IV2,IV2) :- {SP = 2}.
write_0(SP,IV0,IV1,IV2,W0,W1,W2,VAL) :- {SP = 0,W0=VAL,W1=IV1,W2=IV2}.
write_0(SP,IV0,IV1,IV2,W0,W1,W2,VAL) :- {SP = 1,W0=IV0,W1=VAL,W2=IV2}.
write_0(SP,IV0,IV1,IV2,W0,W1,W2,VAL) :- {SP = 2,W0=IV0,W1=IV1,W2=VAL}.
%END OF METHOD:<init>()V
%METHOD:m()V
%   0: aload_0[42](1)
p3_1_0(IV0,IV1,IV2,IV3,NV0,NV1,NV2,NV3,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,SP_INDEX = 0,IV1 = 0,IV2 = 0,IV3 = 0,IM = 0,OM = 0,R = 0,SP_INDEX = 0,IV1 = 0,IV2 = 0,IV3 = 0,IM = 0,OM = 0,R = 0},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,OV0,OV1,OV2,OV3,WRITE_VALUE_1),
         p3_1_1(OV0,OV1,OV2,OV3,NV0,NV1,NV2,NV3,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   1: dup[89](1)
p3_1_1(IV0,IV1,IV2,IV3,NV0,NV1,NV2,NV3,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_INDEX_1 = SP_INDEX  + 1,WRITE_VALUE_1 = READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,OV0,OV1,OV2,OV3,WRITE_VALUE_1),
         p3_1_2(OV0,OV1,OV2,OV3,NV0,NV1,NV2,NV3,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   2: getfield[180](3) 2
p3_1_2(IV0,IV1,IV2,IV3,NV0,NV1,NV2,NV3,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = FIELD_VALUE,SP_INDEX_NEW = SP_INDEX},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,OV0,OV1,OV2,OV3,WRITE_VALUE_1),
         readMemory(READ_VALUE_1,1,FIELD_VALUE),
         p3_1_3(OV0,OV1,OV2,OV3,NV0,NV1,NV2,NV3,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   5: iconst_1[4](1)
p3_1_3(IV0,IV1,IV2,IV3,NV0,NV1,NV2,NV3,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = 1,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,OV0,OV1,OV2,OV3,WRITE_VALUE_1),
         p3_1_4(OV0,OV1,OV2,OV3,NV0,NV1,NV2,NV3,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   6: iadd[96](1)
p3_1_4(IV0,IV1,IV2,IV3,NV0,NV1,NV2,NV3,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,WRITE_VALUE_1 = READ_VALUE_2 +READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,READ_VALUE_2),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,OV0,OV1,OV2,OV3,WRITE_VALUE_1),
         p3_1_5(OV0,OV1,OV2,OV3,NV0,NV1,NV2,NV3,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   7: putfield[181](3) 2
p3_1_5(IV0,IV1,IV2,IV3,NV0,NV1,NV2,NV3,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_2 = SP_INDEX  - 1,READ_INDEX_1 = SP_INDEX,SP_INDEX_NEW = SP_INDEX - 2},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,READ_VALUE_1),
         read_1(READ_INDEX_2,IV0,IV1,IV2,IV3,READ_VALUE_2)
,
         writeMemory(READ_VALUE_2,1,READ_VALUE_1),
         p3_1_6(IV0,IV1,IV2,IV3,NV0,NV1,NV2,NV3,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  10: return[177](1)
p3_1_6(IV0,IV1,IV2,IV3,NV0,NV1,NV2,NV3,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {IV0 = NV0,IHS = OHS,IV1 = NV1,IHS = OHS,IV2 = NV2,IHS = OHS,IV3 = NV3,IHS = OHS}.
%READ AND WRITE PREDICATES OF:m()V
read_1(SP,IV0,IV1,IV2,IV3,IV0) :- {SP = 0}.
read_1(SP,IV0,IV1,IV2,IV3,IV1) :- {SP = 1}.
read_1(SP,IV0,IV1,IV2,IV3,IV2) :- {SP = 2}.
read_1(SP,IV0,IV1,IV2,IV3,IV3) :- {SP = 3}.
write_1(SP,IV0,IV1,IV2,IV3,W0,W1,W2,W3,VAL) :- {SP = 0,W0=VAL,W1=IV1,W2=IV2,W3=IV3}.
write_1(SP,IV0,IV1,IV2,IV3,W0,W1,W2,W3,VAL) :- {SP = 1,W0=IV0,W1=VAL,W2=IV2,W3=IV3}.
write_1(SP,IV0,IV1,IV2,IV3,W0,W1,W2,W3,VAL) :- {SP = 2,W0=IV0,W1=IV1,W2=VAL,W3=IV3}.
write_1(SP,IV0,IV1,IV2,IV3,W0,W1,W2,W3,VAL) :- {SP = 3,W0=IV0,W1=IV1,W2=IV2,W3=VAL}.
%END OF METHOD:m()V
%METHOD:mm()I
%   0: aload_0[42](1)
p3_2_0(IV0,IV1,IV2,NV0,NV1,NV2,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,SP_INDEX = 0,IV1 = 0,IV2 = 0,IM = 0,OM = 0,SP_INDEX = 0,IV1 = 0,IV2 = 0,IM = 0,OM = 0},
         read_2(READ_INDEX_1,IV0,IV1,IV2,READ_VALUE_1),
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,OV0,OV1,OV2,WRITE_VALUE_1),
         p3_2_1(OV0,OV1,OV2,NV0,NV1,NV2,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   1: getfield[180](3) 2
p3_2_1(IV0,IV1,IV2,NV0,NV1,NV2,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = FIELD_VALUE,SP_INDEX_NEW = SP_INDEX},
         read_2(READ_INDEX_1,IV0,IV1,IV2,READ_VALUE_1),
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,OV0,OV1,OV2,WRITE_VALUE_1),
         readMemory(READ_VALUE_1,1,FIELD_VALUE),
         p3_2_2(OV0,OV1,OV2,NV0,NV1,NV2,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   4: iconst_2[5](1)
p3_2_2(IV0,IV1,IV2,NV0,NV1,NV2,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = 2,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,OV0,OV1,OV2,WRITE_VALUE_1),
         p3_2_3(OV0,OV1,OV2,NV0,NV1,NV2,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   5: iadd[96](1)
p3_2_3(IV0,IV1,IV2,NV0,NV1,NV2,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,READ_INDEX_2 = SP_INDEX  - 1,WRITE_VALUE_1 = READ_VALUE_2 +READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  - 1,WRITE_INDEX_1 = SP_INDEX  - 1},
         read_2(READ_INDEX_1,IV0,IV1,IV2,READ_VALUE_1),
         read_2(READ_INDEX_2,IV0,IV1,IV2,READ_VALUE_2),
         write_2(WRITE_INDEX_1,IV0,IV1,IV2,OV0,OV1,OV2,WRITE_VALUE_1),
         p3_2_4(OV0,OV1,OV2,NV0,NV1,NV2,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   6: ireturn[172](1)
p3_2_4(IV0,IV1,IV2,NV0,NV1,NV2,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {IV0 = NV0,IHS = OHS,IV1 = NV1,IHS = OHS,IV2 = NV2,IHS = OHS,READ_INDEX_1 = SP_INDEX,R = READ_VALUE_1},
         read_2(READ_INDEX_1,IV0,IV1,IV2,READ_VALUE_1).
%READ AND WRITE PREDICATES OF:mm()I
read_2(SP,IV0,IV1,IV2,IV0) :- {SP = 0}.
read_2(SP,IV0,IV1,IV2,IV1) :- {SP = 1}.
read_2(SP,IV0,IV1,IV2,IV2) :- {SP = 2}.
write_2(SP,IV0,IV1,IV2,W0,W1,W2,VAL) :- {SP = 0,W0=VAL,W1=IV1,W2=IV2}.
write_2(SP,IV0,IV1,IV2,W0,W1,W2,VAL) :- {SP = 1,W0=IV0,W1=VAL,W2=IV2}.
write_2(SP,IV0,IV1,IV2,W0,W1,W2,VAL) :- {SP = 2,W0=IV0,W1=IV1,W2=VAL}.
%END OF METHOD:mm()I



