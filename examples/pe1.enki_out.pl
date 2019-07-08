#!/usr/bin/env swipl

:- use_module(library(clpfd)).

:- style_check(-singleton).
:- style_check(-no_effect).
:- style_check(-var_branches).
:- style_check(-discontiguous).
:- style_check(-charset).


map_built_in(F,empty(), empty()).
map_built_in(F,cons(H,T),cons(NewH,NewT)) :-
    call(F, H, NewH),
    map_built_in(F, T, NewT).



:- initialization(main, main).

main(Argv) :-
    answer_less_than(999,Temp124),
    as_text(Temp124,Temp123),
    display(Temp123).
% EnkiString
display(X) :-
    writeln(X).

% FuncType (Any "T3") EnkiString
as_text(X,Temp1) :-
    term_to_atom(X,Temp1).

% FuncType (FuncType (Any "T9") (Any "T10")) (FuncType (TypeName [Named "list",Any "T9"]) (TypeName [Named "list",Any "T10"]))
map_over(F,Xs,Temp2) :-
    map_built_in(F,Xs,Temp2).

% FuncType (Any "T13") (Any "T13")
the(X,X).

% FuncType (Any "T15") (Any "T15")
id(X,X).

% EnkiInt
odd(X) :-
    Temp3 #= (2 * K),
    Temp4 #= (Temp3 + 1),
    X = Temp4.

% EnkiInt
even(X) :-
    Temp5 #= (2 * K),
    X = Temp5.

% FuncType EnkiInt EnkiInt
square_root(X,Root) :-
    Temp6 #= (Root ^ 2),
    Temp6 = X.

% RuleType EnkiInt EnkiInt
divides(A,B) :-
    Temp7 #= (A * N),
    B = Temp7.

% FuncType (Any "T36") (FuncType (TypeName [Named "list",Any "T36"]) (TypeName [Named "list",Any "T36"]))
prepend_to(Head,Tail,cons(Head,Tail)).

% FuncType (TypeName [Named "list",Any "T53"]) EnkiInt
length_of(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T)
            ->
            length_of(T,Temp9),
            Temp10 #= (1 + Temp9),
            AUTOGENERATEDFUNCTIONRESULT = Temp10
        ;
            AUTOGENERATEDFUNCTIONRESULT = 0
    ).

% FuncType (Any "T66") (FuncType (TypeName [Named "list",Any "T66"]) (TypeName [Named "list",Any "T66"]))
construct(Head,Full,Tail) :-
    Full = cons(Head,Tail).

% FuncType (TypeName [Named "list",Any "T93"]) (FuncType (TypeName [Named "list",Any "T85"]) (TypeName [Named "list",Any "T85"]))
concat_with(A,B,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            A = cons(H,T)
            ->
            concat_with(T,B,Temp11),
            prepend_to(H,Temp11,AUTOGENERATEDFUNCTIONRESULT),
            AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
        ;
            AUTOGENERATEDFUNCTIONRESULT = B
    ).

% FuncType (TypeName [Named "list",TypeName [Named "list",Any "T123"]]) (TypeName [Named "list",Any "T116"])
flatten(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T)
            ->
            flatten(T,Temp12),
            concat_with(H,Temp12,AUTOGENERATEDFUNCTIONRESULT),
            AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
        ;
            AUTOGENERATEDFUNCTIONRESULT = empty()
    ).

% FuncType (TypeName [Named "list",Any "T154"]) (FuncType (TypeName [Named "list",Any "T154"]) (TypeName [Named "list",Any "T154"]))
reverseAcc(A,Acc,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            A = cons(H,T)
            ->
            reverseAcc(T,cons(H,Acc),AUTOGENERATEDFUNCTIONRESULT),
            AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
        ;
            AUTOGENERATEDFUNCTIONRESULT = Acc
    ).

% FuncType (TypeName [Named "list",Any "T163"]) (TypeName [Named "list",Any "T163"])
reverse_list(A,Temp14) :-
    reverseAcc(A,empty(),Temp14).

% FuncType (TypeName [Named "list",EnkiInt]) EnkiInt
sum_of(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T)
            ->
            sum_of(T,Temp16),
            Temp17 #= (H + Temp16),
            AUTOGENERATEDFUNCTIONRESULT = Temp17
        ;
            AUTOGENERATEDFUNCTIONRESULT = 0
    ).

