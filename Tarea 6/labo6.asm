	org 	100h

	section	.text

	mov 	DX, PeticionMsj
	call  	write

	mov 	BP, contraseña
	call  	read

	call	receptor

	int 	20h

	section	.data		

receptor:			
        mov     AH, 01h         
        int     21h
        ret

read:				
        xor     SI, SI   
               
while:  
        call    receptor    
        cmp     AL, 0x0D        
        je      comparar           
        mov     [BP+SI], AL   			
        inc     SI              
        jmp     while          

write:			
	mov 	AH, 09h
	int 	21h
	ret

comparar:				
	xor SI, SI  				
loop:	
	mov AL, [BP+SI]				
	cmp AL, [password+SI]		
	jne error				

	cmp si, 4					
	je correcto					
	
	inc SI						
	jmp loop					

correcto:			
	mov 	DX, WelcomeMsj
	call 	write
	jmp exit

error:				
	mov 	DX, ErrorMsj
	call 	write
	jmp exit

exit:
	mov 	byte [BP+SI], "$"	
	ret

PeticionMsj		db	"Ingresa tu clave por favor (max: 5 caracteres): ", "$"		
WelcomeMsj 		db 	"Bienvenido, felicidades lo hiciste bien", "$"				
ErrorMsj 	    db 	"La clave es incorrecta, intentalo mas tarde", "$"				
password	    db 'Mau28', "$"						
contraseña 	times 	5  	db	" " 	