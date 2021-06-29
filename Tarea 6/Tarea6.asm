	org 	100h
    
    section	.data
    msgIntro 	    db 	"Escriba la clave:$"
    msgWelcome  	db 	"BIENVENIDO$"
    msgIncorrect	db 	"INCORRECTO$"
    ;5 characters
    keyLong times 5 db  " " 	
    key 	        db "blazo$"

	section	.text
    ;Logica que abarca la escritura y leida de la key
    call writeAndReadString
    ;Compara si es primera vez comparando la key   
    call comparison
    int 20h

prelogic:
    ;Logica que abarca la escritura y leida de la key
    call writeAndReadString
    ;Compara si es primera vez comparando la key   
    call comparison

writeAndReadString:
    mov  DX, msgIntro	
    call userInput 
    ;Nuestra direccion de guardado BP->
    mov BP, keyLong      
    call readInput
    ret

compare:   
    mov BH, [SI + keyLong]
    mov BL, [SI + key]
    INC SI
    ;Comparar key
    cmp BH, BL
    je msgwelcome
    jnp incorrect
    jmp while

comparison:     
;Compara si es primera vez comparando la key   
    cmp DI, 0
    jg msgincorrect  
    call userInput 
    call waitingInput 
    ret

incorrect:
    xor DI,DI
    inc DI		
	jmp while

msgwelcome:       
    xor DX, DX
	mov DX, msgWelcome
	jmp while


msgincorrect:
    MOV DX, msgIncorrect         
    call userInput 
    call waitingInput   
           

waitingInput:
    mov     AH, 01h         
    int     21h
    ret

readInput:
    xor     SI, SI   


while:  
    call    waitingInput 
    ;  0x0D: EnterKey 
    cmp     AL, 0x0D        
    je      exit           
    mov     [BP+SI], AL   	
    jmp     compare   
    

exit:
	mov 	byte [BP+SI], "$"	
    ret

userInput:
	mov 	AH, 09h
	int 	21h
	ret