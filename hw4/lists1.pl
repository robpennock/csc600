%facts
%rules

member1(X,[X|_]).	%if list only has head
member1(X,[_|T]):-member1(X,T).	%search tail recursively 

first(X,[X]).		%if single element
first(X,[X|_]).		%if in first element

lastelement(X,[X]).	%if single element
lastelement(X,[_|T]) :- lastelement(X,T).

twoadjacent(X,Y,[X,Y|_]).	%only 2 elements
twoadjacent(X,Y,[_|T]) :- twoadacent(X,Y,T).	%adjacent in tail with tail rec

threeadjacent(X,Y,Z,[X,Y,Z|_]).	%in first 3
threeadjacent(X,Y,Z, [_,T]):- threeadjacent(X,Y,Z,T).
