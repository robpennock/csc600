%
% FACTS
%

m(['Robert Simmer','Robert Duncan','Bob Simmer','Richard Simmer','Bryce Simmer','Great GrandPa','Cousin1','Cousin2','Uncle1','Uncle2']).
f(['Betty Duncan','Gertrude Simmer','Sandra Duncan','Dana Duncan','Erin Simmer','Great GrandMa','Cousin3','Cousin4','Aunt1','Aunt2']).
family(['Great GrandPa','Great GrandMa',['Robert Simmer']]).
family(['Robert Simmer','Gertrude Simmer',['Bob Simmer', 'Richard Simmer']]).
family(['Robert Duncan','Betty Duncan',['Sandra Duncan', 'Dana Duncan']]).
family(['Bob Simmer','Sandra Duncan',['Bryce Simmer', 'Erin Simmer']]).
family(['Richard Simmer','Aunt1',['Cousin1']]).
family(['Richard Simmer','Aunt2',['Cousin2']]).
family(['Uncle1','Dana Duncan',['Cousin3']]).
family(['Uncle2','Dana Duncan',['Cousin4']]).

%
% RULES
%

male(X) :- m(M), member(X,M).
female(X) :- f(F), member(X,F).

parent(P,C) :- family([P,_,X]), member(C,X).
parent(P,C) :- family([_,P,X]), member(C,X).
father(P,C) :- male(P), parent(P,C).
mother(P,C) :- female(P), parent(P,C).

siblings1(X,Y) :- father(F,X), father(F,Y), mother(M1,X), mother(M2,Y), M1\=M2, X\=Y.
siblings1(X,Y) :- father(F1,X), father(F2,Y), mother(M,X), mother(M,Y), F1\=F2, X\=Y.
brother1(X,Y) :- male(X), siblings1(X,Y).
sister1(X,Y) :- female(X), siblings1(X,Y).

siblings2(X,Y) :- father(F,X), father(F,Y), mother(M,X), mother(M,Y), X\=Y.
brother2(X,Y) :- male(X), siblings2(X,Y).
sister2(X,Y) :- female(X), siblings2(X,Y).

cousins(X,Y) :- parent(A,X), parent(B,Y), siblings1(A,B), X\=Y.
cousins(X,Y) :- parent(A,X), parent(B,Y), siblings2(A,B), X\=Y.
uncle(U,C) :- parent(P,C), brother1(U,P).
uncle(U,C) :- parent(P,C), brother2(U,P).
aunt(A,C) :- parent(P,C), sister1(A,P).
aunt(A,C) :- parent(P,C), sister2(A,P).

grandchild(GC,GP) :- parent(P,GC), parent(GP,P).
grandson(GS,GP) :- male(GS), grandchild(GS,GP).
granddaughter(GD,GP) :- female(GD), grandchild(GD,GP).
greatgrandparent(GGP,C) :- parent(P,C), grandchild(P,GGP).

ancestor(A,C) :- parent(A,C).
ancestor(A,C) :- parent(P,C), ancestor(A,P).
 

