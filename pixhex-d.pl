:- module(pixhex-d, [pixhex-d/5]).

%Dominios:
% X: int >=0
% Y: int >=0
% D: int >=0
% Hex: string
% P: pixhex-d

%Predicados
%pixhex-d(X, Y, Hex, D, P).
%ispixhex-d(P).
%getXh(P, X).
%getYh(P, Y).
%getHex(P, Bit).
%getDh(P, D).


%Metas

%Clausulas

%Constructor
pixhex-d(X, Y, Hex, D, [X, Y, Hex, D]):-
	integer(X),
	integer(Y),
	integer(D),
	D >= 0,
	X >= 0,
	Y >= 0,
	string(Hex).

%Pertenencia
ispixhex-d([X, Y, Hex, D|_]):-
	pixhex-d(X, Y, Hex, D, [X, Y, Bit, D]).

%Selectores
getXh([X|_], X).

getYh([_, Y|_], Y).

getHex([_, _, Bit|_], Bit).

getDh([_, _, _, D|_], D).

%Modificadores

%Otros
