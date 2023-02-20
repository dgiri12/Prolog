% CS3210 - Principles of Programming Languages - Fall 2022
% Instructor: Thyago Mota
% Description: Homework 10 - A KB in Prolog with queries
% Student Name: Diptanshu Giri

mountain("Mt. Everest").
mountain("Aconcagua").
mountain("Mt. McKinley").
mountain("Kilimanjaro").
mountain("Mt. Elbrus").
mountain("Mt. Vinson").
mountain("Puncak Jaya").

located_in("Mt. Everest",asia).
located_in("Aconcagua",southAmerica).
located_in("Mt. McKinley",northAmerica).
located_in("Kilimanjaro",africa).
located_in("Mt. Elbrus",europe).
located_in("Mt. Vinson",antarctica).
located_in("Puncak Jaya",australia).

height_of("Mt. Everest",29029).
height_of("Aconcagua",22841).
height_of("Mt. McKinley",20312).
height_of("Kilimanjaro",19340).
height_of("Mt. Elbrus",18510).
height_of("Mt. Vinson",16050).
height_of("Puncak Jaya",16023).

certified(john).
certified(kelly).
certified(maria).
certified(derek).
not(certified(thyago)).

atLeast(X,Y) :- compare(>,X,Y);compare(=,X,Y).
condition1(X) :- located_in(X,europe);located_in(X,africa);located_in(X,asia).

climb(john,X) :- certified(john),mountain(X),located_in(X,northAmerica).
climb(kelly,X) :- mountain(X),certified(kelly),height_of(X,Y),atLeast(Y,20000).
climb(maria,X) :- mountain(X),certified(maria).
climb(derek,X) :- mountain(X),certified(derek),height_of(X,Y),compare(<,Y,19000),condition1(X).
climb(thyago,_) :- false.

% Queries that were written to answer the questions.
% Is Mt. Everest one of the highest peaks in the world? true 
% => mountain("Mt. Everest").
% 
% Is the Kilimanjaro located in Africa? true 
% => located_in("Kilimanjaro",africa).
% 
% Is Mt. Elbrus more than 18K feet? true 
% => height_of("Mt. Elbrus",_X),_X>18000.
% 
% Is Thyago a certified climber? false 
% => certified(thyago).
% 
% Is John a certified climber? true 
% => certified(john).
% 
% All certified climbers? John, Kelly, Maria, and Derek 
% => certified(john),certified(kelly),certified(maria),certified(derek).
% 
% All peaks that John would climb?  Mt. McKinley 
% => climb(john,X).
% 
% All peaks that Kelly would climb? Mt. Everest, the Aconcagua, and Mt. McKinley 
% => climb(kelly,X).
% 
% All peaks that Maria would climb? all of the 7 peaks! 
% => climb(maria,X).
% 
% All peaks that Derek would climb? Mt. Elbrus and the Puncak Jaya 
% => climb(derek,X).
% 
% All peaks that Thyago would climb? none (or false) 
% => climb(thyago,X).
