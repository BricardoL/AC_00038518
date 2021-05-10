org     100h

    XOR CX,CX
    mov ch,00
    mov cl,05  ;Factorial de 5
    mov ah,00
    mov al,01
    mov dl,01
    cmp cl,00
    call itera
    call fin
    int 20h

itera:
    mov al,dl
    mov bl,cl
    mul bl
    mov dl,al
    loop itera
    ret
fin:
    mov [20Bh],al        
    ret
