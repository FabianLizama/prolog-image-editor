:- use_module(pixbit-d).

%Dominios
% I: image
% Pb: pixbit-d
% Pr: pixrgb-d
% Ph: pixhex-d
% Pl: list
% W: int
% H: int
% C: string

%Predicados
%realImage(C, W, H, Pl, I).
%image(W, H, Pl, I).
%Metas

%Clausulas

%Constructor
realImage(C, W, H, [P1|Pl], [C, W, H, [P1|Pl]]):-
	string(C),
	int(W),
	int(H),
	W >= 0,
	H >= 0,
	(ispixbit-d(P1); ispixrgb-d(P1); ispixhex-d(P1)). %Por enunciado se asume que la lista es homogenea, por lo que solo se comprueba el primer elemento

image(W, H, Pl, I):-
	realImage("", W, H, Pl, I).
	
