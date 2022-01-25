;Take a 2-digit number from user and display it.


.MODEL SMALL
.STACK 100H
.DATA

var dw 0;
rem db 0;
quo db 0;
count db 0;
.CODE

mov ax,@data
mov ds,ax
INPUT:
    mov ah,01h
    int 21h
    cmp al,13
    je OUTPUT
    sub al,48
    mov cl,al
    mov ax,var
    mov bl,10
    mul bl
    mov ch,0
    add ax,cx
    mov var,ax
    jmp INPUT
OUTPUT:
    mov ax,var
OUTPUTCALC:
    cmp ax,0
    je PRINT
    mov bl,10
    div bl
    mov rem,ah
    mov quo,al
    mov cl,rem
    mov ch,0

    add cl,48
    push cx
    mov al,quo
    mov ah,0
    inc count
    jmp OUTPUTCALC
PRINT:
    cmp count,0
    je EXIT
    pop dx
    mov ah,02h
    int 21h
    dec count
    jmp PRINT
EXIT:

    MOV AH,4CH
    INT 21h ; return 0
END