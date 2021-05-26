org 100h

section .text

    XOR DI, DI
    XOR CX, CX
    XOR BX, BX
    MOV BL, 2d
    CALL intro
    CALL exit

section .data
    array DB 3,8,5,1,4,2,6,7,3,9
    punteroPar dw 0h
    punteroImpar dw 0h


intro:
    XOR AX, AX
    MOV AL, [array + DI]
    DIV BL
    CMP AH, 0d
    JE isPar
    JNE isImpar
    RET

exit:
    int 20h

isPar:
    XOR SI, SI
    MOV SI, [punteroPar]
    MOV CH, [array+DI]
    MOV [300h+SI], CH
    INC SI
    MOV [punteroPar] , SI
    INC DI
    CMP DI, 10d
    JNE intro
    JE exit

isImpar:
    XOR SI, SI
    MOV SI, [punteroImpar]
    MOV CH, [array+DI]
    MOV [320h+SI], CH
    INC SI
    MOV [punteroImpar], SI
    INC DI
    CMP DI, 10d
    JNE intro
    JE exit




  