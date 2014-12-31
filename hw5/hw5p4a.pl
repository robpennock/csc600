%facts
%define List in gprolog
% List([1,2,3,4])	
%rules
sum(List, minPlusMax):-
	maxlist([X], X).	%single element in list
	maxlist([H|T], Max) :-
		maxlist(T,Tmax),	%max on tail
		Max is max(H,Tmax).	%now have max from list
	minlist([X],X).	%single element
	minlist([H|T], Min) :-
		minlist(T, Tmin),	%find min in tail
		Min is  min(H,Tmin).	%now have min from list
	minPlusMax is Min + Max.