% FuncType EnkiInt (FuncType (TypeName [Named "list",EnkiInt]) (TypeName [Named "list",EnkiInt]))
multiples_of_in(A,List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T),
            divides(A,H)
            ->
            multiples_of_in(A,T,Temp19),
            AUTOGENERATEDFUNCTIONRESULT = cons(H,Temp19)
        ;
        (
                List = cons(H,T)
                ->
                multiples_of_in(A,T,AUTOGENERATEDFUNCTIONRESULT),
                AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
            ;
                AUTOGENERATEDFUNCTIONRESULT = empty()
        )
    ).

% FuncType (TypeName [Named "list",Any "T270"]) EnkiString
formatHelper(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,empty())
            ->
            as_text(H,Temp21),
            atom_concat(Temp21,"]",AUTOGENERATEDFUNCTIONRESULT),
            AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
        ;
        (
                List = cons(H,T)
                ->
                as_text(H,Temp23),
                atom_concat(Temp23,",",Temp22),
                formatHelper(T,Temp24),
                atom_concat(Temp22,Temp24,AUTOGENERATEDFUNCTIONRESULT),
                AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
            ;
                AUTOGENERATEDFUNCTIONRESULT = "]"
        )
    ).

% FuncType (TypeName [Named "list",Any "T285"]) EnkiString
format_list(List,Temp25) :-
    formatHelper(List,Temp26),
    atom_concat("[",Temp26,Temp25).

% FuncType EnkiInt (FuncType EnkiInt (TypeName [Named "list",EnkiInt]))
range_to(Low,High,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            Low #> High
            ->
            AUTOGENERATEDFUNCTIONRESULT = empty()
        ;
            Temp28 #= (Low + 1),
            range_to(Temp28,High,Temp27),
            AUTOGENERATEDFUNCTIONRESULT = cons(Low,Temp27)
    ).

% FuncType EnkiInt (FuncType EnkiInt (TypeName [Named "list",EnkiInt]))
range_from_to(Low,High,Temp29) :-
    range_to(Low,High,Temp29).

% FuncType EnkiInt (FuncType EnkiInt (TypeName [Named "list",EnkiInt]))
integers_from_to(Low,High,Temp30) :-
    range_to(Low,High,Temp30).

% FuncType (TypeName [Named "list",EnkiInt]) (TypeName [Named "list",EnkiInt])
inc(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T)
            ->
            Temp31 #= (H + 1),
            inc(T,Temp32),
            AUTOGENERATEDFUNCTIONRESULT = cons(Temp31,Temp32)
        ;
            AUTOGENERATEDFUNCTIONRESULT = empty()
    ).

% FuncType (TypeName [Named "list",Any "T392"]) (FuncType (TypeName [Named "list",Any "T393"]) (TypeName [Named "list",TypeName [Named "pair",Any "T376",Any "T377"]]))
zip_and(A,B,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            A = cons(HA,TA),
            B = cons(HB,TB)
            ->
            zip_and(TA,TB,Temp34),
            AUTOGENERATEDFUNCTIONRESULT = cons(pair_and(HA,HB),Temp34)
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
                maximum_of(T,Temp36),
                max_of_and(H,Temp36,AUTOGENERATEDFUNCTIONRESULT),
                AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
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
                minimum_of(T,Temp38),
                min_of_and(H,Temp38,AUTOGENERATEDFUNCTIONRESULT),
                AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
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
            Temp40 #= (X + 1),
            find_factor_of_starting_with(N,Temp40,AUTOGENERATEDFUNCTIONRESULT),
            AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
    ).

% FuncType EnkiInt (TypeName [Named "list",EnkiInt])
factors_of(N,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            N = 1
            ->
            AUTOGENERATEDFUNCTIONRESULT = empty()
        ;
            find_factor_of_starting_with(N,2,Factor),
            Factor = Factor,
            Temp42 #= (N div Factor),
            factors_of(Temp42,Temp41),
            AUTOGENERATEDFUNCTIONRESULT = cons(Factor,Temp41)
    ).

