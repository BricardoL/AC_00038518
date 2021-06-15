org 100h

    section .text
    XOR AX, AX
    XOR DI, DI
    XOR DX, DX

    ;modo texto
    MOV AH, 0h 
    MOV AL, 03h 
    INT 10h

    MOV DI, 0d
    MOV DH, 10
    MOV AX, firstname
    CALL assignName      
    MOV AX, middlename  
    CALL assignName
    MOV AX, lastname
    CALL assignName
    MOV AX, lastname_2
    CALL assignName
    CALL result
    CALL exit



    assignName:
        MOV word [200h], AX
        XOR AX,AX
        MOV AH, 02h 
        MOV DH, [pos+DI]
        MOV DL, 20 
        MOV BH, 0h 
        INT 10h
        MOV AH, 09h 
        MOV DX, [200h]
        INT 21h
        INC DI
        RET

    result:
        MOV AH, 00h 
        INT 16h
        RET

    exit:
        int 20h

section .data
    name DB ""
    firstname DB "Bryan $"
    middlename DB "Ricardo $"
    lastname DB "Lazo $"
    lastname_2 DB "Flores $"
    pos DB 2,4,6,8