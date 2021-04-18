	org	100h
        section .text
       
        ;Parte 1
	mov	   byte [200h], "B"
	mov	   byte [201h], "R"
	mov	   byte [202h], "L"
	mov	   byte [203h], "F"
        
        ;Parte 2
	; a. Direccionamiento directo 
	mov	   AL, [200h]
	; b. Direccionamiento indirecto por registro
	mov	   BX, 201h
	mov	   CL, [BX]
	; c. Direccionamiento indirecto base mas indice
        ;BX=200h
        mov        BX, 200h
	mov	   SI, 2h
	mov	   DL, [BX+SI]
	;  d. Direccionamiento relativo por registro
	mov        DI, [BX+3h]

	int 20h