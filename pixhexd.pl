:- module(pixhexd, [pixhexd/5, ispixhexd/1, getXh/2, getYh/2, getHex/2, getDh/2]).

% Dominios:
% X: int >=0
% Y: int >=0
% D: int >=0
% Hex: string
% P: pixhexd

% Predicados

% Constructor
% pixhexd(X, Y, Hex, D, P).

% Pertenencia
% ispixhexd(P).

% Selectores
% getXh(P, X).
% getYh(P, Y).
% getHex(P, Hex).
% getDh(P, D).


% Metas

% Clausulas

% Constructor
pixhexd(X, Y, Hex, D, [X, Y, Hex, D]):-
	integer(X),
	integer(Y),
	integer(D),
	D >= 0,
	X >= 0,
	Y >= 0,
	string(Hex).

% Pertenencia
ispixhexd([X, Y, Hex, D|_]):-
	pixhexd(X, Y, Hex, D, [X, Y, Hex, D]).

% Selectores
getXh([X|_], X).

getYh([_, Y|_], Y).

getHex([_, _, Hex|_], Hex).

getDh([_, _, _, D|_], D).

% Modificadores

% Otros
