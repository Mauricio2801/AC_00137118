org 100h

    section .text

    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX
    XOR CL, CL
    MOV SI, 0
    MOV DI, 0
    MOV DH, 2
    MOV DL, 4
    MOV byte[200h], 4
    MOV byte[201h], 6
    MOV byte[202h], 8

    call video

    nombre: 
        call caracter
        CMP SI, 9 
        JB nombre
        call enter
        jmp nombre2


    nombre2:
        MOV DH, [200h] 
        call caracter
        CMP SI,8 
        JB nombre2
        call enter
        jmp apellido


    apellido:
        MOV DH, [201h] 
        call caracter
        CMP SI,9 
        JB apellido
        call enter
        jmp apellido2

    apellido2:
        MOV DH, [202h] 
        call caracter
        CMP SI, 9  
        JB apellido2
        call enter
        MOV AH, 00h 
        INT 16h
        INT 20h


    video: 
        MOV AH, 00h  
        MOV AL, 03h  
        INT 10h
        RET

    caracter:
        MOV AH, 02h 
        MOV BH, 0h 
        MOV CL, [fullname+DI]
        INT 10h
        MOV AH, 0Ah 
        MOV AL, CL 
        MOV BH, 0h 
        MOV CX, 1h 
        INT 10h
        INC DI 
        INC DL 
        INC SI
        RET

    enter:
        MOV SI,0
        MOV DL,4
        RET    

    section .data

    fullname DB 'Mauricio Enrique Palacios Palacios'