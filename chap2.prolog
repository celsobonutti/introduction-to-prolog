concat_lists([], List, List).
concat_lists([Head | Tail], List, [Head | Result]) :-
  concat_lists(Tail, List, Result).

analyse_list([]) :-
  write("This is an empty list.").
analyse_list([Head | Tail]) :-
  write("This is the head of your list: "), write(Head), write("\n"),
  write("This is the tail of your list: "), write(Tail).

membership(_, []) :- false.
membership(Member, [Member | _]) :- true.
membership(Member, [_ | Tail]) :- membership(Member, Tail).

remove_duplicates([], []).
remove_duplicates([Head | Tail], Result) :-
  member(Head, Tail),
  remove_duplicates(Tail, Result).
remove_duplicates([Head | Tail], [Head | Result]) :-
  remove_duplicates(Tail, Result).

snoc(X, [], [X]).
snoc(X, [Head | Tail], [Head | Result]) :-
  snoc(X, Tail, Result).

reverse_list([], []).
reverse_list([Head | Tail], Result) :-
  reverse_list(Tail, ReversedList),
  snoc(Head, ReversedList, Result).

last1([Head], Head).
last1([_ | Tail], Result) :-
  last1(Tail, Result).

last2(List, Result) :-
  append(_, [Result], List).

replace([], _, _, []).
replace([X | Tail], X, Y, [Y | Result]) :-
  replace(Tail, X, Y, Result).
replace([Head | Tail], X, Y, [Head | Result]) :-
  replace(Tail, X, Y, Result).

cons_all(_, [], []).
cons_all(X, [Head | Tail], [[X | Head] | Result]) :-
  cons_all(X, Tail, Result).

power([], [[]]).
power([Head | Tail], Result) :-
   power(Tail, Rest),
   cons_all(Head, Rest, X),
   append(X, Rest, Result).
