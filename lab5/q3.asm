;Take a range of numbers from user and display even/odd numbers in that range.

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
    mov cl,al
    sub cl,48
    mov ah,01h
    int 21h
    mov ch,al
    sub ch,48
    sub ch,cl
    mov count,ch
comparison:
    cmp count,0
    je exit
    dec count
    mov al,cl
    mov ah,0
    mov bl,2
    div bl
    mov rem,ah
    cmp rem,0
    je printEq
    inc cl
    jmp comparison
printEq:
    mov dl,cl
    add dl,48
    mov ah,02h
    int 21h
    inc cl
    jmp comparison

exit:

    MOV AH,4CH
    INT 21h ; return 0
END