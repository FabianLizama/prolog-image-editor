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


getHead([H|_], H).

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

% Se asume que la lista de pixeles se ingresa de manera ordenada
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

%
pixFlipH(W, Pin, Pout):-
	getX(Pin, X),
	setX(Pin, Valor, Pout),
	Valor is abs(X-(W-1)).

imageFlipH([C, W, H, PixlistIn|_], [C, W, H, PixlistOut]):-
	maplist(pixFlipH(W), PixlistIn, PixlistAux),
	sort(PixlistAux, PixlistOut).

%
pixFlipV(H, Pin, Pout):-
	getY(Pin, Y),
	setY(Pin, Valor, Pout),
	Valor is abs(Y-(H-1)).

imageFlipV([C, W, H, PixlistIn|_], [C, W, H, PixlistOut]):-
	maplist(pixFlipV(W), PixlistIn, PixlistAux),
	sort(PixlistAux, PixlistOut).
%
imageCrop([C, _, _, Plin|_], X1, Y1, X2, Y2, [C, Wout, Hout, Plout]):-
	Wout is 1+(X2-X1),
	Hout is 1+(Y2-Y1),
	include(isCropPix(X1, Y1, X2, Y2), Plin, Pixels),
	maplist(adjustCropPixel(X1, Y1), Pixels, Plaux),
	sort(Plaux, Plout).

%
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

imageRGBToHex([C, W, H, Plin|_], [C, W, H, Plout]):-
	imageIsPixmap([C, W, H, Plin|_]),
	maplist(pixrgbToPixhex, Plin, Plout).

pixrgbToPixhex([X, Y, R, G, B, D], [X, Y, Hex, D]):-
	hex_bytes(HexIni, [R, G, B]),
	atom_string(HexIni, Hex).

pixToHex(P, P):-
	ispixhex(P).

pixToHex(Pin, Pout):-
	ispixrgb(Pin),
	pixrgbToPixhex(Pin, Pout).

pixToHex([X, Y, Content, D], [X, Y, Hex, D]):-
	ispixbit([X, Y, Content, D]),
	(Content = 0, Hex = "000000");
	(Content = 1, Hex = "ffffff").

imageToHistogram([_, _, _, Pixlist|_], HistogramOut):-
	maplist(pixToHex, Pixlist, PixlistH),
	maplist(getHex, PixlistH, Hexcodes),
	clumped(Hexcodes, Histogram),
	sort(Histogram, HistogramOut).


% Se ocupa la rotación basada en la matriz de rotación cartesiana (la cual modifica la posición de los pixeles pero se aplica una corrección a la coordeada Y)
pixRotate90(W, Pin, Pout):-
	getX(Pin, Xin),
	getY(Pin, Yin),
	Yout is (-1*Xin)+(W-1),
	setX(Pin, Yin, Paux),
	setY(Paux, Yout, Pout).

imageRotate90([C, W, H, PixlistIn|_], [C, H, W, PixlistOut]):-
	maplist(pixRotate90(W), PixlistIn, PixlistAux),
	sort(PixlistAux, PixlistOut).


% Verifica si un pixel es de un color C
isColorPix(C, Pix):-
	ispixrgb(Pix),
	getR(Pix, R),
	getG(Pix, G),
	getB(Pix, B),
	hex_bytes(Hex, [R, G, B]),
	atom_string(Hex, C).

isColorPix(C, Pix):-
	ispixbit(Pix),
	getBit(Pix, Bit),
	((C = "000000", Bit = 0);
	(C = "ffffff", Bit = 1)).

isColorPix(C, [_, _, C|_]).

imageCompress([_, W, H, PixlistIn|_], [C, W, H, PixlistOut]):-
	imageToHistogram([_, W, H, PixlistIn|_], Histogram),
	getHead(Histogram, Hex),
	arg(_, Hex, C),
	exclude(isColorPix(C), PixlistIn, PixlistOut).

imageChangePixel([C, W, H, PixlistIn|_], Pix, [C, W, H, PixlistOut]):-
	getX(Pix, X),
	getY(Pix, Y),
	select([X, Y|_], PixlistIn, Pix, PixlistOut).


imageInvertColorRGB([X, Y, Rin, Gin, Bin, D], [X, Y, Rout, Gout, Bout, D]):-
	Rout is 255-Rin,
	Gout is 255-Gin,
	Bout is 255-Bin.

yCoordInPix(Y, [_, Y|_]).

bitToString(Bit, String):-
	number_string(Bit, BitS),
	string_concat(BitS, "\t", String).

hexToString(Hex, String):-
	string_concat(Hex, "\t", String).

rgbdToString([R,G,B,D], String):-
 	number_string(R, Rs),
 	number_string(G, Gs),
 	number_string(B, Bs),
 	number_string(D, Ds),
 	string_concat(Rs, "\s", Aux1),
 	string_concat(Gs, "\s", Aux2),
 	string_concat(Bs, "\s", Aux3),
 	string_concat(Ds, "\t", Aux4),
 	string_concat(Aux1, Aux2, Aux5),
 	string_concat(Aux5, Aux3, Aux6),
 	string_concat(Aux6, Aux4, String).


recurImageToString([_, _, H|_], Counter, String, String):-
	Counter = H.

recurImageToString([_, W, H, Pixlist|_], Counter, StringIn, FinalString):-
	include(yCoordInPix(Counter), Pixlist, PixlistAux),
	imageIsBitmap([_, W, H, Pixlist|_]),
	maplist(getBit, PixlistAux, Bitlist),
	maplist(bitToString, Bitlist, StringBits),
	atomics_to_string(StringBits, String),
	string_concat(String, "\n", StringAux),
	string_concat(StringIn, StringAux, StringOut),
	CounterOut is Counter+1,
	recurImageToString([_, W, H, Pixlist|_], CounterOut, StringOut, FinalString).

recurImageToString([_, W, H, Pixlist|_], Counter, StringIn, FinalString):-
	include(yCoordInPix(Counter), Pixlist, PixlistAux),
	imageIsHexmap([_, W, H, Pixlist|_]),
	maplist(getHex, PixlistAux, Hexlist),
	maplist(hexToString, Hexlist, StringBits),
	atomics_to_string(StringBits, String),
	string_concat(String, "\n", StringAux),
	string_concat(StringIn, StringAux, StringOut),
	CounterOut is Counter+1,
	recurImageToString([_, W, H, Pixlist|_], CounterOut, StringOut, FinalString).

recurImageToString([_, W, H, Pixlist|_], Counter, StringIn, FinalString):-
	include(yCoordInPix(Counter), Pixlist, PixlistAux),
	imageIsPixmap([_, W, H, Pixlist|_]),
	maplist(getRGBD, PixlistAux, RGBDlist),
	maplist(rgbdToString, RGBDlist, StringBits),
	atomics_to_string(StringBits, String),
	string_concat(String, "\n", StringAux),
	string_concat(StringIn, StringAux, StringOut),
	CounterOut is Counter+1,
	recurImageToString([_, W, H, Pixlist|_], CounterOut, StringOut, FinalString).


imageToString([_, W, H, Pixlist|_], StringOut):-
	sort(Pixlist, PixlistSorted),
	recurImageToString([_, W, H, PixlistSorted|_], 0, "", StringOut).






