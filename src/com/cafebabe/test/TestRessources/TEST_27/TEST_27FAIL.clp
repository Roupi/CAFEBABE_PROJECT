p_start(IV0,R) :-
         {IHS = 0},
         p4_1_0(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX,IHS,OHS,R).
p_startD(IV0,NV0,NV1,NV2,R) :-
         {IHS = 0},
         p4_1_0(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX,IHS,OHS,R).
p0_0_0(A,0,0,0,0,IHS,OHS,0) :- {OHS = IHS}.
readMemory(OBJECTREF,FIELD,VALUE) :- {}, object(OBJECTREF,FIELD,VALUE).
readMemory(_,_,0) :- {}.
writeMemory(OBJECTREF,FIELD,VALUE) :- {}, retract(object(OBJECTREF,FIELD,X)), assert(object(OBJECTREF,FIELD,VALUE)).
writeMemory(OBJECTREF,FIELD,VALUE) :- {}, assert(object(OBJECTREF,FIELD,VALUE)).
%CLASSFILE:O1_T27
%METHOD:<init>()V
%   0: aload_0[42](1)
p1_0_0(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {SP_INDEX = 0,IV1 = 0,IM=0,OM=0,R=0,READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p1_0_1(OV0,OV1,NV0,NV1,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   1: invokespecial[183](3) 1
p1_0_1(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1=READ_VALUE_1
         ,READ_INDEX_1= SP_INDEX-0
         ,SP_INDEX_NEW = SP_INDEX -1},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1)
,
         p0_0_0(WRITE_VALUE_1,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         p1_0_2(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%   4: return[177](1)
p1_0_2(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {IV0= NV0,IV1= NV1,OHS = IHS}.
%READ AND WRITE PREDICATES OF:<init>()V
read_0(SP,IV0,IV1,IV0) :- {SP = 0}.
read_0(SP,IV0,IV1,IV1) :- {SP = 1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 0,W0=VAL,W1=IV1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 1,W0=IV0,W1=VAL}.
%END OF METHOD:<init>()V
%METHOD:giveNumber()I
%   0: iconst_1[4](1)
p1_1_0(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {SP_INDEX = 0,IV1 = 0,IM=0,OM=0,WRITE_VALUE_1 = 1,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p1_1_1(OV0,OV1,NV0,NV1,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   1: ireturn[172](1)
p1_1_1(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {IV0= NV0,IV1= NV1,READ_INDEX_1 = SP_INDEX, R = READ_VALUE_1,OHS = IHS},
         read_1(READ_INDEX_1,IV0,IV1,READ_VALUE_1).
%READ AND WRITE PREDICATES OF:giveNumber()I
read_1(SP,IV0,IV1,IV0) :- {SP = 0}.
read_1(SP,IV0,IV1,IV1) :- {SP = 1}.
write_1(SP,IV0,IV1,W0,W1,VAL) :- {SP = 0,W0=VAL,W1=IV1}.
write_1(SP,IV0,IV1,W0,W1,VAL) :- {SP = 1,W0=IV0,W1=VAL}.
%END OF METHOD:giveNumber()I



%CLASSFILE:O2_T27
%METHOD:<init>()V
%   0: aload_0[42](1)
p2_0_0(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {SP_INDEX = 0,IV1 = 0,IM=0,OM=0,R=0,READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p2_0_1(OV0,OV1,NV0,NV1,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   1: invokespecial[183](3) 1
p2_0_1(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1=READ_VALUE_1,WRITE_VALUE_2=0
         ,READ_INDEX_1= SP_INDEX-0
         ,SP_INDEX_NEW = SP_INDEX -1},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1)
,
         p1_0_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         p2_0_2(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%   4: return[177](1)
p2_0_2(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {IV0= NV0,IV1= NV1,OHS = IHS}.
%READ AND WRITE PREDICATES OF:<init>()V
read_0(SP,IV0,IV1,IV0) :- {SP = 0}.
read_0(SP,IV0,IV1,IV1) :- {SP = 1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 0,W0=VAL,W1=IV1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 1,W0=IV0,W1=VAL}.
%END OF METHOD:<init>()V
%METHOD:giveNumber()I
%   0: iconst_2[5](1)
p2_1_0(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {SP_INDEX = 0,IV1 = 0,IM=0,OM=0,WRITE_VALUE_1 = 2,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p2_1_1(OV0,OV1,NV0,NV1,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   1: ireturn[172](1)
p2_1_1(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {IV0= NV0,IV1= NV1,READ_INDEX_1 = SP_INDEX, R = READ_VALUE_1,OHS = IHS},
         read_1(READ_INDEX_1,IV0,IV1,READ_VALUE_1).
%READ AND WRITE PREDICATES OF:giveNumber()I
read_1(SP,IV0,IV1,IV0) :- {SP = 0}.
read_1(SP,IV0,IV1,IV1) :- {SP = 1}.
write_1(SP,IV0,IV1,W0,W1,VAL) :- {SP = 0,W0=VAL,W1=IV1}.
write_1(SP,IV0,IV1,W0,W1,VAL) :- {SP = 1,W0=IV0,W1=VAL}.
%END OF METHOD:giveNumber()I



%CLASSFILE:O3_T27
%METHOD:<init>()V
%   0: aload_0[42](1)
p3_0_0(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {SP_INDEX = 0,IV1 = 0,IM=0,OM=0,R=0,READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p3_0_1(OV0,OV1,NV0,NV1,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   1: invokespecial[183](3) 1
p3_0_1(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1=READ_VALUE_1,WRITE_VALUE_2=0
         ,READ_INDEX_1= SP_INDEX-0
         ,SP_INDEX_NEW = SP_INDEX -1},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1)
,
         p2_0_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         p3_0_2(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%   4: return[177](1)
p3_0_2(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {IV0= NV0,IV1= NV1,OHS = IHS}.
%READ AND WRITE PREDICATES OF:<init>()V
read_0(SP,IV0,IV1,IV0) :- {SP = 0}.
read_0(SP,IV0,IV1,IV1) :- {SP = 1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 0,W0=VAL,W1=IV1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 1,W0=IV0,W1=VAL}.
%END OF METHOD:<init>()V



%CLASSFILE:TEST_27
%METHOD:<init>()V
%   0: aload_0[42](1)
p4_0_0(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {SP_INDEX = 0,IV1 = 0,IM=0,OM=0,R=0,READ_INDEX_1 = 0,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1),
         write_0(WRITE_INDEX_1,IV0,IV1,OV0,OV1,WRITE_VALUE_1),
         p4_0_1(OV0,OV1,NV0,NV1,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   1: invokespecial[183](3) 1
p4_0_1(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1=READ_VALUE_1
         ,READ_INDEX_1= SP_INDEX-0
         ,SP_INDEX_NEW = SP_INDEX -1},
         read_0(READ_INDEX_1,IV0,IV1,READ_VALUE_1)
,
         p0_0_0(WRITE_VALUE_1,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         p4_0_2(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%   4: return[177](1)
p4_0_2(IV0,IV1,NV0,NV1,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {IV0= NV0,IV1= NV1,OHS = IHS}.
%READ AND WRITE PREDICATES OF:<init>()V
read_0(SP,IV0,IV1,IV0) :- {SP = 0}.
read_0(SP,IV0,IV1,IV1) :- {SP = 1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 0,W0=VAL,W1=IV1}.
write_0(SP,IV0,IV1,W0,W1,VAL) :- {SP = 1,W0=IV0,W1=VAL}.
%END OF METHOD:<init>()V
%METHOD:main([Ljava/lang/String;)V
%   0: iconst_0[3](1)
p4_1_0(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {SP_INDEX = 2,IV0 = 0,IV1 = 0,IV2 = 0,IV3 = 0,IV4 = 0,IM=0,OM=0,R=0,WRITE_VALUE_1 = 0,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_INDEX_1 = SP_INDEX  + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,WRITE_VALUE_1),
         p4_1_1(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   1: istore_1[60](1)
p4_1_1(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 1,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,WRITE_VALUE_1),
         p4_1_2(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   2: new[187](3) 2
p4_1_2(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1,WRITE_VALUE_1 = IHS,IHS_NEW = IHS + 1},
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,WRITE_VALUE_1),
         writeMemory(IHS,0,3),
         p4_1_3(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX_NEW,IHS_NEW,OHS,R).
%   5: dup[89](1)
p4_1_3(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_INDEX_1 = SP_INDEX  + 1,WRITE_VALUE_1 = READ_VALUE_1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,WRITE_VALUE_1),
         p4_1_4(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%   6: invokespecial[183](3) 3
p4_1_4(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1=READ_VALUE_1,WRITE_VALUE_2=0
         ,READ_INDEX_1= SP_INDEX-0
         ,SP_INDEX_NEW = SP_INDEX -1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,READ_VALUE_1)
,
         p3_0_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         p4_1_5(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%   9: astore_2[77](1)
p4_1_5(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 2,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,WRITE_VALUE_1),
         p4_1_6(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  10: aload_2[44](1)
p4_1_6(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = 2,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = SP_INDEX  + 1,SP_INDEX_NEW = SP_INDEX  + 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,WRITE_VALUE_1),
         p4_1_7(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  11: invokevirtual[182](3) 4
p4_1_7(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 0,SP_INDEX_CALL = 0,ClassID = 2},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,READ_VALUE_1),
                  readMemory(READ_VALUE_1,0,ClassID),
         p2_1_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         write_1(SP_INDEX_NEW,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,R_NEW)
,
         p4_1_8(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
p4_1_7(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 0,SP_INDEX_CALL = 0,ClassID = 2},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,READ_VALUE_1),
                  readMemory(READ_VALUE_1,0,ClassID),
         p2_1_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         write_1(SP_INDEX_NEW,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,R_NEW)
,
         p4_1_8(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
p4_1_7(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {WRITE_VALUE_1 = READ_VALUE_1,WRITE_VALUE_2 = 0,READ_INDEX_1 = SP_INDEX - 0,SP_INDEX_NEW = SP_INDEX - 0,SP_INDEX_CALL = 0,ClassID = 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,READ_VALUE_1),
                  readMemory(READ_VALUE_1,0,ClassID),
         p1_1_0(WRITE_VALUE_1,WRITE_VALUE_2,_,_,IM,OM,SP_INDEX_CALL,IHS,OHS_CALL,R_NEW),
         write_1(SP_INDEX_NEW,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,R_NEW)
,
         p4_1_8(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX_NEW,OHS_CALL,OHS,R).
%  14: istore_1[60](1)
p4_1_8(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {READ_INDEX_1 = SP_INDEX,WRITE_VALUE_1 = READ_VALUE_1,WRITE_INDEX_1 = 1,SP_INDEX_NEW = SP_INDEX  - 1},
         read_1(READ_INDEX_1,IV0,IV1,IV2,IV3,IV4,READ_VALUE_1),
         write_1(WRITE_INDEX_1,IV0,IV1,IV2,IV3,IV4,OV0,OV1,OV2,OV3,OV4,WRITE_VALUE_1),
         p4_1_9(OV0,OV1,OV2,OV3,OV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX_NEW,IHS,OHS,R).
%  15: return[177](1)
p4_1_9(IV0,IV1,IV2,IV3,IV4,NV0,NV1,NV2,NV3,NV4,IM,OM,SP_INDEX,IHS,OHS,R) :-
         {IV0= NV0,IV1= NV1,IV2= NV2,IV3= NV3,IV4= NV4,OHS = IHS}.
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


