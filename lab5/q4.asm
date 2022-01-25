;Take the marks from user and display the letter grade.

MODEL SMALL
.STACK 100H
.DATA
.CODE
    mov ax,@data
    mov ds,ax
    mov ah,01
    int 21h
    mov bl,al
    cmp bl,90
    jae g1
    cmp bl,76
    jae g2
    cmp bl,60
    jae g3
    cmp bl,50
    jae g4
    jb g5
gr1:
    mov dl,'A';
    mov ah,02
    int 21h
g2:
    mov dl,'B';
    mov ah,02
    int 21h
g3:
    mov dl,'C';
    mov ah,02
    int 21h
g4:
    mov dl,'D';
    mov ah,02
    int 21h
g5:
    mov dl,'F';
    mov ah,02
    int 21h

MOV AH,4CH
INT 21h ; return 0
END