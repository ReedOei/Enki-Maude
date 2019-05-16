#!/usr/bin/env swipl

:- use_module(library(clpfd)).

:- style_check(-singleton).
:- style_check(-no_effect).
:- style_check(-var_branches).
:- style_check(-discontiguous).
:- style_check(-charset).

:- initialization(main, main).

main(Argv) :-
    answer_up_to(100,Temp73),
    the(Temp73,Temp74),
    as_text(Temp74,Temp75),
    display(Temp75).
% EnkiString
display(X) :-
    writeln(X).

% FuncType EnkiInt EnkiString
as_text(X,Temp0) :-
    term_to_atom(X,Temp0).

% FuncType (Any "T5") (Any "T5")
the(X,X).

% FuncType (Any "T7") (Any "T7")
id(X,X).

% EnkiInt
odd(X) :-
    Temp1 #= (2 * K),
    Temp2 #= (Temp1 + 1),
    X = Temp2.

% EnkiInt
even(X) :-
    Temp3 #= (2 * K),
    X = Temp3.

% FuncType EnkiInt EnkiInt
square_root(X,Root) :-
    Temp4 #= (Root ^ 2),
    Temp4 = X.

% RuleType EnkiInt EnkiInt
divides(A,B) :-
    Temp5 #= (A * N),
    B = Temp5.

% FuncType (Any "T28") (FuncType (TypeName [Named "list",Any "T28"]) (TypeName [Named "list",Any "T28"]))
prepend_to(Head,Tail,cons(Head,Tail)).

% FuncType (TypeName [Named "list",Any "T45"]) EnkiInt
length_of(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T)
            ->
            length_of(T,Temp6),
            Temp7 #= (1 + Temp6),
            AUTOGENERATEDFUNCTIONRESULT = Temp7
        ;
            AUTOGENERATEDFUNCTIONRESULT = 0
    ).

% FuncType (Any "T58") (FuncType (TypeName [Named "list",Any "T58"]) (TypeName [Named "list",Any "T58"]))
construct(Head,Full,Tail) :-
    Full = cons(Head,Tail).

% FuncType (TypeName [Named "list",Any "T85"]) (FuncType (TypeName [Named "list",Any "T85"]) (TypeName [Named "list",Any "T85"]))
concat_with(A,B,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            A = cons(H,T)
            ->
            concat_with(T,B,Temp8),
            prepend_to(H,Temp8,Temp9),
            AUTOGENERATEDFUNCTIONRESULT = Temp9
        ;
            AUTOGENERATEDFUNCTIONRESULT = B
    ).

% FuncType (TypeName [Named "list",TypeName [Named "list",Any "T114"]]) (TypeName [Named "list",Any "T114"])
flatten(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T)
            ->
            flatten(T,Temp10),
            concat_with(H,Temp10,Temp11),
            AUTOGENERATEDFUNCTIONRESULT = Temp11
        ;
            AUTOGENERATEDFUNCTIONRESULT = empty()
    ).

% FuncType (TypeName [Named "list",Any "T145"]) (FuncType (TypeName [Named "list",Any "T145"]) (TypeName [Named "list",Any "T145"]))
reverseAcc(A,Acc,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            A = cons(H,T)
            ->
            reverseAcc(T,cons(H,Acc),Temp12),
            AUTOGENERATEDFUNCTIONRESULT = Temp12
        ;
            AUTOGENERATEDFUNCTIONRESULT = Acc
    ).

% FuncType (TypeName [Named "list",Any "T154"]) (TypeName [Named "list",Any "T154"])
reverse_list(A,Temp13) :-
    reverseAcc(A,empty(),Temp13).

% FuncType (TypeName [Named "list",EnkiInt]) EnkiInt
sum_of(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T)
            ->
            sum_of(T,Temp14),
            Temp15 #= (H + Temp14),
            AUTOGENERATEDFUNCTIONRESULT = Temp15
        ;
            AUTOGENERATEDFUNCTIONRESULT = 0
    ).

% FuncType EnkiInt (FuncType (TypeName [Named "list",EnkiInt]) (TypeName [Named "list",Any "T197"]))
multiples_of_in(A,List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T),
            divides(A,H)
            ->
            multiples_of_in(A,T,Temp16),
            AUTOGENERATEDFUNCTIONRESULT = cons(H,Temp16)
        ;
        (
                List = cons(H,T)
                ->
                multiples_of_in(A,T,Temp17),
                AUTOGENERATEDFUNCTIONRESULT = Temp17
            ;
                AUTOGENERATEDFUNCTIONRESULT = empty()
        )
    ).

% FuncType (TypeName [Named "list",EnkiString]) EnkiString
formatHelper(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,empty())
            ->
            atom_concat(H,"]",Temp18),
            AUTOGENERATEDFUNCTIONRESULT = Temp18
        ;
        (
                List = cons(H,T)
                ->
                atom_concat(H,",",Temp19),
                formatHelper(T,Temp20),
                atom_concat(Temp19,Temp20,Temp21),
                AUTOGENERATEDFUNCTIONRESULT = Temp21
            ;
                AUTOGENERATEDFUNCTIONRESULT = "]"
        )
    ).