% FuncType EnkiInt (TypeName [Named "list",EnkiInt])
digits_of(N,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            N #< 10
            ->
            AUTOGENERATEDFUNCTIONRESULT = cons(N,empty())
        ;
            Temp44 #= (10 * Rest),
            Temp45 #= (Temp44 + Digit),
            N = Temp45,
            Digit #>= 0,
            Digit #< 10,
            digits_of(Rest,Temp46),
            AUTOGENERATEDFUNCTIONRESULT = cons(Digit,Temp46)
    ).

% TypeName [Named "list",Any "T579"]
palindrome(List) :-
    reverse_list(List,List),
    List = List.

% EnkiInt
palindromic_number(N) :-
    digits_of(N,Temp48),
    palindrome(Temp48).

% FuncType (Any "T614") (FuncType (TypeName [Named "list",Any "T615"]) (TypeName [Named "list",TypeName [Named "pair",Any "T598",Any "T599"]]))
pair_with_each(X,List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T)
            ->
            pair_with_each(X,T,Temp50),
            AUTOGENERATEDFUNCTIONRESULT = cons(pair_and(X,H),Temp50)
        ;
            AUTOGENERATEDFUNCTIONRESULT = empty()
    ).

% FuncType (TypeName [Named "list",Any "T661"]) (FuncType (TypeName [Named "list",Any "T662"]) (TypeName [Named "list",Any "T639"]))
cartesian_product_of_and(A,B,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            A = cons(H,T)
            ->
            pair_with_each(H,B,Temp51),
            cartesian_product_of_and(T,B,Temp52),
            concat_with(Temp51,Temp52,AUTOGENERATEDFUNCTIONRESULT),
            AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
        ;
            AUTOGENERATEDFUNCTIONRESULT = empty()
    ).

% FuncType (TypeName [Named "list",Any "T674"]) (FuncType (TypeName [Named "list",Any "T675"]) (TypeName [Named "list",Any "T676"]))
pairs_of_and(A,B,Temp53) :-
    cartesian_product_of_and(A,B,Temp53).

% FuncType EnkiInt (FuncType (TypeName [Named "list",Any "T703"]) (TypeName [Named "list",Any "T694"]))
take_from(N,List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            N #> 0,
            List = cons(H,T)
            ->
            Temp55 #= (N - 1),
            take_from(Temp55,T,Temp54),
            AUTOGENERATEDFUNCTIONRESULT = cons(H,Temp54)
        ;
            AUTOGENERATEDFUNCTIONRESULT = empty()
    ).

% FuncType EnkiInt (FuncType (TypeName [Named "list",Any "T729"]) (TypeName [Named "list",Any "T729"]))
drop_from(N,List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            N #> 0,
            List = cons(H,T)
            ->
            Temp56 #= (N - 1),
            drop_from(Temp56,T,AUTOGENERATEDFUNCTIONRESULT),
            AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
        ;
            AUTOGENERATEDFUNCTIONRESULT = List
    ).

% FuncType (TypeName [Named "list",EnkiInt]) EnkiInt
product_of(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T)
            ->
            product_of(T,Temp57),
            Temp58 #= (H * Temp57),
            AUTOGENERATEDFUNCTIONRESULT = Temp58
        ;
            AUTOGENERATEDFUNCTIONRESULT = 1
    ).

% FuncType EnkiInt (FuncType (TypeName [Named "list",Any "T779"]) (FuncType (Any "T787") (Any "T787")))
element_of_starting_with(N,List,H,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            N #=< 0
            ->
            AUTOGENERATEDFUNCTIONRESULT = H
        ;
        (
                List = cons(X,Rest)
                ->
                Temp59 #= (N - 1),
                element_of_starting_with(Temp59,Rest,X,AUTOGENERATEDFUNCTIONRESULT),
                AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
            ;
                AUTOGENERATEDFUNCTIONRESULT = H
        )
    ).

% FuncType EnkiInt (FuncType (TypeName [Named "list",Any "T834"]) (TypeName [Named "list",TypeName [Named "list",Any "T807"]]))
chunks_of_size_in(L,List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = empty()
            ->
            AUTOGENERATEDFUNCTIONRESULT = empty()
        ;
            take_from(L,List,Temp60),
            drop_from(L,List,Temp62),
            chunks_of_size_in(L,Temp62,Temp61),
            AUTOGENERATEDFUNCTIONRESULT = cons(Temp60,Temp61)
    ).

