:- module(pixbit, [pixbit/5, ispixbit/1, getXb/2, getYb/2, getBit/2, getDb/2, setXb/3, setYb/3]).

% Dominios:
% X: int >=0
% Y: int >=0
% D: int >=0
% Bit: (0;1)
% P: pixbitd

% Predicados

% Constructor
% pixbit(X, Y, Bit, D, P).

% Pertenencia
% ispixbit(P).

% Selectores
% getXb(P, X).
% getYb(P, Y).
% getBit(P, Bit).
% getDb(P, D).

% Modificadores
% setX(P, X, P).


% Metas

% Clausulas

% Constructor
pixbit(X, Y, Bit, D, [X, Y, Bit, D]):-
	integer(X),
	integer(Y),
	integer(D),
	D >= 0,
	X >= 0,
	Y >= 0,
	(Bit == 0;Bit == 1).

% Pertenencia
ispixbit([X, Y, Bit, D|_]):-
	pixbit(X, Y, Bit, D, [X, Y, Bit, D]).

% Selectores
getXb([X|_], X).

getYb([_, Y|_], Y).

getBit([_, _, Bit|_], Bit).

getDb([_, _, _, D|_], D).

% Modificadores
setXb([_, Y, Bit, D], Xout, [Xout, Y, Bit, D]).
setYb([X, _, Bit, D], Yout, [X, Yout, Bit, D]).

% Otros