% FuncType (TypeName [Named "list",EnkiString]) EnkiString
format_list(List,Temp23) :-
    formatHelper(List,Temp22),
    atom_concat("[",Temp22,Temp23).

% FuncType EnkiInt (FuncType EnkiInt (TypeName [Named "list",Any "T272"]))
range_to(Low,High,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            Low #> High
            ->
            AUTOGENERATEDFUNCTIONRESULT = empty()
        ;
            Temp24 #= (Low + 1),
            range_to(Temp24,High,Temp25),
            AUTOGENERATEDFUNCTIONRESULT = cons(Low,Temp25)
    ).

% FuncType EnkiInt (FuncType EnkiInt (TypeName [Named "list",Any "T293"]))
range_from_to(Low,High,Temp26) :-
    range_to(Low,High,Temp26).

% FuncType EnkiInt (FuncType EnkiInt (TypeName [Named "list",Any "T299"]))
integers_from_to(Low,High,Temp27) :-
    range_to(Low,High,Temp27).

% FuncType (TypeName [Named "list",EnkiInt]) (TypeName [Named "list",Any "T315"])
inc(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T)
            ->
            Temp28 #= (H + 1),
            inc(T,Temp29),
            AUTOGENERATEDFUNCTIONRESULT = cons(Temp28,Temp29)
        ;
            AUTOGENERATEDFUNCTIONRESULT = empty()
    ).

% FuncType (TypeName [Named "list",Any "T371"]) (FuncType (TypeName [Named "list",Any "T372"]) (TypeName [Named "list",Any "T353"]))
zip_and(A,B,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            A = cons(HA,TA),
            B = cons(HB,TB)
            ->
            zip_and(TA,TB,Temp30),
            AUTOGENERATEDFUNCTIONRESULT = cons(pair_and(HA,HB),Temp30)
        ;
            AUTOGENERATEDFUNCTIONRESULT = empty()
    ).

% FuncType EnkiInt (FuncType EnkiInt EnkiInt)
max_of_and(A,B,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            A #> B
            ->
            AUTOGENERATEDFUNCTIONRESULT = A
        ;
            AUTOGENERATEDFUNCTIONRESULT = B
    ).

% FuncType EnkiInt (FuncType EnkiInt EnkiInt)
min_of_and(A,B,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            A #> B
            ->
            AUTOGENERATEDFUNCTIONRESULT = A
        ;
            AUTOGENERATEDFUNCTIONRESULT = B
    ).

% FuncType (TypeName [Named "list",EnkiInt]) EnkiInt
maximum_of(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,empty())
            ->
            AUTOGENERATEDFUNCTIONRESULT = H
        ;
        (
                List = cons(H,T)
                ->
                maximum_of(T,Temp31),
                max_of_and(H,Temp31,Temp32),
                AUTOGENERATEDFUNCTIONRESULT = Temp32
            ;
                AUTOGENERATEDFUNCTIONRESULT = 0
        )
    ).

% FuncType (TypeName [Named "list",EnkiInt]) EnkiInt
minimum_of(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,empty())
            ->
            AUTOGENERATEDFUNCTIONRESULT = H
        ;
        (
                List = cons(H,T)
                ->
                minimum_of(T,Temp33),
                min_of_and(H,Temp33,Temp34),
                AUTOGENERATEDFUNCTIONRESULT = Temp34
            ;
                AUTOGENERATEDFUNCTIONRESULT = 0
        )
    ).

% FuncType EnkiInt (FuncType EnkiInt EnkiInt)
find_factor_of_starting_with(N,X,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            divides(X,N)
            ->
            AUTOGENERATEDFUNCTIONRESULT = X
        ;
            Temp35 #= (X + 1),
            find_factor_of_starting_with(N,Temp35,Temp36),
            AUTOGENERATEDFUNCTIONRESULT = Temp36
    ).

% FuncType EnkiInt (TypeName [Named "list",Any "T500"])
factors_of(N,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            N = 1
            ->
            AUTOGENERATEDFUNCTIONRESULT = empty()
        ;
            find_factor_of_starting_with(N,2,Temp37),
            Factor = Temp37,
            Temp38 #= (N div Factor),
            factors_of(Temp38,Temp39),
            AUTOGENERATEDFUNCTIONRESULT = cons(Factor,Temp39)
    ).

% FuncType EnkiInt (TypeName [Named "list",Any "T530"])
digits_of(N,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            N #< 10
            ->
            AUTOGENERATEDFUNCTIONRESULT = cons(N,empty())
        ;
            Temp40 #= (10 * Rest),
            Temp41 #= (Temp40 + Digit),
            N = Temp41,
            Digit #>= 0,
            Digit #< 10,
            digits_of(Rest,Temp42),
            AUTOGENERATEDFUNCTIONRESULT = cons(Digit,Temp42)
    ).

