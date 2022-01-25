;Take 5 multi digit inputs from user and store in an array. Take the index from user
;and display if the number at that index is even or odd. E.g., ‘The number is even/odd’

.MODEL SMALL
.STACK 100H
.DATA
msg1 db &quot;The number is even&quot;,&#39;$&#39;
msg2 db &quot;The number is odd&quot;,&#39;$&#39;
arr db 5 dup(?)
var db 0
small db 0
large db 0
.CODE
    MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    mov si,0
    mov cx,5
Input:
    mov ah,01
    int 21h
    cmp al,13
    je nextNumber
    sub al,48
    mov var,al
    mov al,arr[si]
    mov bl,10
    mul bl
    add al,var
    mov arr[si], al
    JMP Input
nextNumber:

    inc si
    loop Input
    mov si,0
    mov ah,01
    int 21h
    mov ah,0000
    mov si,ax
    mov al,arr[si]
    mov bh,0000
    mov bl,2
    div bl
    cmp ah,0
    je L1
    jmp L3
L1:
    mov dx,offset msg1;
    mov ah,09h
    int 21h
    jmp L2
L3:
    mov dx,offset msg2;
    mov ah,09h
    int 21h
    jmp L2
L2:

    mov ah,4ch
    int 21H
MAIN ENDP
end main