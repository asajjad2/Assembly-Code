print z-a using loop via labels

.MODEL SMALL
.STACK 100H
.DATA

var1 DB ?
var2 DB ?
sum DB ?
.CODE
main proc

mov bl,122
L2:
cmp bl,96
jne L1
JMP L3
L1:
mov dl,bl
mov ah,02h
int 21h
dec bl
jmp L2

L3:
MOV AH,4CH
INT 21H

main endp
end main
