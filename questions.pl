:- dynamic(has_symptom/1).

ask_all_symptoms :-
    findall(S, symptom(S), SymptomList),
    ask_symptoms(SymptomList).

ask_symptoms([]).
ask_symptoms([S|T]) :-
    format('Do you have ~w? (yes/no): ', [S]),
    read(Response),
    (Response == yes -> assertz(has_symptom(S)) ; true),
    ask_symptoms(T).