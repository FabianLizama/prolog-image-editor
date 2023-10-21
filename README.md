## Instalación

```shell
git clone https://github.com/FabianLizama/prolog-image-editor.git
```


## Uso
Se pueden crear píxeles e imágenes para su posterior manipulación.
Para creación de píxeles se utilizará el ejemplo de un pixel blanco en las coordenadas `x: 2`, `y: 2` y `d: 10`.
- Pixbit:
```pl
pixbit(2,2,1,10,P).
```

- Pixrgb:
```pl
pixrgb(2,2,255,255,255,10,P)
```

- Pixhex:
```pl
pixhex(2,2,"ffffff",10,P)
```

- Image:
```pl
%image(width,height,pixelList,I) 
%ejemplo:
pixbit(0,0,0,1,P1),pixbit(1,0,0,2,P2),pixbit(0,1,0,3,P3),pixbit(1,1,1,4,P4),image(2,2,[P1,P2,P3,P4],I).
```

Para ver todas las funciones y su uso revisar el código respectivamente documentado.