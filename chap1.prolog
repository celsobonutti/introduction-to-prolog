bigger(elephant, horse).
bigger(horse, donkey).
bigger(donkey, dog).
bigger(donkey, monkey).
bigger(whale, _).

is_bigger(X, Y) :- bigger(X, Y).
is_bigger(X, Y) :-
    bigger(X, Z),
    is_bigger(Z, Y).

life_is_beautiful.

is_smaller(X, Y) :- is_bigger(Y, X).
aunt(Aunt, Child) :-
    sister(Aunt, Parent),
    parent(Parent, Child).

mortal(X) :- man(X).
man(socrates).

a(B, B).

female(mary).
female(sandra).
female(juliet).
female(lisa).
male(peter).
male(paul).
male(dick).
male(bob).
male(harry).
parent(bob, lisa).
parent(bob, paul).
parent(bob, mary).
parent(juliet, lisa).
parent(juliet, paul).
parent(juliet, mary).
parent(peter, harry).
parent(lisa, harry).
parent(mary, dick).
parent(mary, sandra).

father(X, Y) :-
    male(X),
    parent(X, Y).

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

sister(X, Y) :-
    female(X),
    sibling(X, Y).

grandmother(X, Y) :-
    female(X),
    parent(X, Z),
    parent(Z, Y).

cousin(X, Y) :-
    parent(A, X),
    parent(B, Y),
    sibling(A, B).
