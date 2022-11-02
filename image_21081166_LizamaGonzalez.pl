:- use_module(pixbit_21081166_LizamaGonzalez).
:- use_module(pixrgb_21081166_LizamaGonzalez).
:- use_module(pixhex_21081166_LizamaGonzalez).

%--------------------TDA image--------------------
% La estructura a utilizar para este TDA es una lista de la siguiente manera:
% (Color, Width, Height, PixelList)

% Donde Color representa con un string el color de los pixeles eliminados si la imagen está comprimida
% Si no está comprimida entonces color es un string vacío ("").
% Width, Height y PixelList representan el ancho (int), el alto (int) y la lista de pixeles (list) de la imagen respectivamente.

%--------------------Dominios--------------------
% I: image
% Pl: list
% W: int
% H: int
% C: string
% X: int
% Y: int
% D: int
% P: (pixbit;pixrgb;pixhex)
% Pr: pixrgb
% Ph: pixhex
% Hist: list
% Bit: int
% S: string
% L: list
% N: int

% Predicados

% Otros
% getX(P, X).
% getY(P, Y).
% getD(D, P).
% setX(P, X, P).
% setY(P, X, P).
% setD(P, X, P).

% Constructores
% backImage(C, W, H, Pl, I).
% image(W, H, Pl, I).

% Pertenencia
% imageIsBitmap(I).
% imageIsPixmap(I).
% imageIsHexmap(I).


% Modificadores
% pixFlipH(W, P, P).
% imageFlipH(I, I).
% pixFlipV(H, P, P).
% imageFlipV(I, I).
% imageCrop(I, X, Y, X, Y, I).
% isCropPix(X, Y, X, Y, P).
% adjustCropPixel(X, Y, P, P).
% imageRGBToHex(I, I).
% pixrgbToPixhex(Pr, Ph).
% pixToHex(P, Ph).
% imageToHistogram(I, Hist).
% pixRotate90(W, P, P).
% imageRotate90(I, I).
% isColorPix(C, P).
% imageCompress(I, I).
% imageChangePixel(I, P, I).
% imageInvertColorRGB(Pr, Pr).
% yCoordInPix(Y, P).
% bitToString(Bit, S).
% hexToString(S, S).
% rgbdToString(L, S).
% recurImageToString(I, N, S, S).
% imageToString(I, S).
% findPix(X, Y, P).
% whiteFill(I, X, Y, I).
% cropLayers(I, L, D, Pl, L).
% imageDepthLayers(I, L).

%--------------------Clausulas--------------------


% Auxiliares que operan sobre pixbit pixrgb y pixhex

% Selector de X en común para pixbit pixrgb y pixhex
% Dominio: (pixbit;pixrgb;pixhex) X int
getX(Pix, X):-
	(ispixbit(Pix), getXb(Pix, X));
	(ispixrgb(Pix), getXr(Pix, X));
	(ispixhex(Pix), getXh(Pix, X)).

% Selector de Y en común para pixbit pixrgb y pixhex
% Dominio: (pixbit;pixrgb;pixhex) X int
getY(Pix, Y):-
	(ispixbit(Pix), getYb(Pix, Y));
	(ispixrgb(Pix), getYr(Pix, Y));
	(ispixhex(Pix), getYh(Pix, Y)).

% Selector de D en común para pixbit pixrgb y pixhex
% Dominio: int X (pixbit;pixrgb;pixhex)
getD(D, Pix):-
	(ispixbit(Pix), getDb(Pix, D));
	(ispixrgb(Pix), getDr(Pix, D));
	(ispixhex(Pix), getDh(Pix, D)).

% Modificador de X en común para pixbit pixrgb y pixhex
% Dominio: (pixbit;pixrgb;pixhex) X int X (pixbit;pixrgb;pixhex)
setX(Pix, X, Pout):-
	(ispixbit(Pix), setXb(Pix, X, Pout));
	(ispixrgb(Pix), setXr(Pix, X, Pout));
	(ispixhex(Pix), setXh(Pix, X, Pout)).

