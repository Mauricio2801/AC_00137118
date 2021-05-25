org 100h

org     100h

        section .text

        XOR SI, SI                           
        XOR DI, DI
        XOR BX, BX
        XOR CX, CX
        XOR DX, DX

        MOV     BP, arreglo     
        CALL    Almacenar        

        int     20h

        section .data

    arreglo db      01,02,03,04,05,06,07,08,09,09    
    divisor equ        02

    Almacenar:
        MOV     BL, divisor       
    x:  
        CMP     SI,10
        JE      end

        XOR     AX, AX 
        MOV     AL, [BP+SI]
        MOV     BH,AL
        DIV     BL
        INC     SI

        CMP     AH, 0
        JE      par
        JNE     impar
        

    par:
        MOV DI, CX    
        MOV     [300h+ DI], BH
        INC     DI
        MOV     CX, DI   
        jmp     x

    impar:
        MOV DI, CX    
        MOV     [320h+DI], BH
        INC     DI
        MOV     DX, DI   
        jmp     x

    end:    
        ret