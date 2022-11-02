:- module(pixbit_21081166_LizamaGonzalez, [pixbit/5, ispixbit/1, getXb/2, getYb/2, getBit/2, getDb/2, setXb/3, setYb/3]).
%--------------------TDA pixbit--------------------
% La estructura a utilizar para este TDA es una lista de la siguiente manera:
% (X, Y, Bit, Depth)

% Donde X e Y representan las coordenadas del pixel
% Bit y Depth representan el bit y la profundidad respectivamente

%--------------------Dominios--------------------
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
% setXb(P, X, P).
% setyb(P, y, P).


%--------------------Clausulas--------------------

%--------------------Constructor--------------------
% Constructor del TDA pixbit
% Dominio: int X int X (0;1) X int X list
pixbit(X, Y, Bit, D, [X, Y, Bit, D]):-
	integer(X),
	integer(Y),
	integer(D),
	D >= 0,
	X >= 0,
	Y >= 0,
	(Bit == 0;Bit == 1).

%--------------------Pertenencia--------------------
% Comprueba si el elemento corresponde a un pixbit
% Dominio: pixbit
ispixbit([X, Y, Bit, D]):-
	pixbit(X, Y, Bit, D, [X, Y, Bit, D]).

%--------------------Selectores--------------------
% Selector de la coordenada X de un pixbit
% Dominio: pixbit X int
getXb([X|_], X).

% Selector de la coordenada Y de un pixbit
% Dominio: pixbit X int
getYb([_, Y|_], Y).

% Selector del Bit de un pixbit
% Dominio: pixbit X int
getBit([_, _, Bit|_], Bit).

% Selector de la profundidad de un pixbit
% Dominio: pixbit X int
getDb([_, _, _, D|_], D).

%-------------------Modificadores-------------------
% Modificador de la coordenada X de un pixbit
% Dominio: pixbit X int X pixbit
setXb([_, Y, Bit, D], Xout, [Xout, Y, Bit, D]).

% Modificador de la coordenada Y de un pixbit
% Dominio: pixbit X int X pixbit
setYb([X, _, Bit, D], Yout, [X, Yout, Bit, D]).