% FuncType EnkiInt (FuncType (TypeName [Named "list",Any "T841"]) (TypeName [Named "list",TypeName [Named "list",Any "T842"]]))
chunks_of_length_in(L,List,Temp63) :-
    chunks_of_size_in(L,List,Temp63).

% RuleType (TypeName [Named "list",Any "T855"]) (Any "T855")
contains(List,Element) :-
    (
            List = cons(H,T),
            H = Element
            ->
            1 = 1
        ;
        (
                List = cons(H,T)
                ->
                contains(T,Element)
            ;
                1 = 2
        )
    ).

% FuncType (Any "T889") (FuncType (TypeName [Named "list",Any "T889"]) (TypeName [Named "list",Any "T889"]))
remove_from(Element,List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T),
            H = Element
            ->
            AUTOGENERATEDFUNCTIONRESULT = T
        ;
        (
                List = cons(H,T)
                ->
                remove_from(Element,T,Temp65),
                AUTOGENERATEDFUNCTIONRESULT = cons(H,Temp65)
            ;
                1 = 2,
                AUTOGENERATEDFUNCTIONRESULT = empty()
        )
    ).

% FuncType (Any "T903") (FuncType (Any "T904") (TypeName [Named "mapping",Any "T903",Any "T904"]))
maps_to(X,Y,pipe_dash_gt_(X,Y)).

% FuncType EnkiInt (FuncType EnkiInt (TypeName [Named "ordering"]))
compare_to(A,B,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            A #> B
            ->
            AUTOGENERATEDFUNCTIONRESULT = greater()
        ;
        (
                A #< B
                ->
                AUTOGENERATEDFUNCTIONRESULT = less()
            ;
                AUTOGENERATEDFUNCTIONRESULT = equal()
        )
    ).

% FuncType (TypeName [Named "mapping",Any "T926",Any "T927"]) (Any "T926")
key_in(AUTOGENARG3,K) :-
    maps_to(K,V,AUTOGENARG3),
    AUTOGENARG3 = AUTOGENARG3.

% FuncType (TypeName [Named "mapping",Any "T937",Any "T938"]) (Any "T938")
value_in(AUTOGENARG3,V) :-
    maps_to(K,V,AUTOGENARG3),
    AUTOGENARG3 = AUTOGENARG3.

% FuncType (TypeName [Named "mapping",EnkiInt,Any "T950"]) (FuncType (TypeName [Named "mapping",EnkiInt,Any "T959"]) (TypeName [Named "ordering"]))
compare_keys_to(AUTOGENARG3,AUTOGENARG5,Temp67) :-
    AUTOGENARG3 = pipe_dash_gt_(K1,V1),
    AUTOGENARG5 = pipe_dash_gt_(K2,V2),
    compare_to(K1,K2,Temp67).

% FuncType (TypeName [Named "mapping",Any "T972",EnkiInt]) (FuncType (TypeName [Named "mapping",Any "T981",EnkiInt]) (TypeName [Named "ordering"]))
compare_values_to(AUTOGENARG3,AUTOGENARG5,Temp68) :-
    AUTOGENARG3 = pipe_dash_gt_(K1,V1),
    AUTOGENARG5 = pipe_dash_gt_(K2,V2),
    compare_to(V1,V2,Temp68).

% FuncType (Any "T1001") (FuncType (TypeName [Named "list",TypeName [Named "mapping",Any "T1001",Any "T1002"]]) (Any "T1002"))
get_key_from(Key,Map,V) :-
    contains(Map,pipe_dash_gt_(Key,V)).

% FuncType (Any "T1018") (FuncType (Any "T1019") (FuncType (TypeName [Named "list",TypeName [Named "mapping",Any "T1018",Any "T1019"]]) (TypeName [Named "list",TypeName [Named "mapping",Any "T1018",Any "T1019"]])))
insert_into(K,V,Map,cons(pipe_dash_gt_(K,V),Map)).

% FuncType (Any "T1035") (FuncType (TypeName [Named "list",TypeName [Named "mapping",Any "T1035",Any "T1036"]]) (TypeName [Named "list",TypeName [Named "mapping",Any "T1035",Any "T1036"]]))
remove_key_from(Key,Map,Temp73) :-
    remove_from(pipe_dash_gt_(Key,V),Map,Temp73).

