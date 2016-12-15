:-use_module(library(clpfd)).

convert(Faichier,WD):- 
	prepare(Faichier,WD,X), 
	gerome(X, Y),
	assertetes(Y),
	format('File asserted, you can now make requests to the initial constraint logic program.'). 

prepare(File,WD,Clauses):-
	working_directory(_, WD),
	init,
	clear,
	load_file(File, Clauses).

assertetes(Clauses):- 
	maplist(at, Clauses),
	!. 
	
at(cl(H, C, B)):- 
	construct_b(B, NB),
	construct_c(C, NC),
	construct_b(NC, NNC),
	assert(:-(H, (NNC, NB))).

construct_c(C, [C]). 

construct_b([[]], true).
construct_b([], true). 
construct_b([C|Cs], NC):-
	construct_b(Cs, NCs), 
	NC = (C, NCs).

gerome([], []). 
gerome([Cl|Clauses], [NCl|NewClauses]):-
	functor(Array, f, 1000), 
	retractall(var_counter(_)),
	assert(var_counter(10)),
	to_clp(Cl, NCl, Array), 
		%format('NCL : ~w ~n', NCl),
	gerome(Clauses, NewClauses). 

to_clp(cl(H, C, B), cl(NH, NC, NB), Array):-
	fresh_rename(cl(H,C,B), cl(RH, RC, RB)),
	prolog_to_clp(RC, RRC),
	ctrv(RH, NH, Array),
		%format('NH = ~w ~n', NH),
	ctrv_constr(RRC, NC, Array), 
		%format('NC = ~w ~n', NC),
	ctrv_b(RB, NB, Array),!.

ctrv_b([true], [], _).
ctrv_b([], [], _).
ctrv_b([Pred1|Others], [NewPred|Mdr], Array):- 
	ctrv(Pred1, NewPred, Array),
	ctrv_b(Others, Mdr, Array).	
	

ctrv([], [], _):-!.
ctrv(['$VAR'(I)|Vars], [B|Bs], Array):-
	!,
	arg(I, Array, B), 
	ctrv(Vars, Bs, Array). 
ctrv('$VAR'(I), B, Array):-
	!,
	arg(I, Array, B).
ctrv([A|As], [B|Bs], Array):-
	ctrv(A, B, Array), 
	ctrv(As, Bs, Array).
ctrv(C, D, Array):-
		%format('C =  ~w ~n', [C]),
	C =..[Func|Args], % Only binary opérations
	!,
	ctrv(Args, Args2, Array),
	length(Args, L),
	functor(D, Func, L), 
	D =..[Func|Args2].
ctrv(C, C, _). 

ctrv_constr('$VAR'(I), B, Array):-
	!,
	arg(I, Array, B).
ctrv_constr(C, D, Array):-
		%format('C =  ~w ~n', [C]),
	C =..[Func, Arg1, Arg2], % Only binary opérations
	!,
	ctrv_constr(Arg1, NArg1, Array),
	ctrv_constr(Arg2, NArg2, Array),
	functor(D, Func, 2), 
	arg(1, D, NArg1),
	arg(2, D, NArg2). 
ctrv_constr(C, C, _). 

prolog_to_clp([], []).
prolog_to_clp([P], NP):-
	p_to_clp(P, NP).
