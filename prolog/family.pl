%this program demonstrates the use of facts and rules via
%	familial relations
%male facts
is_male('Abraham').
is_male('Jimbo_II').
is_male('Jimbos_Bro').
is_male('Jimbo_Sr').
is_male('Randy').
is_male('Fred').
%female facts
is_female('Matriarch').
is_female('Jane').
is_female('Ranita').
is_female('Jims_Half_Sis').
is_female('GrandMami_Persephone').

%parental relation facts
is_parent_of('Jimbo_II', 'Randy').
is_parent_of('Jane', 'Randy').
is_parent_of('Jane', 'Ranita').
is_parent_of('Jimbo_II', 'Ranita').
is_parent_of('Jimbo_Sr', 'Jimbo_II').
is_parent_of('Matriarch', 'Jimbo_II').
is_parent_of('Jimbo_Sr', 'Jimbos_Bro').
is_parent_of('Matriarch', 'Jimbos_Bro').
is_parent_of('Jimbo_Sr', 'Jims_Half_Sis').
is_parent_of('Jimbos_Bro', 'Fred').
is_parent_of('Abraham', 'Jimbo_Sr').
is_parent_of('GrandMami_Persephone', 'Abraham').

%begin rules

%X is mother if X is parent of Y and X is a female
is_mother(X,Y) :- is_parent_of(X,Y), is_female(X). 
is_father(X,Y) :- is_parent_of(X,Y), is_male(X).

%sibling1 - describes a "half" brother or sister relationship
sibling1(X,Y) :- is_mother(Z,X), is_mother(Z,Y), X\=Y; is_father(Z,X), 
	is_father(Z,Y), X\=Y. 
%X is half brother if X is half sibling of Y and X is male
brother1(X,Y) :- sibling1(X,Y), is_male(X).
sister1(X,Y) :- sibling1(X,Y), is_female(X).

%describing siblings with same mother and father
sibling2(X,Y) :- is_father(Z,X), is_father(Z,Y), 
	is_mother(Q,X), is_mother(Q,Y), X\=Y. 
brother2(X,Y) :- sibling2(X,Y), is_male(X).
sister2(X,Y) :- sibling2(X,Y), is_female(X).

%X is Cousin of Y if one of their parents are siblings
cousin(X,Y) :- is_parent_of(Z,X), is_parent_of(Q,Y), sibling1(Z,Q), X\=Y.
uncle(X,Y) :- is_parent_of(Z,Y), brother1(X,Z).
aunt(X,Y) :- is_parent_of(Z,Y), sister1(X,Z).
grandparent(X,Y) :- is_parent_of(Z,Y), is_parent_of(X,Z), X\=Y, X\=Z.
grandfather(X,Y) :- is_parent_of(Z,Y), is_parent_of(X,Z), is_male(X),
	 X\=Y, X\=Z.
grandmother(X,Y) :- is_parent_of(Z,Y), is_parent_of(X,Z), is_female(X),
	 X\=Y, X\=Z.
grandchild(X,Y) :- is_parent_of(Z,X), is_parent_of(Y,Z), X\=Y, X\=Z.

greatgrandparent(X,Y) :- is_parent_of(Z,Y), grandparent(X,Z), X\=Y, X\=Z.
ancestor(X,Y) :- grandparent(Z,Y), grandparent(X,Z), X\=Y, X\=Z.
