  
org 100h

section .text

    XOR AX, AX
    XOR BX,BX;
    XOR SI, SI
    MOV BL, 8D              ;el carné tiene 8 digitos contando los 0
    MOV word CX, 8D
    MOV SI, 00
    MOV byte [0201H], 1
    MOV byte [0202H], 3
    MOV byte [0203H], 7
    MOV byte [0204H], 1
    MOV byte [0205H], 1
    MOV byte [0206H], 8     ; omití todos los 0 del inicio y asi solo sumo los digitos que he puesto aqui

        jmp x

x:
    ADD AL, [0200H + SI]
    INC SI                  ; voy incrementando con SI++
    LOOP x

promedio:
    DIV BL                  ; Divido con la cantidad de digitos que he ingresado apra sacar el promedio
    MOV [020AH], AL         ; Y lo almaceno en la dirección que lo pidieron
    jmp exit

exit:
    int 20h