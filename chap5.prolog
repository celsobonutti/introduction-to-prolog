:- op(100, fx, neg),
   op(200, yfx, and),
   op(300, yfx, or),
   op(400, yfx, implies).

neg(X) :- call(X), !, fail.
neg(_).

and(X, Y) :- call(X), call(Y).

or(X, Y) :- call(X); call(Y).

implies(X, Y) :- call(X), !, call(Y).
implies(_,_).

permutation([], []).

permutation(List, [Element | Permutation]) :-
    select(Element, List, Rest),
    permutation(Rest, Permutation).

remove_duplicates([], []).

remove_duplicates([Head | Tail], Result) :-
    member(Head, Tail), !,
    remove_duplicates(Tail, Result).

remove_duplicates([Head | Tail], [Head | Result]) :-
    remove_duplicates(Tail, Result).

add(Element, List, Result) :-
    member(Element, List), !,
    Result = List.

add(Element, List, [Element | List]).

married(peter, lucy).
married(paul, mary).
married(bob, juliet).
married(harry, geraldine).

single(Person) :-
    \+ married(Person, _),
    \+ married(_, Person).

parent(X, Y) :-
    father(X, Y);
    mother(X, Y).

% Question 1
% a) `Result` is first bound to be a, and the cut prevents it from backtracking,
% hence it's impossible for Result to be b.
%
% b) `X` is first bound to be a, and the cut prevents it from being
% rebound, so it's impossible to be b.
%

result([_, E | L], [E | M]) :- !,
    result(L, M).

result(_, []).

% Every case is covered by the second fact.
%
% It prevents the list from backtracking, forcing it to include
% every even element of the original list.
%
% To ignore the odd elements of the original list
%

gcd(X, Y, Result) :-
    Y > X,
    gcd(X, Y, Result).

gcd(X, Y, X) :-
    Y is 0,
    !.

gcd(X, Y, Result) :-
    Z is X rem Y,
    gcd(Y, Z, Result).

occurrences(Head, [Head | Tail], N) :-
    occurrences(Head, Tail, Next),
    !,
    N is 1 + Next.

occurrences(Element, [_ | Tail], N) :-
    occurrences(Element, Tail, N).

occurrences(_, [], 0).

divisors(X, Result) :-
    divisors_helper(X, 1, Result).

divisors_helper(X, N, []) :-
    N > X, !.

divisors_helper(X, N, [N | Result]) :-
    0 is X rem N,
    Next is N + 1,
    !,
    divisors_helper(X, Next, Result).

divisors_helper(X, N, Result) :-
    Next is N + 1,
    divisors_helper(X, Next, Result).
