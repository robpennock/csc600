/*
	nocheck(X/Y,L) takes a queen X/Y and a list of queens. We succeed if and only if the
	X/Y queen holds none of the others in check. 
*/
nocheck(_,[]).
nocheck(X/Y,[X1/Y1 | Rest]) :- 
	X=\=X1, 
	Y=\=Y1, 
	abs(Y1-Y) =\= abs(X1-X), 
	nocheck(X/Y,Rest).
	
/*
	legal(L) succeeds if L is a legal placement of queens: all coordinates in range and 
	no queen in check.
*/
legal([]).
legal([X/Y | Rest]) :-
	legal(Rest),
	member(X,[1,2,3,4,5,6,7,8]),
	member(Y,[1,2,3,4,5,6,7,8]),
	nocheck(X/Y, Rest).
	
/*
	eightqueens(X) succeeds if X is a legal placement of eight queens, listed in order
	of their X coordinates
*/
eightqueens(X) :-
	X = [1/_,2/_,3/_,4/_,5/_,6/_,7/_,8/_],
	legal(X).