%This program performs various operations linking professors to their
%	classes.
%instructor facts
intructor('Jozo').
intructor('Sosnick').
intructor('Tomasevich').
intructor('Levine').

%classes that instructors teach
teaches('Jozo', '340').
teaches('Jozo', '600').
teaches('Sosnick', '640').
teaches('Sosnick', '256').
teaches('Sosnick', '412').
teaches('Tomasevich', '230').
teaches('Tomasevich', '300').
teaches('Levine', '413').

%listing the types of classes
freshman('230').
freshman('256').
sophmore('300').
sophmore('340').
junior('412').
junior('413').
senior('600').
senior('640').

%time of the day each class begins
morning('340').
morning('256').
afternoon('600').
afternoon('640').
afternoon('256').
afternoon('412').
afternoon('230').
afternoon('300').
afternoon('413').

%what days these classes are on
%classes that only fall on t or th will be
%	mapped to TTH
tth('340').
tth('412').
tth('413').
tth('640').
mwf('340').
mwf('256').
mwf('300').
mwf('412').
mwf('600').

%begin rules

%teaches freshmen if X teaches Y and Y is a fresman fact
teaches_freshman(X) :- teaches(X,Y), freshman(Y). 
teaches_sophmore(X) :- teaches(X,Y), sophmore(Y).
teaches_junior(X) :- teaches(X,Y), junior(Y).
teaches_senior(X) :- teaches(X,Y), senior(Y).

%teaches morning if X teaches Y and Y is in the morning
teaches_morning(X) :- teaches(X,Y), morning(Y).
teaches_afternoon(X) :- teaches(X,Y), afternoon(Y).
teaches_whole_day(X) :- teaches(X,Y), afternoon(Y); teaches(X,Y), morning(Y).

%works mwf if X teaches Y and Y is a mwf class
works_mwf(X) :- teaches(X,Y), mwf(Y).
works_th(X) :- teaches(X,Y), tth(Y).

%teaches 3 class if X teaches 3 sperate classes and none are the same
teaches_three_classes(X) :- teaches(X,Y), teaches(X,Z), teaches(X,Q),
	Z\=Y, Q\=Z, Y\=Q.