% FuncType (Any "T1070") (FuncType (TypeName [Named "list",TypeName [Named "mapping",Any "T1070",EnkiInt]]) (TypeName [Named "list",TypeName [Named "mapping",Any "T1070",EnkiInt]]))
increment_key_in(Key,Map,Temp75) :-
    Temp78 #= (V + 1),
    remove_from(pipe_dash_gt_(Key,V),Map,Temp76),
    insert_into(Key,Temp78,Temp76,Temp75).

% FuncType (TypeName [Named "mapping",EnkiInt,Any "T1113"]) (FuncType (TypeName [Named "list",TypeName [Named "mapping",EnkiInt,Any "T1114"]]) (TypeName [Named "mapping",EnkiInt,Any "T1113"]))
max_key_at_least_in(M1,Map,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            Map = cons(M2,Assocs),
            compare_keys_to(M2,M1,Temp79),
            Temp79 = less()
            ->
            max_key_at_least_in(M2,Assocs,AUTOGENERATEDFUNCTIONRESULT),
            AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
        ;
        (
                Map = cons(P,Assocs)
                ->
                max_key_at_least_in(M1,Assocs,AUTOGENERATEDFUNCTIONRESULT),
                AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
            ;
                AUTOGENERATEDFUNCTIONRESULT = M1
        )
    ).

% FuncType (TypeName [Named "list",TypeName [Named "mapping",EnkiInt,Any "T1143"]]) (TypeName [Named "maybe",TypeName [Named "mapping",EnkiInt,Any "T1143"]])
max_key_in(Map,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            Map = cons(M1,Assocs)
            ->
            max_key_at_least_in(M1,Map,Temp81),
            AUTOGENERATEDFUNCTIONRESULT = just(Temp81)
        ;
            AUTOGENERATEDFUNCTIONRESULT = nothing()
    ).

% FuncType (TypeName [Named "mapping",EnkiInt,Any "T1188"]) (FuncType (TypeName [Named "list",TypeName [Named "mapping",EnkiInt,Any "T1189"]]) (TypeName [Named "mapping",EnkiInt,Any "T1188"]))
min_key_no_more_than_in(M1,Map,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            Map = cons(M2,Assocs),
            compare_keys_to(M2,M1,Temp82),
            Temp82 = less()
            ->
            min_key_no_more_than_in(M2,Assocs,AUTOGENERATEDFUNCTIONRESULT),
            AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
        ;
        (
                Map = cons(P,Assocs)
                ->
                min_key_no_more_than_in(M1,Assocs,AUTOGENERATEDFUNCTIONRESULT),
                AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
            ;
                AUTOGENERATEDFUNCTIONRESULT = M1
        )
    ).

% FuncType (TypeName [Named "list",TypeName [Named "mapping",EnkiInt,Any "T1218"]]) (TypeName [Named "maybe",TypeName [Named "mapping",EnkiInt,Any "T1218"]])
min_key_in(Map,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            Map = cons(M1,Assocs)
            ->
            min_key_no_more_than_in(M1,Map,Temp84),
            AUTOGENERATEDFUNCTIONRESULT = just(Temp84)
        ;
            AUTOGENERATEDFUNCTIONRESULT = nothing()
    ).

% FuncType (TypeName [Named "mapping",Any "T1263",EnkiInt]) (FuncType (TypeName [Named "list",TypeName [Named "mapping",Any "T1264",EnkiInt]]) (TypeName [Named "mapping",Any "T1263",EnkiInt]))
max_value_at_least_in(M1,Map,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            Map = cons(M2,Assocs),
            compare_values_to(M2,M1,Temp85),
            Temp85 = less()
            ->
            max_value_at_least_in(M2,Assocs,AUTOGENERATEDFUNCTIONRESULT),
            AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
        ;
        (
                Map = cons(P,Assocs)
                ->
                max_value_at_least_in(M1,Assocs,AUTOGENERATEDFUNCTIONRESULT),
                AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
            ;
                AUTOGENERATEDFUNCTIONRESULT = M1
        )
    ).

