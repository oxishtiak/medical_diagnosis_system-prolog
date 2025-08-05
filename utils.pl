:- dynamic(disease_score/2).
:- dynamic(has_symptom/1).

cleanup :-
    retractall(disease_score(_, _)),
    retractall(has_symptom(_)).