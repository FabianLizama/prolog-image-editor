:- use_module(pixbit).
:- use_module(pixrgb).
:- use_module(pixhex).

% Dominios
% I: image
% Pl: list
% W: int
% H: int
% C: string
% X: int
% Y: int

% Predicados

% Constructores
% backImage(C, W, H, Pl, I).
% image(W, H, Pl, I).

% Pertenencia
% imageIsBitmap(I).
% imageIsPixmap(I).
% imageIsHexmap(I).


% Modificadores
% imageCrop(I, X, Y, X, Y, I).
% Metas
%asd
%asd
%asdasd
%asdasd
%asda
%asda
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

setX(Pix, X, Pout):-
	(ispixbit(Pix), setXb(Pix, X, Pout));
	(ispixrgb(Pix), setXr(Pix, X, Pout));
	(ispixhex(Pix), setXh(Pix, X, Pout)).


setY(Pix, Y, Pout):-
	(ispixbit(Pix), setYb(Pix, Y, Pout));
	(ispixrgb(Pix), setYr(Pix, Y, Pout));
	(ispixhex(Pix), setYh(Pix, Y, Pout)).


setD(Pix, D, Pout):-
	(ispixbit(Pix), setDb(Pix, D, Pout));
	(ispixrgb(Pix), setDr(Pix, D, Pout));
	(ispixhex(Pix), setDh(Pix, D, Pout)).

% Constructores

% Predicado constructor del TDA image
% Dominio: string X int X int x list X list
% Recorrido: image

backImage(C, W, H, [], [C, W, H, []]).

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
% predicado de pertenencia
% Dominio: image
% Recorrido: bool
imageIsBitmap([_, _, _, [P1|_]|_]):-
	ispixbit(P1).

% predicado de pertenencia
% Dominio: image
% Recorrido: bool
imageIsPixmap([_, _, _, [P1|_]|_]):-
	ispixrgb(P1).

% predicado de pertenencia
% Dominio: image
% Recorrido: bool
imageIsHexmap([_, _, _, [P1|_]|_]):-
	ispixhex(P1).


pixFlipH(W, Pin, Pout):-
	getX(Pin, X),
	setX(Pin, Valor, Pout),
	Valor is abs(X-(W-1)).

imageFlipH([C, W, H, []|_], [C, W, H, []]).

imageFlipH([C, W, H, [P1|Pl]|_], [C, W, H, [P1out|Plout]]):-
	pixFlipH(W, P1, P1out),
	imageFlipH([C, W, H, Pl], [C, W, H, Plout]).

pixFlipV(H, Pin, Pout):-
	getY(Pin, Y),
	setY(Pin, Valor, Pout),
	Valor is abs(Y-(H-1)).

imageFlipV([C, W, H, []|_], [C, W, H, []]).

imageFlipV([C, W, H, [P1|Pl]|_], [C, W, H, [P1out|Plout]]):-
	pixFlipV(H, P1, P1out),
	imageFlipV([C, W, H, Pl], [C, W, H, Plout]).

imageCrop([C, _, _, Plin|_], X1, Y1, X2, Y2, [C, Wout, Hout, Plout]):-
	Wout is 1+(X2-X1),
	Hout is 1+(Y2-Y1),
	include(isCropPix(X1, Y1, X2, Y2), Plin, Pixels),
	maplist(adjustCropPixel(X1, Y1), Pixels, Plout).

isCropPix(X1, Y1, X2, Y2, Pin):-
	getX(Pin, Xin),
	getY(Pin, Yin),
	Xin >= X1,
	Yin >= Y1,
	Xin =< X2,
	Yin =< Y2.

adjustCropPixel(Xcrop, Ycrop, Pin, Pout):-
	getX(Pin, Xin),
	ValorX is Xin-Xcrop,
	setX(Pin, ValorX, Pix),
	getY(Pin, Yin),
	ValorY is Yin-Ycrop,
	setY(Pix, ValorY, Pout).

pixrgbToPixhex([X, Y, R, G, B, D], [X, Y, Hex, D]):-
	hex_bytes(Hex, [R, G, B]).
