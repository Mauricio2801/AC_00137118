; Primero asigno los caracteres
mov     byte[200h], "M"
mov     byte[201h], "E"
mov     byte[202h], "P"
mov     byte[203h], "P"

;Ahora copio el valor de 200h a AX usando direccionamiento directo
mov     AX, [200h]

;Ahora copio el valor 201h a CX usando direccionamiento indirecto por registro
mov     BX, [201h]
mov     CX, BX

;Se copia el valor de 202 a DX usando direccionamiento indirecto base más indice
mov     BP, 200h
mov     SI, 002h
mov     DX, [BP+SI]

;Copio el valor de 203 a DI usando el direccionamiento relativo por registro
mov     DI, [BP+003h]