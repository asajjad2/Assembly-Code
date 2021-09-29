.MODEL SMALL
.STACK 100H
.DATA
var1 DB ?
var2 DB ?
sum DB ?
quotient DB ?
rem DB ?
.CODE

main proc
MOV AX, @DATA
MOV DS, AX
mov ah,01
int 21h
mov var1,al
sub var1,48
mov ah,01
int 21h
mov var2,al
sub var2,48
mov cl,var1
add cl,var2
mov sum,cl
mov al,sum
mov ah,0000
mov bl,10
div bl
mov quotient,al
mov rem,ah
mov dl,quotient
add dl,48
mov ah,02
int 21h
mov dl,rem
add dl,48
mov ah,02
int 21h
MOV AH,4CH
INT 21H
main endp
end main
main endp
end main
