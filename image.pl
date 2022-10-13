:- use_module(pixbit).
:- use_module(pixrgb).
:- use_module(pixhex).

% Dominios
% I: image
% Pl: list
% W: int
% H: int
% C: string

% Predicados

% Constructores
% backImage(C, W, H, Pl, I).
% image(W, H, Pl, I).

% Pertenencia
% imageIsBitmap(I).
% imageIsPixmap(I).
% imageIsHexmap(I).

% Metas

% Clausulas

% Constructores

% Predicado constructor del TDA image
% Dominio: string X int X int x list X list
% Recorrido: image
backImage(C, W, H, [P1|Pr], [C, W, H, [P1|Pr]]):-
	string(C),
	integer(W),
	integer(H),
	W >= 0,
	H >= 0,
	(ispixbit(P1); ispixrgb(P1); ispixhex(P1)). %Por enunciado se asume que la lista es homogenea, por lo que solo se comprueba el primer elemento

% predicado constructor del TDA image
% Dominio: int X int x list X list
% Recorrido: image
image(W, H, Pl, I):-
	backImage("", W, H, Pl, I).
	

% Pertenencia
imageIsBitmap([_, _, _, [P1|_]|_]):-
	ispixbit(P1).

imageIsPixmap([_, _, _, [P1|_]|_]):-
	ispixrgb(P1).

imageIsHexmap([_, _, _, [P1|_]|_]):-
	ispixhex(P1).


pixFlipH(Pin, W, Pout):-
	ispixbit(Pin),
	getXb(Pin, X),
	Valor is abs(X-(W-1)),
	setXb(Pin, Valor, Pout).

pixFlipH(Pin, W, Pout):-
	ispixrgb(Pin),
	getXr(Pin, X),
	Valor is abs(X-(W-1)),
	setXr(Pin, Valor, Pout).

pixFlipH(Pin, W, Pout):-
	ispixhex(Pin),
	getXh(Pin, X),
	Valor is abs(X-(W-1)),
	setXh(Pin, Valor, Pout).



imageFlipH([S, W, H, [P1in|[]]], [S, W, H, [P1out|[]]]):-
	pixFlipH(P1in, W, P1out).

imageFlipH([S, W, H, [P1in|Prin]], [S, W, H, [P1out|Prout]]):-
	pixFlipH(P1in, W, P1out),
	imageFlipH()

% Otros