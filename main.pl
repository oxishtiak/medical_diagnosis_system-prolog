:- consult(symptoms).
:- consult(diseases).
:- consult(diagnosis_engine).
:- consult(questions).
:- consult(utils).

start :-
    write('--- Medical Diagnosis System ---'), nl,
    ask_all_symptoms,
    diagnose_all,
    cleanup.
