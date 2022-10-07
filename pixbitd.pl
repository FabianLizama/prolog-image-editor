:- module(pixbitd, [pixbitd/5, ispixbitd/1, getXb/2, getYb/2, getBit/2, getDb/2]).

% Dominios:
% X: int >=0
% Y: int >=0
% D: int >=0
% Bit: (0;1)
% P: pixbitd

% Predicados

% Constructor
% pixbit-d(X, Y, Bit, D, P).

% Pertenencia
% ispixbitd(P).

% Selectores
% getXb(P, X).
% getYb(P, Y).
% getBit(P, Bit).
% getDb(P, D).


% Metas

% Clausulas

% Constructor
pixbitd(X, Y, Bit, D, [X, Y, Bit, D]):-
	integer(X),
	integer(Y),
	integer(D),
	D >= 0,
	X >= 0,
	Y >= 0,
	(Bit == 0;Bit == 1).

% Pertenencia
ispixbitd([X, Y, Bit, D|_]):-
	pixbitd(X, Y, Bit, D, [X, Y, Bit, D]).

% Selectores
getXb([X|_], X).

getYb([_, Y|_], Y).

getBit([_, _, Bit|_], Bit).

getDb([_, _, _, D|_], D).

% Modificadores

% Otros