% FuncType (TypeName [Named "list",TypeName [Named "mapping",Any "T1293",EnkiInt]]) (TypeName [Named "maybe",TypeName [Named "mapping",Any "T1293",EnkiInt]])
max_value_in(Map,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            Map = cons(M1,Assocs)
            ->
            max_value_at_least_in(M1,Map,Temp87),
            AUTOGENERATEDFUNCTIONRESULT = just(Temp87)
        ;
            AUTOGENERATEDFUNCTIONRESULT = nothing()
    ).

% FuncType (TypeName [Named "mapping",Any "T1338",EnkiInt]) (FuncType (TypeName [Named "list",TypeName [Named "mapping",Any "T1339",EnkiInt]]) (TypeName [Named "mapping",Any "T1338",EnkiInt]))
min_value_no_more_than_in(M1,Map,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            Map = cons(M2,Assocs),
            compare_values_to(M2,M1,Temp88),
            Temp88 = less()
            ->
            min_value_no_more_than_in(M2,Assocs,AUTOGENERATEDFUNCTIONRESULT),
            AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
        ;
        (
                Map = cons(P,Assocs)
                ->
                min_value_no_more_than_in(M1,Assocs,AUTOGENERATEDFUNCTIONRESULT),
                AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
            ;
                AUTOGENERATEDFUNCTIONRESULT = M1
        )
    ).

% FuncType (TypeName [Named "list",TypeName [Named "mapping",Any "T1368",EnkiInt]]) (TypeName [Named "maybe",TypeName [Named "mapping",Any "T1368",EnkiInt]])
min_value_in(Map,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            Map = cons(M1,Assocs)
            ->
            min_value_no_more_than_in(M1,Map,Temp90),
            AUTOGENERATEDFUNCTIONRESULT = just(Temp90)
        ;
            AUTOGENERATEDFUNCTIONRESULT = nothing()
    ).

% FuncType (Any "T1378") (TypeName [Named "list",Any "T1378"])
singleton(X,cons(X,empty())).

% FuncType (TypeName [Named "list",Any "T1415"]) (TypeName [Named "list",Any "T1397"])
init(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,empty())
            ->
            AUTOGENERATEDFUNCTIONRESULT = empty()
        ;
        (
                List = cons(H,T)
                ->
                init(T,Temp94),
                AUTOGENERATEDFUNCTIONRESULT = cons(H,Temp94)
            ;
                AUTOGENERATEDFUNCTIONRESULT = empty()
        )
    ).

% FuncType (TypeName [Named "list",Any "T1451"]) (TypeName [Named "maybe",Any "T1451"])
last(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,empty())
            ->
            AUTOGENERATEDFUNCTIONRESULT = just(H)
        ;
        (
                List = cons(H,T)
                ->
                last(T,AUTOGENERATEDFUNCTIONRESULT),
                AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
            ;
                AUTOGENERATEDFUNCTIONRESULT = nothing()
        )
    ).

% RuleType (TypeName [Named "list",Any "T1470"]) (Any "T1470")
does_not_contain(List,Element) :-
    (
            List = cons(Element,T)
            ->
            1 = 2
        ;
        (
                List = cons(H,T),
                H \= Element
                ->
                does_not_contain(T,Element)
            ;
                1 = 1
        )
    ).

