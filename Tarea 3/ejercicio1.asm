org 100h

section .text

XOR AX, AX 
XOR BX, BX
jmp sum 

sum:
        
    ADD AL, 0d 
    ADD AL, 0d 
    ADD AL, 0d 
    ADD AL, 3d 
    ADD AL, 8d
    ADD AL, 5d 
    ADD AL, 1d 
    ADD AL, 8d 

    jmp avg
        
avg:
    MOV BL,8d
    DIV BL
    XOR AH,AH
    MOV [20Ah], AL
    MOV byte [20Bh], 0d
    jmp exit

exit:
        int 20h