% Modificador de Y en común para pixbit pixrgb y pixhex
% Dominio: (pixbit;pixrgb;pixhex) X int X (pixbit;pixrgb;pixhex)
setY(Pix, Y, Pout):-
	(ispixbit(Pix), setYb(Pix, Y, Pout));
	(ispixrgb(Pix), setYr(Pix, Y, Pout));
	(ispixhex(Pix), setYh(Pix, Y, Pout)).

% Modificador de D en común para pixbit pixrgb y pixhex
% Dominio: (pixbit;pixrgb;pixhex) X int X (pixbit;pixrgb;pixhex)
setD(Pix, D, Pout):-
	(ispixbit(Pix), setDb(Pix, D, Pout));
	(ispixrgb(Pix), setDr(Pix, D, Pout));
	(ispixhex(Pix), setDh(Pix, D, Pout)).

%--------------------Constructores--------------------

% Predicado constructor del TDA image
% Dominio: string X int X int x list X image
backImage(C, W, H, [], [C, W, H, []]).

backImage(C, W, H, [P1|Pr], [C, W, H, [P1|Pr]]):-
	string(C),
	integer(W),
	integer(H),
	W >= 0,
	H >= 0,
	(ispixbit(P1); ispixrgb(P1); ispixhex(P1)). %Por enunciado se asume que la lista es homogenea, por lo que solo se comprueba el primer elemento


% Predicado constructor del TDA image
% Dominio: int X int x list X image
image(W, H, Pl, I):-
	backImage("", W, H, Pl, I).

%--------------------Pertenencia--------------------
% Comprueba si la imagen entregada es Bitmap (Se asume que la lista de pixeles es homogenea)
% Dominio: image
imageIsBitmap([_, _, _, [P1|_]|_]):-
	ispixbit(P1).

% Comprueba si la imagen entregada es Pixmap (Se asume que la lista de pixeles es homogenea)
% Dominio: image
imageIsPixmap([_, _, _, [P1|_]|_]):-
	ispixrgb(P1).

% Comprueba si la imagen entregada es Hexmap (Se asume que la lista de pixeles es homogenea)
% Dominio: image
imageIsHexmap([_, _, _, [P1|_]|_]):-
	ispixhex(P1).

%--------------------Modificadores--------------------
% Invierte horizantalmente un pixel
% Dominio: int X (pixbit;pixrgb;pixhex) X (pixbit;pixrgb;pixhex) 
pixFlipH(W, Pin, Pout):-
	getX(Pin, X),
	setX(Pin, Valor, Pout),
	Valor is abs(X-(W-1)).

% Invierte horizontalmente una imagen
% Dominio: image X image
imageFlipH([C, W, H, PixlistIn|_], [C, W, H, PixlistOut]):-
	maplist(pixFlipH(W), PixlistIn, PixlistAux),
	sort(PixlistAux, PixlistOut).

% Invierte verticalmente un pixel
% Dominio: int X (pixbit;pixrgb;pixhex) X (pixbit;pixrgb;pixhex) 
pixFlipV(H, Pin, Pout):-
	getY(Pin, Y),
	setY(Pin, Valor, Pout),
	Valor is abs(Y-(H-1)).

% Invierte verticalmente una imagen
% Dominio: image X image
imageFlipV([C, W, H, PixlistIn|_], [C, W, H, PixlistOut]):-
	maplist(pixFlipV(W), PixlistIn, PixlistAux),
	sort(PixlistAux, PixlistOut).

% Recorta una imagen en un cuadrante de esquinas (X1, Y1) y (X2, Y2)
% Dominio: image X int X int X int X int X image
imageCrop([C, _, _, Plin|_], X1, Y1, X2, Y2, [C, Wout, Hout, Plout]):-
	Wout is 1+(X2-X1),
	Hout is 1+(Y2-Y1),
	include(isCropPix(X1, Y1, X2, Y2), Plin, Pixels),
	maplist(adjustCropPixel(X1, Y1), Pixels, Plaux),
	sort(Plaux, Plout).

% Comprueba si un pixel está dentro del cuadrante entregado
% Dominio: int X int X int X int X (pixbit;pixrgb;pixhex)
isCropPix(X1, Y1, X2, Y2, Pin):-
	getX(Pin, Xin),
	getY(Pin, Yin),
	Xin >= X1,
	Yin >= Y1,
	Xin =< X2,
	Yin =< Y2.

