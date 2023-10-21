:- module(pixhex, [pixhex/5, ispixhex/1, getXh/2, getYh/2, getHex/2, getDh/2, setXh/3, setYh/3]).
%--------------------TDA pixhex--------------------
% La estructura a utilizar para este TDA es una lista de la siguiente manera:
% (X, Y, Hex, Depth)

% Donde X e Y representan las coordenadas del pixel
% Hex y Depth representan el código hexaxdecimal (sin hashtag de la forma: "ffffff" por ejemplo) y la profundidad respectivamente

%--------------------Dominios--------------------
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


%--------------------Clausulas--------------------

%--------------------Constructor--------------------
%% Constructor del TDA pixhex
% Dominio: int X int X string X int X list
pixhex(X, Y, Hex, D, [X, Y, Hex, D]):-
	integer(X),
	integer(Y),
	integer(D),
	D >= 0,
	X >= 0,
	Y >= 0,
	string(Hex).

%--------------------Pertenencia--------------------
% Comprueba si el elemento corresponde a un pixhex
% Dominio: pixhex
ispixhex([X, Y, Hex, D|_]):-
	pixhex(X, Y, Hex, D, [X, Y, Hex, D]).

%--------------------Selectores--------------------
% Selector de la coordenada X de un pixhex
% Dominio: pixhex X int
getXh([X|_], X).

% Selector de la coordenada Y de un pixhex
% Dominio: pixhex X int
getYh([_, Y|_], Y).

% Selector del código hexadecimal de un pixhex
% Dominio: pixhex X string
getHex([_, _, Hex|_], Hex).

% Selector de la profundidad de un pixhex
% Dominio: pixhex X int
getDh([_, _, _, D|_], D).

%-------------------Modificadores-------------------
% Modificador de la coordenada X de un pixhex
% Dominio: pixhex X int X pixhex
setXh([_, Y, Hex, D], Xout, [Xout, Y, Hex, D]).

% Modificador de la coordenada Y de un pixhex
% Dominio: pixhex X int X pixhex
setYh([X, _, Hex, D], Yout, [X, Yout, Hex, D]).
