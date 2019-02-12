#!/usr/bin/env swipl

:- use_module(library(clpfd)).

collatz(X,AUTOGENERATEDFUNCTIONRESULT) :-
    (
    Temp3 #= 2 * K,
    Temp2 #= Temp3 + 1,
    X = Temp2 -> 
    Temp12 #= 3 * X,
    Temp11 #= Temp12 + 1,
    AUTOGENERATEDFUNCTIONRESULT = Temp11
    );
    (
    Temp20 #= 2 * N,
    X = Temp20,
    AUTOGENERATEDFUNCTIONRESULT = N
    ).

collatz_sequence_on_takes_steps(X,N) :-
    (
    X = 1 -> 
    N = 0
    );
    (
    collatz(X,Temp8),
    Temp14 #= N - 1,
    collatz_sequence_on_takes_steps(Temp8,Temp14)
    ).


