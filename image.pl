:- use_module(pixbitd).
:- use_module(pixrgbd).
:- use_module(pixhexd).

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
% Función constructora del TDA image
% Dominio: (string X int X int x list X list)
% Recorrido: image
backImage(C, W, H, [P1|Pr], [C, W, H, [P1|Pr]]):-
	string(C),
	integer(W),
	integer(H),
	W >= 0,
	H >= 0,
	(ispixbitd(P1); ispixrgbd(P1); ispixhexd(P1)). %Por enunciado se asume que la lista es homogenea, por lo que solo se comprueba el primer elemento

image(W, H, Pl, I):-
	backImage("", W, H, Pl, I).
	

% Pertenencia
imageIsBitmap([_, _, _, [P1|_]|_]):-
	ispixbitd(P1).

imageIsPixmap([_, _, _, [P1|_]|_]):-
	ispixrgbd(P1).

imageIsHexmap([_, _, _, [P1|_]|_]):-
	ispixhexd(P1).

abs(N1, No):-
	(integer(N1),
	(N1 < 0, No = (N1 * -1));
	(N1 >= 0, No = N1).

pixFlipH(Pin, Pout):-
	(ispixbitd(Pin), );
	(ispixrgbd(Pin), );
	(ispixhexd(Pin), ).

%imageFlipH([S, W, H, [P1in|Prin]], [S, W, H, [P1out|Prout]]):-
%	listavacia().