% Ajusta las coordenadas de un pixel luego de que su imagen de origen haya sido recortada
% Dominio: int X int X (pixbit;pixrgb;pixhex) X (pixbit;pixrgb;pixhex)
adjustCropPixel(Xcrop, Ycrop, Pin, Pout):-
	getX(Pin, Xin),
	ValorX is Xin-Xcrop,
	setX(Pin, ValorX, Pix),
	getY(Pin, Yin),
	ValorY is Yin-Ycrop,
	setY(Pix, ValorY, Pout).

% Convierte una imagen tipo Pixmap a Hexmap
% Dominio: image X image
imageRGBToHex([C, W, H, Plin|_], [C, W, H, Plout]):-
	imageIsPixmap([C, W, H, Plin|_]),
	maplist(pixrgbToPixhex, Plin, Plout).

% Convierte un pixrgb a pixhex
% Dominio: pixrgb X pixhex
pixrgbToPixhex([X, Y, R, G, B, D], [X, Y, Hex, D]):-
	hex_bytes(HexIni, [R, G, B]),
	atom_string(HexIni, Hex).

% Convierte cualquier tipo de pixel a pixhex
% Dominio: (pixbit;pixrgb;pixhex) X pixhex
pixToHex(P, P):-
	ispixhex(P).

pixToHex(Pin, Pout):-
	ispixrgb(Pin),
	pixrgbToPixhex(Pin, Pout).

pixToHex([X, Y, Content, D], [X, Y, Hex, D]):-
	ispixbit([X, Y, Content, D]),
	(Content = 0, Hex = "000000");
	(Content = 1, Hex = "ffffff").

% Genera un histograma de forma ("hexcolor"-frecuencia de aparición), ejemplo: ("ffffff"-3, "000000"-1)
% Dominio: image X list
imageToHistogram([_, _, _, Pixlist|_], HistogramOut):-
	maplist(pixToHex, Pixlist, PixlistH),
	maplist(getHex, PixlistH, Hexcodes),
	clumped(Hexcodes, Histogram),
	sort(Histogram, HistogramOut).


% Se rota un pixel en 90° sentido horario (depende del ancho de la imagen de origen)
% Dominio: int X (pixbit;pixrgb;pixhex) X (pixbit;pixrgb;pixhex)
pixRotate90(W, Pin, Pout):-
	getX(Pin, Xin),
	getY(Pin, Yin),
	Yout is (-1*Xin)+(W-1),
	setX(Pin, Yin, Paux),
	setY(Paux, Yout, Pout).

% Se rota una imagen en 90° horario, se utiliza la rotación basada en la matriz de rotación cartesiana
% (la cual modifica la posición de los pixeles pero se aplica una corrección a la coordeada Y para remediarlo)
% Dominio: image X image
imageRotate90([C, W, H, PixlistIn|_], [C, H, W, PixlistOut]):-
	maplist(pixRotate90(W), PixlistIn, PixlistAux),
	sort(PixlistAux, PixlistOut).


% Verifica si un pixel es de un color C
% Dominio: string X (pixbit;pixrgb;pixhex)
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

% Se comprime una imagen guardando como primer elemento de la lista que la representa, el color de todos los pixeles eliminados
% Dominio: image x image
imageCompress([_, W, H, PixlistIn|_], [C, W, H, PixlistOut]):-
	imageToHistogram([_, W, H, PixlistIn|_], [Hex|_]),
	arg(_, Hex, C),
	exclude(isColorPix(C), PixlistIn, PixlistOut).

% Cambia un pixel de una imagen por otro con las mismas coordenadas
% Dominio: image X (pixbit;pixrgb;pixhex) X image
imageChangePixel([C, W, H, PixlistIn|_], Pix, [C, W, H, PixlistOut]):-
	getX(Pix, X),
	getY(Pix, Y),
	select([X, Y|_], PixlistIn, Pix, PixlistOut).

