;print a to z
.MODEL SMALL
.STACK 100H
.DATA
var1 DB ?
var2 DB ?
sum DB ?
.CODE
main proc

mov bl,97
L2:
cmp bl,123
jne L1
JMP L3
L1:
mov dl,bl
mov ah,02h
int 21h
inc bl
jmp L2

L3:
MOV AH,4CH
INT 21H

main endp
end main
