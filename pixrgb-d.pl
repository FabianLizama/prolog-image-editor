%Dominios:
% X: int >=0
% Y: int >=0
:- module(pixrgb-d, [pixrgb-d/7]).

% D: int >=0
% R: 0 <= int <= 255
% G: 0 <= int <= 255
% B: 0 <= int <= 255
% P: pixrgb-d

%Predicados
%pixrgb-d(X, Y, R, G, B, D, P).
%ispixrgb-d(P).
%getXr(P, X).
%getYr(P, Y).
%getR(P, R).
%getG(P, R).
%getB(P, R).
%getDr(P, D).


%Metas

%Clausulas

%Constructor
pixrgb-d(X, Y, R, G, B, D, [X, Y, R, G, B, D]):-
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

%Pertenencia
ispixrgb-d([X, Y, R, G, B, D|_]):-
	pixrgb-d(X, Y, R, G, B, D, [X, Y, R, G, B, D]).

%Selectores
getXr([X|_], X).

getYr([_, Y|_], Y).

getR([_, _, R|_], R).

getG([_, _, _, G|_], G).

getB([_, _, _, _, B|_], B).

getDr([_, _, _, _, _, D|_], D).

%Modificadores

%Otros