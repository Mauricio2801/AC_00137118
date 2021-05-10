; Obtener el factorial del numero 5



org 100h

section .text

            XOR CX, CX
            XOR AX, AX
            MOV CL, 5d                  ;asignamos un tamaño 
            MOV AL, 1d
            CMP CL, 00
            JZ x 

condic      MUL CX                      ;realizo la multiplicación por el anterior con el loop que me va haciendo iteración
            LOOP condic 
x       MOV [20BH], AL                  ;guardo en donde pide el ejercicio
            int 20h