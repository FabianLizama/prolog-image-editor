:- module(pixrgb, [pixrgb/7, ispixrgb/1, getXr/2, getYr/2, getR/2, getG/2, getB/2, getDr/2, setXr/3, setYr/3]).

% Dominios:
% X: int >=0
% Y: int >=0
% D: int >=0
% R: 0 <= int <= 255
% G: 0 <= int <= 255
% B: 0 <= int <= 255
% P: pixrgb

% Predicados

% Constructor
% pixrgb(X, Y, R, G, B, D, P).

% Pertenencia
% ispixrgb(P).

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
pixrgb(X, Y, R, G, B, D, [X, Y, R, G, B, D]):-
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
ispixrgb([X, Y, R, G, B, D|_]):-
	pixrgb(X, Y, R, G, B, D, [X, Y, R, G, B, D]).

% Selectores
getXr([X|_], X).

getYr([_, Y|_], Y).

getR([_, _, R|_], R).

getG([_, _, _, G|_], G).

getB([_, _, _, _, B|_], B).

getDr([_, _, _, _, _, D|_], D).

% Modificadores
setXr([_, Y, R, G, B, D], Xout, [Xout, Y, R, G, B, D]).
setYr([X, _, R, G, B, D], Yout, [X, Yout, R, G, B, D]).
% Otros