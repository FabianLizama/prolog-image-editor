%Dominios:
% X: int >=0
% Y: int >=0
% D: int >=0
% Bit: (0;1)
% P: pixbit-d

%Predicados
%pixbit-d(X, Y, Bit, D, P).
%ispixbit-d(P).
%getX(P, X).
%getY(P, Y).
%getBit(P, Bit).
%getD(P, D).


%Metas

%Clausulas

%Constructor
pixbit-d(X, Y, Bit, D, [X, Y, Bit, D]):-
	integer(X),
	integer(Y),
	integer(D),
	D >= 0,
	X >= 0,
	Y >= 0,
	(Bit == 0;Bit == 1).

%Pertenencia
ispixbit-d([X, Y, Bit, D|_]):-
	pixbit-d(X, Y, Bit, D, [X, Y, Bit, D]).

%Selectores
getX([X|_], X).

getY([_, Y|_], Y).

getBit([_, _, Bit|_], Bit).

getD([_, _, _, D|_], D).

%Modificadores

%Otros