% Invierte simetricamente el color de un pixrgb ejemplo: 250 -> 5 
% Dominio: pixrgb X pixrgb
imageInvertColorRGB([X, Y, Rin, Gin, Bin, D], [X, Y, Rout, Gout, Bout, D]):-
	Rout is 255-Rin,
	Gout is 255-Gin,
	Bout is 255-Bin.

% Comprueba si un pixel posee la coordenada Y señalada
% Dominio: int X (pixbit;pixrgb;pixhex)
yCoordInPix(Y, [_, Y|_]).

% Convierte un bit en un string para su posterior impresión por consola
% Dominio: int X string
bitToString(Bit, String):-
	number_string(Bit, BitS),
	string_concat(BitS, "\t", String).

% Convierte un código hexadecimal en un string para su posterior impresión por consola
% Dominio: string X string
hexToString(Hex, String):-
	string_concat(Hex, "\t", String).

% Convierte un código rgbd en un string para su posterior impresión por consola
% Dominio: list X string
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

% Predicado recursivo de cola que convierte una imagen a un string para su posterior impresión por consola
% Dominio: image X int X string X string
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

% Convierte una imagen en un string para su impresión por consola
% Dominio: image X string
imageToString([_, W, H, Pixlist|_], StringOut):-
	sort(Pixlist, PixlistSorted),
	recurImageToString([_, W, H, PixlistSorted|_], 0, "", StringOut).

% Comprueba si un pixel tiene las coordenadas X, Y dadas
% Dominio: int X int X (pixbit;pixrgb;pixhex)
findPix(X, Y, [X, Y|_]).

% Predicado recursivo de cola que rellena los pixeles faltantes de una imagen con pixeles blancos
% Dominio: image X int X int X image
whiteFill([C, W, H, Pixlist], _, H, [C, W, H, Pixlist]).

whiteFill([C, W, H, Pixlist], W, Yin, FilledImage):-
	Yout is Yin+1,
	whiteFill([C, W, H, Pixlist], 0, Yout, FilledImage).

whiteFill([C, W, H, [P1|Pixlist]], Xin, Yin, FilledImage):-
	include(findPix(Xin, Yin), Pixlist, []),
	Xout is Xin+1,
	getD(D, P1),
	((imageIsBitmap([C, W, H, [P1|Pixlist]]), NewPix = [Xin, Yin, 1, D]);
	(imageIsHexmap([C, W, H, [P1|Pixlist]]), NewPix = [Xin, Yin, "ffffff", D]);
	(imageIsPixmap([C, W, H,  [P1|Pixlist]]), NewPix = [Xin, Yin, 255, 255, 255, D])),
	whiteFill([C, W, H, [NewPix, P1|Pixlist]], Xout, Yin, FilledImage).

whiteFill([C, W, H, Pixlist], Xin, Yin, FilledImage):-
	Xout is Xin+1,
	whiteFill([C, W, H, Pixlist], Xout, Yin, FilledImage).

% Predicado recursivo de cola que separa una imagen por profundidades en una lista de imagenes
% Dominio: image X list X int X list X list
cropLayers(_, ListImages, _, [], ListImages).

cropLayers(Image, ListImagesIn, D, Pixlist, ListImagesOut):-
	include(getD(D), Pixlist, []),
	NewD is D+1,
	cropLayers(Image, ListImagesIn, NewD, Pixlist, ListImagesOut).

cropLayers([C, W, H, PixlistImage], ListImagesIn, D, Pixlist, ListImagesOut):-
	include(getD(D), Pixlist, PixlistAux),
	NewD is D+1,
	NewImage = [C, W, H, PixlistAux],
	whiteFill(NewImage, 0, 0, FilledImage),
	exclude(getD(D), Pixlist, PixlistOut),
	cropLayers([C, W, H, PixlistImage], [FilledImage|ListImagesIn], NewD, PixlistOut, ListImagesOut).

% Predicado que permite separar una imágen en capas en base a la profundidad en que se sitúan los pixeles
% Dominio: image X list
imageDepthLayers([C, W, H, Pixlist], ListImages):-
	cropLayers([C, W, H, Pixlist], [], 0, Pixlist, ListImages).
