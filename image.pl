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


% Auxiliares que operan sobre pixbit pixrgb y pixhex

getX(Pix, X):-
	(ispixbit(Pix), getXb(Pix, X));
	(ispixrgb(Pix), getXr(Pix, X));
	(ispixhex(Pix), getXh(Pix, X)).


getY(Pix, Y):-
	(ispixbit(Pix), getYb(Pix, Y));
	(ispixrgb(Pix), getYr(Pix, Y));
	(ispixhex(Pix), getYh(Pix, Y)).


getD(Pix, D):-
	(ispixbit(Pix), getDb(Pix, D));
	(ispixrgb(Pix), getDr(Pix, D));
	(ispixhex(Pix), getDh(Pix, D)).

setX(Pix, X):-
	(ispixbit(Pix), setXb(Pix, X));
	(ispixrgb(Pix), setXr(Pix, X));
	(ispixhex(Pix), setXh(Pix, X)).


setY(Pix, Y):-
	(ispixbit(Pix), setYb(Pix, Y));
	(ispixrgb(Pix), setYr(Pix, Y));
	(ispixhex(Pix), setYh(Pix, Y)).


setD(Pix, D):-
	(ispixbit(Pix), setDb(Pix, D));
	(ispixrgb(Pix), setDr(Pix, D));
	(ispixhex(Pix), setDh(Pix, D)).

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
	getX(Pin, X),
	setX(Pin, Valor, Pout),
	Valor is abs(X-(W-1)).


imageFlipH([C, W, H, Plin|_], Iout):-
	backImage(C, W, H, Plout, Iout),
	maplist(pixFlipH(W), Plin, Plout).

% Otros
%maplist(pixFlipH(W), Plin, Plout).
%maplist(pixFlipH, Plin, Plout).

pixFlipV(Pin, H, Pout):-
	getY(Pin, Y),
	setYb(Pin, Valor, Pout),
	Valor is abs(Y-(H-1)).