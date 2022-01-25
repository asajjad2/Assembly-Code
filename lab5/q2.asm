;Take 2 numbers from user and display the smaller/greater number.

.MODEL SMALL
.STACK 100H
.DATA

var dw 0;
rem db 0;
quo db 0;
count db 0;
NUM1 db 0;
NUM2 db 0;

.CODE

    mov ax,@data
    mov ds,ax
    mov ah,01h
    int 21h
    mov bl,al
    mov ah,01h
    int 21h
    mov bh,al
    cmp bl,bh
    jbe X
    mov dl,bh
    mov ah,02h
    int 21h
    jmp Y
X:
    mov dl,bl
    mov ah,02h
    int 21h
Y:
    MOV AH,4CH
    INT 21h ; return 0
    
END