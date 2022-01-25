;compare if 2 single digit numbers are equal or not
.MODEL SMALL

.STACK 100H

.DATA

var1 DB ?
var2 DB ?
sum DB ?

.CODE

main proc

mov ah,01h
int 21h

mov bl,al

mov ah,01h
int 21h

mov bh,al

cmp bl,bh
je L1

mov dl,'n';
mov ah,02h
int 21h
jmp L2

L1:
mov dl,'y';
mov ah,02h
int 21h
L2:

MOV AH,4CH
INT 21H

main endp
end main
