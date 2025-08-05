:- dynamic(disease_score/2).

diagnose_all :-
    findall(Disease, disease(Disease, _), Diseases),
    calculate_all_matches(Diseases),
    print_best_matches.

calculate_all_matches([]).
calculate_all_matches([D|T]) :-
    disease(D, Symptoms),
    count_matches(Symptoms, 0, MatchCount),
    length(Symptoms, Total),
    Percent is (MatchCount / Total) * 100,
    asserta(disease_score(D, Percent)),
    calculate_all_matches(T).

count_matches([], C, C).
count_matches([H|T], Acc, Count) :-
    (has_symptom(H) -> NewAcc is Acc + 1 ; NewAcc = Acc),
    count_matches(T, NewAcc, Count).

print_best_matches :-
    findall((Disease, Score), disease_score(Disease, Score), List),
    sort(2, @>=, List, Sorted),
    nl, write('--- Possible Diagnoses ---'), nl,
    print_diagnoses(Sorted).

print_diagnoses([]).
print_diagnoses([(D, S)|T]) :-
    format('~w - Match: ~1f%%~n', [D, S]),
    print_diagnoses(T).