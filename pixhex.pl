:- module(pixhex, [pixhex/5, ispixhex/1, getXh/2, getYh/2, getHex/2, getDh/2, setXh/3, setYh/3]).

% Dominios:
% X: int >=0
% Y: int >=0
% D: int >=0
% Hex: string
% P: pixhex

% Predicados

% Constructor
% pixhex(X, Y, Hex, D, P).

% Pertenencia
% ispixhex(P).

% Selectores
% getXh(P, X).
% getYh(P, Y).
% getHex(P, Hex).
% getDh(P, D).


% Metas

% Clausulas

% Constructor
pixhex(X, Y, Hex, D, [X, Y, Hex, D]):-
	integer(X),
	integer(Y),
	integer(D),
	D >= 0,
	X >= 0,
	Y >= 0,
	string(Hex).

% Pertenencia
ispixhex([X, Y, Hex, D|_]):-
	pixhex(X, Y, Hex, D, [X, Y, Hex, D]).

% Selectores
getXh([X|_], X).

getYh([_, Y|_], Y).

getHex([_, _, Hex|_], Hex).

getDh([_, _, _, D|_], D).

% Modificadores
setXh([_, Y, Hex, D], Xout, [Xout, Y, Hex, D]).
setYh([X, _, Hex, D], Yout, [X, Yout, Hex, D]).
% Otros
