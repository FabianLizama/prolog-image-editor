:- include(image).
%--------------------Archivo de pruebas laboratorio 2 Paradigmas de Programación--------------------

/*
--------------------Probar que se puede generar una imagen pixbit--------------------
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsBitmap(I), imageToString(I, Str),write(Str).

Propios:
pixbit(0,0,0,1,P1),pixbit(1,0,0,2,P2),pixbit(0,1,0,3,P3),pixbit(1,1,1,4,P4),image(2,2,[P1,P2,P3,P4],I),imageIsBitmap(I),imageToString(I,Str),write(Str).
pixbit(0,0,1,50,P1),pixbit(1,0,1,10,P2),pixbit(0,1,1,20,P3),pixbit(1,1,1,40,P4),image(2,2,[P1,P2,P3,P4],I),imageIsBitmap(I),imageToString(I,Str),write(Str).
pixbit(0,0,1,50,P1),pixbit(1,0,0,10,P2),image(2,1,[P1,P2],I),imageIsBitmap(I),imageToString(I,Str),write(Str).

--------------------Probar que imageIsBitMap detecta cuando se tiene una imagen en hex o en rgb--------------------
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsBitmap( I ).

Estos casos deben dar false:
pixhex( 0, 0, "ff0000", 10, PA), pixhex( 0, 1, "ff0000", 20, PB), pixhex( 1, 0, "0000ff", 30, PC), pixhex( 1, 1, "0000ff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsBitmap( I ).
pixrgb( 0, 0, 200, 200, 200, 10, PA), pixrgb( 0, 1, 200, 200, 200, 20, PB), pixrgb( 1, 0, 190, 190, 190, 30, PC), pixrgb( 1, 1, 190, 190, 190, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsBitmap( I ).

Propios: (deben dar false también)
pixhex(0,0,"ffffff",100,P1),image(1,1,[P1],I),imageIsBitmap(I).
pixrgb(0,0,255,255,255,100,P1),image(1,1,[P1],I),imageIsBitmap(I).
pixhex(0,0,"ffffff",100,P1),pixhex(0,1,"000000",100,P2),image(1,2,[P1,P2],I),imageIsBitmap(I).
pixrgb(0,0,0,0,0,100,P1),pixrgb(0,1,255,255,255,100,P2),image(1,2,[P1,P2],I),imageIsBitmap(I).

--------------------Probar que se puede generar una imagen pixhex--------------------
pixhex( 0, 0, "ff0000", 10, PA), pixhex( 0, 1, "ff0000", 20, PB), pixhex( 1, 0, "0000ff", 30, PC), pixhex( 1, 1, "0000ff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToString(I, Str),write(Str).

Propios:
pixhex(0,0,"ffffff",100,P1),image(1,1,[P1],I),imageToString(I,Str),write(Str).
pixhex(0,0,"ffffff",100,P1),pixhex(0,1,"000000",100,P2),image(1,2,[P1,P2],I),imageToString(I,Str),write(Str).
pixhex(0,0,"000000",100,P1),pixhex(0,1,"ffffff",100,P2),pixhex(1,0,"ffffff",100,P3),pixhex(1,1,"000000",100,P4),image(1,2,[P1,P2,P3,P4],I),imageToString(I,Str),write(Str).

--------------------Probar que imageIsHexmap detecta cuando se tiene una imagen en bit o en rgb--------------------
pixhex( 0, 0, "ff0000", 10, PA), pixhex( 0, 1, "ff0000", 20, PB), pixhex( 1, 0, "0000ff", 30, PC), pixhex( 1, 1, "0000ff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsHexmap( I ).

Estos casos deben dar false:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsHexmap( I ).
pixrgb( 0, 0, 200, 200, 200, 10, PA), pixrgb( 0, 1, 200, 200, 200, 20, PB), pixrgb( 1, 0, 190, 190, 190, 30, PC), pixrgb( 1, 1, 190, 190, 190, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsHexmap( I ).

Propios: (deben dar false)
pixrgb(0,0,0,0,0,100,P1),pixrgb(0,1,255,255,255,100,P2),image(1,2,[P1,P2],I),imageIsHexmap(I).
pixbit(0,0,1,50,P1),pixbit(1,0,0,10,P2),image(2,1,[P1,P2],I),imageIsHexmap(I).
pixrgb(0,0,255,255,255,100,P1),image(1,1,[P1],I),imageIsHexmap(I).

--------------------Probar que se puede generar una imagen pixrgb--------------------
pixrgb( 0, 0, 255, 0, 0, 10, PA), pixrgb( 0, 1, 255, 0, 0, 20, PB), pixrgb( 1, 0, 0, 0, 255, 30, PC), pixrgb( 1, 1, 0, 0, 255, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageToString(I, Str),write(Str).

Propios:
pixrgb(0,0,0,0,0,100,P1),pixrgb(0,1,255,255,255,100,P2),image(1,2,[P1,P2],I),imageToString(I, Str),write(Str).
pixrgb(0,0,255,255,255,100,P1),image(1,1,[P1],I),imageToString(I, Str),write(Str).
pixrgb(0,0,0,0,0,1,P1),pixrgb(1,0,255,255,255,2,P2),pixrgb(0,1,0,0,0,3,P3),pixrgb(1,1,255,255,255,4,P4),image(2,2,[P1,P2,P3,P4],I),imageToString(I,Str),write(Str).

--------------------Probar que imageIsPixmap detecta cuando se tiene una imagen en hex o en bit--------------------
pixrgb( 0, 0, 200, 200, 200, 10, PA), pixrgb( 0, 1, 200, 200, 200, 20, PB), pixrgb( 1, 0, 190, 190,190, 30, PC), pixrgb( 1, 1, 190, 190, 190, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ).

Estos casos deben dar false:
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ).
pixhex( 0, 0, "ff0000", 10, PA), pixhex( 0, 1, "ff0000", 20, PB), pixhex( 1, 0, "0000ff", 30, PC), pixhex( 1, 1, "0000ff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ).

Propios: (deben dar false)
pixbit( 0, 0, 1, 10, PA), pixbit( 0, 1, 0, 20, PB), pixbit( 1, 0, 0, 30, PC), pixbit( 1, 1, 1, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ).
pixhex(0,0,"ffffff",100,P1),pixhex(0,1,"000000",100,P2),image(1,2,[P1,P2],I),imageIsPixmap(I).
pixbit(0,0,1,50,P1),pixbit(1,0,1,10,P2),pixbit(0,1,1,20,P3),pixbit(1,1,1,40,P4),image(2,2,[P1,P2,P3,P4],I),imageIsPixmap( I ).

--------------------Convierte una imagen RGB a HEX y comprueba con los predicados de pertenencia, luego convierte a string y muestra por pantalla--------------------
pixrgb( 0, 0, 200, 200, 200, 10, PA), pixrgb( 0, 1, 200, 200, 200, 20, PB), pixrgb( 1, 0, 190, 190,190, 30, PC), pixrgb( 1, 1, 190, 190, 190, 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageIsPixmap( I ), imageRGBToHex(I, I2), imageIsHexmap(I2), imageToString(I2, Str), write(Str).

Propios:
pixrgb(0,0,0,0,0,1,P1),pixrgb(1,0,255,255,255,2,P2),pixrgb(0,1,0,0,0,3,P3),pixrgb(1,1,255,255,255,4,P4),image(2,2,[P1,P2,P3,P4],I),imageIsPixmap(I),imageRGBToHex(I, I2),imageIsHexmap(I2),imageToString(I2,Str),write(Str).
pixrgb(0,0,255,255,255,100,P1),image(1,1,[P1],I),imageIsPixmap(I),imageRGBToHex(I, I2),imageIsHexmap(I2),imageToString(I2,Str),write(Str).
pixrgb(0,0,0,0,0,100,P1),pixrgb(0,1,255,255,255,100,P2),image(1,2,[P1,P2],I),imageIsPixmap(I),imageRGBToHex(I, I2),imageIsHexmap(I2),imageToString(I2,Str),write(Str).

--------------------Comprime una imagen, luego descomprime y debe resultar la misma imagen original--------------------
imageDecompress no implementado.

--------------------Si se rota una imagen 4 veces en 90°, debería resultar la imagen original--------------------
pixhex( 0, 0, "ff0000", 10, PA), pixhex( 0, 1, "ff0000", 20, PB), pixhex( 1, 0, "0000ff", 30, PC), pixhex( 1, 1, "0000ff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90(I, I2), imageRotate90(I2, I3), imageRotate90(I3, I4), imageRotate90(I4, I5).
En el ejemplo anterior “I” debería ser igual a “I5”

Propios:
pixrgb(0,0,0,0,0,100,P1),pixrgb(0,1,255,255,255,100,P2),image(1,2,[P1,P2],I), imageRotate90(I, I2), imageRotate90(I2, I3), imageRotate90(I3, I4), imageRotate90(I4, I5).
pixhex(0,0,"ffffff",100,P1),image(1,1,[P1],I), imageRotate90(I, I2), imageRotate90(I2, I3), imageRotate90(I3, I4), imageRotate90(I4, I5).
pixbit(0,0,1,50,P1),pixbit(0,1,1,10,P2),pixbit(1,0,1,20,P3),pixbit(1,1,1,40,P4),image(2,2,[P1,P2,P3,P4],I), imageRotate90(I, I2), imageRotate90(I2, I3), imageRotate90(I3, I4), imageRotate90(I4, I5).

--------------------Si se rota una imagen en 90° que tiene el mismo color y profundidad en todos sus píxeles, entonces la imagen resultante debería ser la misma imagen original--------------------
pixhex( 0, 0, "ff0000", 30, PA), pixhex( 0, 1, "ff0000", 30, PB), pixhex( 1, 0, "ff0000", 30, PC), pixhex( 1, 1, "ff0000", 30, PD), image( 2, 2, [PA, PB, PC, PD], I), imageRotate90(I, I2).
En el ejemplo anterior “I” debería ser igual a “I2”

Propios:
pixrgb(0,0,255,255,255,100,P1),pixrgb(0,1,255,255,255,100,P2),pixrgb(1,0,255,255,255,100,P3),pixrgb(1,1,255,255,255,100,P4),image(2,2,[P1,P2,P3,P4],I), imageRotate90(I, I2).
pixhex(0,0,"ffffff",100,P1),image(1,1,[P1],I), imageRotate90(I, I2).
pixbit(0,0,1,50,P1),pixbit(0,1,1,50,P2),pixbit(1,0,1,50,P3),pixbit(1,1,1,50,P4),image(2,2,[P1,P2,P3,P4],I), imageRotate90(I, I2).

--------------------Si se hace imageFlipV dos veces de una imagen, debería resultar la imagen original--------------------
pixhex( 0, 0, "ff0000", 10, PA), pixhex( 0, 1, "ff0000", 20, PB), pixhex( 1, 0, "0000ff", 30, PC), pixhex( 1, 1, "0000ff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipV(I, I2), imageFlipV(I2, I3).
En el ejemplo anterior “I” debería ser igual a “I3”

Propios:
pixrgb(0,0,0,0,0,100,P1),pixrgb(0,1,255,255,255,100,P2),image(1,2,[P1,P2],I), imageFlipV(I, I2), imageFlipV(I2, I3).
pixhex(0,0,"ffffff",100,P1),image(1,1,[P1],I), imageFlipV(I, I2), imageFlipV(I2, I3).
pixbit(0,0,1,50,P1),pixbit(0,1,1,10,P2),pixbit(1,0,1,20,P3),pixbit(1,1,1,40,P4),image(2,2,[P1,P2,P3,P4],I), imageFlipV(I, I2), imageFlipV(I2, I3).

--------------------Si se hace imageFlipH dos veces de una imagen, debería resultar la imagen original--------------------
pixhex( 0, 0, "ff0000", 10, PA), pixhex( 0, 1, "ff0000", 20, PB), pixhex( 1, 0, "0000ff", 30, PC), pixhex( 1, 1, "0000ff", 4, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipH(I, I2), imageFlipH(I2, I3).
En el ejemplo anterior “I” debería ser igual a “I3”

Propios:
pixrgb(0,0,0,0,0,100,P1),pixrgb(0,1,255,255,255,100,P2),image(1,2,[P1,P2],I), imageFlipH(I, I2), imageFlipH(I2, I3).
pixhex(0,0,"ffffff",100,P1),image(1,1,[P1],I), imageFlipH(I, I2), imageFlipH(I2, I3).
pixbit(0,0,1,50,P1),pixbit(0,1,1,10,P2),pixbit(1,0,1,20,P3),pixbit(1,1,1,40,P4),image(2,2,[P1,P2,P3,P4],I), imageFlipH(I, I2), imageFlipH(I2, I3).

--------------------Si se hace imageFlipH a una imagen que tiene el mismo color y profundidad en todos sus pixeles, entonces la imagen resultante debería ser la misma imagen original--------------------
pixhex( 0, 0, "ff0000", 30, PA), pixhex( 0, 1, "ff0000", 30, PB), pixhex( 1, 0, "ff0000", 30, PC), pixhex( 1, 1, "ff0000", 30, PD), image( 2, 2, [PA, PB, PC, PD], I), imageFlipH(I, I2).
En el ejemplo anterior “I” debería ser igual a “I2”

Propios:
pixrgb(0,0,255,255,255,100,P1),pixrgb(0,1,255,255,255,100,P2),pixrgb(1,0,255,255,255,100,P3),pixrgb(1,1,255,255,255,100,P4),image(2,2,[P1,P2,P3,P4],I), imageFlipH(I, I2).
pixhex(0,0,"ffffff",100,P1),image(1,1,[P1],I), imageFlipH(I, I2).
pixbit(0,0,1,50,P1),pixbit(0,1,1,50,P2),pixbit(1,0,1,50,P3),pixbit(1,1,1,50,P4),image(2,2,[P1,P2,P3,P4],I), imageFlipH(I, I2).

--------------------Se crea una imagen de 3x3 pixeles y se corta en una de 2x2 con solo la esquina inferior izquierda--------------------
pixhex( 0, 0, "ff0000", 20, PA), pixhex( 0, 1, "ff0000", 20, PB), pixhex( 0, 2, "ff0000", 20, PC), pixhex( 1, 0, "0000ff", 30, PD), pixhex( 1, 1, "0000ff", 4, PE), pixhex( 1, 2, "0000ff", 4, PF), pixhex( 2, 0, "0000ff", 4, PG), pixhex( 2, 1, "0000ff", 4, PH), pixhex( 2, 2, "0000ff", 4, PI), image( 3, 3, [PA, PB, PC, PD, PE, PF, PG, PH, PI], I), imageCrop( I, 1, 1, 2, 2, I2), pixhex( 0, 0, "0000ff", 4, PE2), pixhex( 0, 1, "0000ff", 4, PF2), pixhex( 1, 0, "0000ff", 4, PH2), pixhex( 1, 1, "0000ff", 4, PI2), image( 2, 2, [PE2, PF2, PH2, PI2], I3).
En el ejemplo anterior, “I2” debería ser una imagen con los mismos pixeles y dimensiones que “I3”

Propios imageCrop:
Se corta el pixel inferior izquierdo de una imagen de 2x2:
pixbit(0,0,0,1,P1),pixbit(1,0,0,2,P2),pixbit(0,1,0,3,P3),pixbit(1,1,1,4,P4),image(2,2,[P1,P2,P3,P4],I),imageCrop(I,0,1,0,1,I2),imageToString(I2,Str),write(Str).
Se corta la mitad superior de una imagen de 2x2:
pixbit(0,0,0,1,P1),pixbit(1,0,0,2,P2),pixbit(0,1,0,3,P3),pixbit(1,1,1,4,P4),image(2,2,[P1,P2,P3,P4],I),imageCrop(I,0,0,1,0,I2),imageToString(I2,Str),write(Str).
Se corta la mitad izquierda de una imagen de 2x2:
pixbit(0,0,0,1,P1),pixbit(1,0,0,2,P2),pixbit(0,1,0,3,P3),pixbit(1,1,1,4,P4),image(2,2,[P1,P2,P3,P4],I),imageCrop(I,0,0,0,1,I2),imageToString(I2,Str),write(Str).

--------------------Toma el píxel de la posición (0,1) que en la imagen original tiene los valores RGB (20, 20, 20) y lo reemplaza por otro píxel con valor RGB (54, 54, 54)--------------------
pixrgb( 0, 0, 10, 10, 10, 10, P1), pixrgb( 0, 1, 20, 20, 20, 20, P2), pixrgb( 1, 0, 30, 30, 30, 30, P3), pixrgb( 1, 1, 40, 40, 40, 40, P4), image( 2, 2, [P1, P2, P3, P4], I1), pixrgb( 0, 1, 54, 54, 54, 20, P2_modificado), imageChangePixel(I1, P2_modificado, I2).

Propios imageChangePixel:
Toma el pixel en la posición 0,0 y lo cambia por un pixel rojo
pixrgb(0,0,0,0,0,1,P1),pixrgb(1,0,255,255,255,2,P2),pixrgb(0,1,0,0,0,3,P3),pixrgb(1,1,255,255,255,4,P4),image(2,2,[P1,P2,P3,P4],I),pixrgb(0,0,255,0,0,10,PRojo),imageChangePixel(I,PRojo,I2).
Toma el pixel en la posición 1,1 y lo cambia por uno verde
pixrgb(0,0,0,0,0,1,P1),pixrgb(1,0,255,255,255,2,P2),pixrgb(0,1,0,0,0,3,P3),pixrgb(1,1,255,255,255,4,P4),image(2,2,[P1,P2,P3,P4],I),pixrgb(1,1,0,255,0,10,PVerde),imageChangePixel(I,PVerde,I2).
Toma el pixel en la posición 0,1 y lo cambia por un pixel azul
pixrgb(0,0,0,0,0,1,P1),pixrgb(1,0,255,255,255,2,P2),pixrgb(0,1,0,0,0,3,P3),pixrgb(1,1,255,255,255,4,P4),image(2,2,[P1,P2,P3,P4],I),pixrgb(1,1,0,0,255,10,PAzul),imageChangePixel(I,PAzul,I2).

--------------------Se construye imagen de 2x2 con los primeros 2 pixeles con profundidad 10 y los otros 2 con profundidad de 30, entonces al consultar “imageDepthLayers” se debería obtener una lista con dos imágenes--------------------
pixrgb( 0, 0, 33, 33, 33, 10, PA), pixrgb( 0, 1, 44, 44, 44, 10, PB), pixrgb( 1, 0, 55, 55, 55, 30, PC), pixrgb( 1, 1, 66, 66, 66, 30, PD), image( 2, 2, [PA, PB, PC, PD], I), imageDepthLayers(I, [PRIMERA, SEGUNDA]), pixrgb( 0, 0, 33, 33, 33, 10, PA2), pixrgb( 0, 1, 44, 44, 44, 10, PB2), pixrgb( 1, 0, 255, 255, 255, 10, PC2), pixrgb( 1, 1, 255, 255, 255, 10, PD2), image( 2, 2, [PA2, PB2, PC2, PD2], I2), pixrgb( 0, 0, 255, 255, 255, 30, PA3), pixrgb( 0, 1, 255, 255, 255, 30, PB3), pixrgb( 1, 0, 55, 55, 55, 30, PC3), pixrgb( 1, 1, 66, 66, 66, 30, PD3), image( 2, 2, [PA3, PB3, PC3, PD3], I3).
En el ejemplo anterior, “I2” debería ser una imagen con los mismos pixeles y dimensiones que “PRIMERA”. “I3” debería ser una imagen con los mismos pixeles y dimensiones que “SEGUNDA”.

Propios:
Imagen 2x2 con cuatro profundidades distintas:
pixbit(0,0,0,1,P1),pixbit(1,0,0,2,P2),pixbit(0,1,0,3,P3),pixbit(1,1,1,4,P4),image(2,2,[P1,P2,P3,P4],I),imageIsBitmap(I),imageDepthLayers(I, [UNO, DOS, TRES, CUATRO]).
Imagen 2x2 con una sola profundidad:
pixbit(0,0,0,1,P1),pixbit(1,0,0,1,P2),pixbit(0,1,0,1,P3),pixbit(1,1,1,1,P4),image(2,2,[P1,P2,P3,P4],I),imageIsBitmap(I),imageDepthLayers(I, [UNO]).
Imagen 2x2 con tres profundidades:
pixbit(0,0,0,10,P1),pixbit(1,0,0,10,P2),pixbit(0,1,0,30,P3),pixbit(1,1,1,20,P4),image(2,2,[P1,P2,P3,P4],I),imageIsBitmap(I),imageDepthLayers(I, [UNO, DOS, TRES]).

*/