% TypeName [Named "list",Any "T558"]
palindrome(List) :-
    reverse_list(List,Temp43),
    Temp43 = List.

% EnkiInt
palindromic_number(N) :-
    digits_of(N,Temp44),
    palindrome(Temp44).

% FuncType (Any "T595") (FuncType (TypeName [Named "list",Any "T596"]) (TypeName [Named "list",Any "T577"]))
pair_with_each(X,List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T)
            ->
            pair_with_each(X,T,Temp45),
            AUTOGENERATEDFUNCTIONRESULT = cons(pair_and(X,H),Temp45)
        ;
            AUTOGENERATEDFUNCTIONRESULT = empty()
    ).

% FuncType (TypeName [Named "list",Any "T639"]) (FuncType (TypeName [Named "list",Any "T640"]) (TypeName [Named "list",Any "T619"]))
cartesian_product_of_and(A,B,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            A = cons(H,T)
            ->
            pair_with_each(H,B,Temp46),
            cartesian_product_of_and(T,B,Temp47),
            concat_with(Temp46,Temp47,Temp48),
            AUTOGENERATEDFUNCTIONRESULT = Temp48
        ;
            AUTOGENERATEDFUNCTIONRESULT = empty()
    ).

% FuncType (TypeName [Named "list",Any "T652"]) (FuncType (TypeName [Named "list",Any "T653"]) (TypeName [Named "list",Any "T654"]))
pairs_of_and(A,B,Temp49) :-
    cartesian_product_of_and(A,B,Temp49).

% FuncType EnkiInt (FuncType (TypeName [Named "list",Any "T681"]) (TypeName [Named "list",Any "T681"]))
take_from(N,List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            N #> 0,
            List = cons(H,T)
            ->
            Temp50 #= (N - 1),
            take_from(Temp50,T,Temp51),
            AUTOGENERATEDFUNCTIONRESULT = cons(H,Temp51)
        ;
            AUTOGENERATEDFUNCTIONRESULT = empty()
    ).

% FuncType EnkiInt (FuncType (TypeName [Named "list",Any "T707"]) (TypeName [Named "list",Any "T707"]))
drop_from(N,List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            N #> 0,
            List = cons(H,T)
            ->
            Temp52 #= (N - 1),
            drop_from(Temp52,T,Temp53),
            AUTOGENERATEDFUNCTIONRESULT = Temp53
        ;
            AUTOGENERATEDFUNCTIONRESULT = List
    ).

% FuncType (TypeName [Named "list",EnkiInt]) EnkiInt
product_of(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T)
            ->
            product_of(T,Temp54),
            Temp55 #= (H * Temp54),
            AUTOGENERATEDFUNCTIONRESULT = Temp55
        ;
            AUTOGENERATEDFUNCTIONRESULT = 1
    ).

% FuncType EnkiInt (FuncType (TypeName [Named "list",Any "T757"]) (FuncType (Any "T765") (Any "T765")))
element_of_starting_with(N,List,H,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            N #=< 0
            ->
            AUTOGENERATEDFUNCTIONRESULT = H
        ;
        (
                List = cons(X,Rest)
                ->
                Temp56 #= (N - 1),
                element_of_starting_with(Temp56,Rest,X,Temp57),
                AUTOGENERATEDFUNCTIONRESULT = Temp57
            ;
                AUTOGENERATEDFUNCTIONRESULT = H
        )
    ).

% FuncType EnkiInt (FuncType (TypeName [Named "list",Any "T810"]) (TypeName [Named "list",Any "T778"]))
chunks_of_size_in(L,List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = empty()
            ->
            AUTOGENERATEDFUNCTIONRESULT = empty()
        ;
            take_from(L,List,Temp58),
            drop_from(L,List,Temp59),
            chunks_of_size_in(L,Temp59,Temp60),
            AUTOGENERATEDFUNCTIONRESULT = cons(Temp58,Temp60)
    ).

% FuncType EnkiInt (FuncType (TypeName [Named "list",Any "T817"]) (TypeName [Named "list",Any "T818"]))
chunks_of_length_in(L,List,Temp61) :-
    chunks_of_size_in(L,List,Temp61).

% FuncType (TypeName [Named "list",EnkiInt]) (TypeName [Named "list",Any "T834"])
squares_of(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T)
            ->
            Temp62 #= (H ^ 2),
            squares_of(T,Temp63),
            prepend_to(Temp62,Temp63,Temp64),
            AUTOGENERATEDFUNCTIONRESULT = Temp64
        ;
            AUTOGENERATEDFUNCTIONRESULT = empty()
    ).

% FuncType EnkiInt EnkiInt
answer_up_to(N,Temp72) :-
    integers_from_to(1,N,Temp65),
    squares_of(Temp65,Temp66),
    sum_of(Temp66,Temp67),
    the(Temp67,Temp68),
    SumSquare = Temp68,
    integers_from_to(1,N,Temp69),
    sum_of(Temp69,Temp70),
    Temp71 #= (Temp70 ^ 2),
    SquareSum = Temp71,
    Temp72 #= (SquareSum - SumSquare).