% FuncType EnkiString (TypeName [Named "pair",EnkiInt,EnkiString])
digit_from(Str,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            atom_concat("0",Rest,Str),
            Str = Str
            ->
            AUTOGENERATEDFUNCTIONRESULT = pair_and(0,Rest)
        ;
        (
                atom_concat("1",Rest,Str),
                Str = Str
                ->
                AUTOGENERATEDFUNCTIONRESULT = pair_and(1,Rest)
            ;
            (
                    atom_concat("2",Rest,Str),
                    Str = Str
                    ->
                    AUTOGENERATEDFUNCTIONRESULT = pair_and(2,Rest)
                ;
                (
                        atom_concat("3",Rest,Str),
                        Str = Str
                        ->
                        AUTOGENERATEDFUNCTIONRESULT = pair_and(3,Rest)
                    ;
                    (
                            atom_concat("4",Rest,Str),
                            Str = Str
                            ->
                            AUTOGENERATEDFUNCTIONRESULT = pair_and(4,Rest)
                        ;
                        (
                                atom_concat("5",Rest,Str),
                                Str = Str
                                ->
                                AUTOGENERATEDFUNCTIONRESULT = pair_and(5,Rest)
                            ;
                            (
                                    atom_concat("6",Rest,Str),
                                    Str = Str
                                    ->
                                    AUTOGENERATEDFUNCTIONRESULT = pair_and(6,Rest)
                                ;
                                (
                                        atom_concat("7",Rest,Str),
                                        Str = Str
                                        ->
                                        AUTOGENERATEDFUNCTIONRESULT = pair_and(7,Rest)
                                    ;
                                    (
                                            atom_concat("8",Rest,Str),
                                            Str = Str
                                            ->
                                            AUTOGENERATEDFUNCTIONRESULT = pair_and(8,Rest)
                                        ;
                                        (
                                                atom_concat("9",Rest,Str),
                                                Str = Str
                                                ->
                                                AUTOGENERATEDFUNCTIONRESULT = pair_and(9,Rest)
                                            ;
                                                AUTOGENERATEDFUNCTIONRESULT = pair_and(-1,Rest)
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    ).

% FuncType EnkiString (TypeName [Named "list",EnkiInt])
digits_from(Str,AUTOGENERATEDFUNCTIONRESULT) :-
    digit_from(Str,Temp98),
    pair_and(D,Rest) = Temp98,
    (
            D = -1
            ->
            AUTOGENERATEDFUNCTIONRESULT = empty()
        ;
            digits_from(Rest,Temp99),
            prepend_to(D,Temp99,AUTOGENERATEDFUNCTIONRESULT),
            AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
    ).

% FuncType EnkiInt (FuncType EnkiInt EnkiInt)
mod(A,B,R) :-
    Temp100 #= (Q * B),
    Temp101 #= (Temp100 + R),
    A = Temp101,
    0 #=< R,
    R #< B.

% FuncType EnkiInt (TypeName [Named "list",EnkiInt])
to_reversed_digits(X,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            X #< 10
            ->
            singleton(X,AUTOGENERATEDFUNCTIONRESULT),
            AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
        ;
            mod(X,10,Temp102),
            Temp104 #= (X div 10),
            to_reversed_digits(Temp104,Temp103),
            prepend_to(Temp102,Temp103,AUTOGENERATEDFUNCTIONRESULT),
            AUTOGENERATEDFUNCTIONRESULT = AUTOGENERATEDFUNCTIONRESULT
    ).

% FuncType EnkiInt (TypeName [Named "list",EnkiInt])
to_digits(X,Temp105) :-
    to_reversed_digits(X,Temp106),
    reverse_list(Temp106,Temp105).

% FuncType (TypeName [Named "list",EnkiInt]) EnkiInt
from_reversed_digit_list(List,AUTOGENERATEDFUNCTIONRESULT) :-
    (
            List = cons(H,T)
            ->
            from_reversed_digit_list(T,Temp107),
            Temp108 #= (10 * Temp107),
            Temp109 #= (Temp108 + H),
            AUTOGENERATEDFUNCTIONRESULT = Temp109
        ;
            AUTOGENERATEDFUNCTIONRESULT = 0
    ).

% FuncType (TypeName [Named "list",EnkiInt]) EnkiInt
from_digit_list(List,Temp110) :-
    reverse_list(List,Temp111),
    from_reversed_digit_list(Temp111,Temp110).

% FuncType EnkiString EnkiInt
int_from(Str,Temp112) :-
    digits_from(Str,Temp113),
    from_digit_list(Temp113,Temp112).

% FuncType EnkiInt EnkiInt
answer_less_than(N,Temp121) :-
    range_to(1,N,Temp114),
    multiples_of_in(3,Temp114,ThreeMult),
    ThreeMult = ThreeMult,
    range_to(1,N,Temp115),
    multiples_of_in(5,Temp115,FiveMult),
    FiveMult = FiveMult,
    range_to(1,N,Temp116),
    multiples_of_in(15,Temp116,FifteenMult),
    FifteenMult = FifteenMult,
    sum_of(ThreeMult,Temp117),
    sum_of(FiveMult,Temp118),
    Temp119 #= (Temp117 + Temp118),
    sum_of(FifteenMult,Temp120),
    Temp121 #= (Temp119 - Temp120).