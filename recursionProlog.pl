% CS3210 - Principles of Programming Languages - Fall 2022
% Instructor: Thyago Mota
% Description: Homework 11 - Prolog Lists
% Student Name: Diptanshu Giri

sum([],0).
sum([HEAD|TAIL], Sum) :- sum(TAIL, Remaining), Sum is HEAD + Remaining.

max([],0).
leftGreater(Z,X,Y) :- X > Y, Z is X.
rightGreater(Z,X,Y) :- Y > X, Z is Y.
samegreater(Z,X,Y) :- X == Y, Z is X.
choosethegreater(Z,X,Y) :- leftGreater(Z,X,Y);rightGreater(Z,X,Y);samegreater(Z,X,Y).
max([HEAD|TAIL], Max) :- max(TAIL, Remaining), choosethegreater(Max,HEAD,Remaining).

% ?- sum([],0).
% true.
% 
% ?- sum([1, 2, 5], 8).
% true.
% 
% ?- sum([1, 2, 5], X).
% X = 8.
% 
% ?- max([1, 2, 5], 5).
% true .
% 
% ?- max([1, 2, 5], X).
% X = 5 .
