concat_lists([], List, List).
concat_lists([Head | Tail], List, [Head | Result])
  :- concat_lists(Tail, List, Result).

analyse_list([Head | Tail])
  :- write("This is the head of your list: "), write(Head), write("\n"),
     write("This is the tail of your list: "), write(Tail).
analyse_list([])
  :- write("This is an empty list.").

membership(_, []) :- false.
membership(Member, [Member | _]) :- true.
membership(Member, [_ | Tail]) :- membership(Member, Tail).

snoc(X, [], [X]).
snoc(X, [ Head | Tail ], [Head | Result]) :-
    snoc(X, Tail, Result).

reverse_list([], []).
reverse_list([Head | Tail], Result) :-
    reverse_list(Tail, ReversedList),
    snoc(Head, ReversedList, Result).


remove_duplicates([], []).
remove_duplicates([ Head | Tail ], Result) :-
    member(Head, Tail),
    remove_duplicates(Tail, Result).
remove_duplicates([ Head | Tail ], [ Head | Result ]) :-
    remove_duplicates(Tail, Result).

remove_duplicates([], []).
remove_duplicates([ Head | Tail ], [ Head | Result ]) :-
    select(Head, Tail, Result).
