distance((Xa, Ya), (Xb, Yb), Result) :-
    Xs is (Xa - Xb) ** 2,
    Ys is (Ya - Yb) ** 2,
    Result is sqrt(Xs + Ys).

line(0, _) :-
    write("\n").
line(N, Item) :-
    write(Item),
    Next is N - 1,
    line(Next, Item).

squareAux(0, _, _).
squareAux(LineNumber, LineSize, Item) :-
    line(LineSize, Item),
    Next is LineNumber - 1,
    squareAux(Next, LineSize, Item).

square(N, Item) :- squareAux(N, N, Item).

fibonacci(0, 1).
fibonacci(1, 1).
fibonacci(X, Result) :-
    T1 is X - 1,
    fibonacci(T1, Y),
    T2 is X - 2,
    fibonacci(T2, Z),
    Result is Y + Z.

element_at([], _, _) :- false.
element_at([Element | _], 1, Element).
element_at([_ | Tail], Position, Result) :-
    Next is Position - 1,
    element_at(Tail, Next, Result).

sum([], 0).
sum([Element], Element).
sum([Head | Tail], Result) :-
    sum(Tail, TailSum),
    Result is Head + TailSum.

mean(List, Result) :-
    sum(List, Sum),
    length(List, Length),
    Result is Sum / Length.

range(Element, Element, [Element]).
range(Lower, Upper, [Lower | Following]) :-
    Lower < Upper,
    Next is Lower + 1,
    range(Next, Upper, Following).
range(_, _, []).

poly_sum([], Tail, Tail).

poly_sum([(Value, Pow) | Tail], Ys, [(XYValue, Pow) | Remaining]) :-
    select((YValue, Pow), Ys, Rest),
    XYValue is Value + YValue,
    poly_sum(Tail, Rest, Remaining).

poly_sum([Head | Tail], Ys, [Head | Result]) :-
    poly_sum(Tail, Ys, Result).
