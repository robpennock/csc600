%
% Operations
%

member1(X,[X|_]).
member1(X,[_|T]) :- member1(X,T).

firstelement([X],X).
firstelement([X|_],X).

lastelement([X],X).
lastelement([_|T],X) :- lastelement(T,X).

adjacent2(X,Y,[X,Y|_]).
adjacent2(X,Y,[_|T]) :- adjacent2(X,Y,T).

adjacent3(X,Y,Z,[X,Y,Z|_]).
adjacent3(X,Y,Z,[_|T]) :- adjacent3(X,Y,Z,T).

append1([],L,L).
append1([X|T1],L2,[X|T3]) :- append1(T1,L2,T3).

delete1(X,[X|T],T).
delete1(X,[H,T],[H,T1]) :- delete1(X,T,T1).

append2([],E,[E]).
append2([X|T1],E2,[X|T3]) :- append2(T1,E2,T3).

insert1(X,L,XL) :- delete1(X,XL,L).

length1([],0).
length1([_|T],N) :- length1(T,N1), N is 1 + N1.

reverse1([],[]).
reverse1([H|T],X) :- reverse1(T,X1), append2(X1,H,X).

palindrome(L1) :- reverse1(L1,X), X=L1.

display1([]) :- nl.
display1([H|T]) :- write(H), tab(1), display1(T).

