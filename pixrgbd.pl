:- module(pixrgbd, [pixrgbd/7, ispixrgbd/1, getXr/2, getYr/2, getR/2, getG/2, getB/2, getDr/2]).

% Dominios:
% X: int >=0
% Y: int >=0
% D: int >=0
% R: 0 <= int <= 255
% G: 0 <= int <= 255
% B: 0 <= int <= 255
% P: pixrgbd

% Predicados

% Constructor
% pixrgbd(X, Y, R, G, B, D, P).

% Pertenencia
% ispixrgbd(P).

% Selector
% getXr(P, X).
% getYr(P, Y).
% getR(P, R).
% getG(P, G).
% getB(P, B).
% getDr(P, D).


% Metas

% Clausulas

% Constructor
pixrgbd(X, Y, R, G, B, D, [X, Y, R, G, B, D]):-
	integer(X),
	integer(Y),
	integer(D),
	integer(R),
	integer(G),
	integer(B),
	D >= 0,
	X >= 0,
	Y >= 0,
	between(0, 255, R),
	between(0, 255, G),
	between(0, 255, B).

% Pertenencia
ispixrgbd([X, Y, R, G, B, D|_]):-
	pixrgbd(X, Y, R, G, B, D, [X, Y, R, G, B, D]).

% Selectores
getXr([X|_], X).

getYr([_, Y|_], Y).

getR([_, _, R|_], R).

getG([_, _, _, G|_], G).

getB([_, _, _, _, B|_], B).

getDr([_, _, _, _, _, D|_], D).

% Modificadores

% Otros