prolog_to_clp([P,Q], #/\(NP, NQ)) :-
	p_to_clp(P, NP),
	p_to_clp(Q, NQ).
prolog_to_clp([P|Ps], #/\(C, Cs)):- 
	 p_to_clp(P, C), 
	 prolog_to_clp(Ps, Cs).
	 
p_to_clp(=(A,B), #=(X1,X2)) :- !, p_to_clp(A, X1), p_to_clp(B, X2).
p_to_clp(\=(A,B), #\=(X1,X2)) :- !, p_to_clp(A, X1), p_to_clp(B, X2). 
p_to_clp(>(A,B), #>(X1,X2)) :- !,p_to_clp(A, X1), p_to_clp(B, X2). 
p_to_clp(<(A,B), #<(X1,X2)) :- !, p_to_clp(A, X1), p_to_clp(B, X2). 
p_to_clp(>=(A,B), #>=(X1,X2)) :- !, p_to_clp(A, X1), p_to_clp(B, X2). 
p_to_clp(=<(A,B), #=<(X1,X2)) :- !, p_to_clp(A, X1), p_to_clp(B, X2). 
p_to_clp(A, A). 

%%% TERMS

%%%
% Useful predicate
% True iff Call and Head actually unify
%%%
unify(Call, Head):-
	Call=..[Pred|Args],
	Head=..[Pred|Args2],
	length(Args, Arity),
	length(Args2, Arity).

replace('$VAR'(N1),Ren,T0):-
  member(('$VAR'(N1),T0),Ren), 
  !.
replace(Term1,Ren,Term0):-
  Term1 =..[F|Args],
  replace_list(Args,Ren,NArgs),
  Term0 =..[F|NArgs].

replace_list([],_,[]).
replace_list([T|Ts],Ren,[T0|Ts0]):-
  replace(T,Ren,T0),
  replace_list(Ts,Ren,Ts0).

get_vars(Term,VarList):-
  vars(Term,VL),
  sort(VL,VarList). % dups are removed

vars(Term,[Term]):-Term='$VAR'(_),!.
vars(Term,VarList):-
  Term=..[_|Args],
  varss(Args,VarList).
varss([],[]).
varss([T|Ts],VL):-
  vars(T,VL1),
  varss(Ts,VL2),
  append(VL1,VL2,VL).

get_var_renaming(VarList,NewVarList):-
  (var_counter(_) -> true ; assert(var_counter(100))),
  retract(var_counter(N)),
  construct_renaming(VarList,N,NewVarList,NN),
  assert(var_counter(NN)).

construct_renaming([],N,[],N).
construct_renaming([V|Vs],N,[(V,NV)|NVs],NN):-
  NV='$VAR'(N),
  N1 is N + 1,
  construct_renaming(Vs,N1,NVs,NN).

fresh_rename(Term1,Term0):-
  get_vars(Term1,VList1),
  get_var_renaming(VList1,Ren),
  replace(Term1,Ren,Term0).
  
% Utilisé pour garder la substitution
fresh_rename(Term1,Term0, Ren):-
  get_vars(Term1,VList1),
  get_var_renaming(VList1,Ren),
  replace(Term1,Ren,Term0).
  
% Renomme toutes les t_clauses
final_rename_all(Level):-
  retract(t_clause(Level,H,C,B,CNum)),
  construct_final_renaming(cl(H,C,B),Ren),
  replace(cl(H,C,B),Ren,cl(NH,NC,NB)),
  assert(t_clause(Level,NH,NC,NB,CNum)),
  fail.
final_rename_all(_).
  
construct_final_renaming(cl(H,C,B),Ren):-
  vars(cl(H,C,B),VarList),
  construct_fr(VarList,0,[],Ren).

construct_fr([],_,Ren,Ren).
construct_fr([V|Vs],N,Ren1,Ren0):-
  ( member((V,_),Ren1)
  ->
  construct_fr(Vs,N,Ren1,Ren0)
  ;
  N1 is N+1,
  construct_fr(Vs,N1,[(V,'$VAR'(N))|Ren1],Ren0)).

init:-
  retractall(var_counter(_)),
  assert(var_counter(10)). % Do not touch
	
	
	
%%% INPUT
% Charge le fichier F et retient toutes ses clauses 
load_file(F, Clauses) :-
	see(F),
	remember_all(Clauses),
	seen,
    build_call_graph.
	
clear :-
	retractall(my_clause(_,_,_)),
    clear_call_graph.

remember_all(Clauses) :-
	read(C),
	(
	    C == end_of_file -> Clauses = []
	;
	    remember_clause(C, Cl),
	    Clauses = [Cl | Rest], 
	    remember_all(Rest)
	).

remember_clause((A :- B), Cl) :-
	!,
    tuple2list(B,BL),
    parse_body(BL,CL,AL),
    numbervars(my_clause(A,CL,AL),0,_),
	Cl = cl(A,CL,AL).

remember_clause(A) :-
    numbervars(A,0,_),
	assert(my_clause(A,[],[])).

parse_body([{}|Bs],[],Bs):- !.
parse_body([{C}|Bs],CL,Bs):-tuple2list(C,CL).

tuple2list((A,As),[A|LAs]) :-
	!,
	tuple2list(As,LAs).
tuple2list(A,[A]).

%%%

clear_call_graph:-
  retractall(call_graph(_,_,_,_)).

build_call_graph:-
  clear_call_graph,
  my_clause(H,_,B),
  functor(H,Name,Arity),
  member(Call,B),
  functor(Call,CName,CArity),
  assert(call_graph(Name,Arity,CName,CArity)),
  fail.
build_call_graph.


path_from(P/A, Path):- extend_path([P/A],Path1), reverse(Path1,Path).

path_from_to(P/A,Q/B):- path_from(P/A,Path), reverse(Path,[Q/B|_]).

extend_path([P/A|Rs],[Q/B,P/A|Rs]):-
  call_graph(P,A,Q,B),
  member(Q/B,[P/A|Rs]).
extend_path([P/A|Rs],Path):-
  call_graph(P,A,Q,B),
  not(member(Q/B,[P/A|Rs])),
  extend_path([Q/B,P/A|Rs],Path).


%%%
