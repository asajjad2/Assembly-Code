;check if single digit is even or odd
.MODEL SMALL
.STACK 100H
.DATA
var1 DB ?
var2 DB ?
sum DB ?
.CODE
main proc

mov ah, 01h
int 21h
mov cl,al
mov ah,0000

mov bl,2
div bl
mov ch,ah

cmp ch,0
je L1
mov dl,&#39;o&#39;
mov ah,02h
int 21h
jmp L2
L1:
mov dl,&#39;e&#39;
mov ah,02h
int 21h
L2:
MOV AH,4CH
INT 21H

main endp
end main
