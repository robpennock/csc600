%Facts


%Rules

%decreasing

decrease([]).
decrease([X,Y,T]):- X>=Y, decrease([Y,T]).
%incresing
increase([]).
increase([X,Y,TAIL]):- X=<Y, increase([Y,TAIL]).
