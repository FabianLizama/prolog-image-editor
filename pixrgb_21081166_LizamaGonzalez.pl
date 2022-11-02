:- module(pixrgb_21081166_LizamaGonzalez, [pixrgb/7, ispixrgb/1, getXr/2, getYr/2, getR/2, getG/2, getB/2, getDr/2, setXr/3, setYr/3, getRGBD/2]).
%--------------------TDA pixrgb--------------------
% La estructura a utilizar para este TDA es una lista de la siguiente manera:
% (X, Y, R, G, B, Depth)

% Donde X e Y representan las coordenadas del pixel
% R, G, B, D y Depth representan los canales RGB (de 0 a 255 c/u) y la profundidad respectivamente

%--------------------Dominios--------------------
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

%--------------------Clausulas--------------------

%--------------------Constructor--------------------
% Constructor del TDA pixrgb
% Dominio: int X int X int X int X int X int X list
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

%--------------------Pertenencia--------------------
% Comprueba si el elemento corresponde a un pixrgb
% Dominio: pixrgb
ispixrgb([X, Y, R, G, B, D|_]):-
	pixrgb(X, Y, R, G, B, D, [X, Y, R, G, B, D]).

%--------------------Selectores--------------------
% Selector de la coordenada X de un pixrgb
% Dominio: pixrgb X int
getXr([X|_], X).

% Selector de la coordenada Y de un pixrgb
% Dominio: pixrgb X int
getYr([_, Y|_], Y).

% Selector del canal R de un pixrgb
% Dominio: pixrgb X int
getR([_, _, R|_], R).

% Selector del canal G de un pixrgb
% Dominio: pixrgb X int
getG([_, _, _, G|_], G).

% Selector del canal B de un pixrgb
% Dominio: pixrgb X int
getB([_, _, _, _, B|_], B).

% Selector de la profundidad de un pixrgb
% Dominio: pixrgb X int
getDr([_, _, _, _, _, D|_], D).

% Selector de todos los canales de un pixrgb
% Dominio: pixrgb X list
getRGBD([_, _, R, G, B, D|_], [R, G, B, D]). 

%--------------------Modificadores--------------------
% Modificador de la coordenada X de un pixrgb
% Dominio: pixrgb X int X pixrgb
setXr([_, Y, R, G, B, D], Xout, [Xout, Y, R, G, B, D]).

% Modificador de la coordenada X de un pixrgb
% Dominio: pixrgb X int X pixrgb
setYr([X, _, R, G, B, D], Yout, [X, Yout, R, G, B, D]).