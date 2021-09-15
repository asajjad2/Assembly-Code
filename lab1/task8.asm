;Write an assembly language program to subtract two values.

.model small
.stack 100h
.data
.code

main proc

mov ah,01
int 21h

mov bl,al
sub bl,48

mov ah,01
int 21h

mov bh,al
sub bh,48

mov cl,bl
sub cl,bh
add cl,48
mov dl,cl

mov ah,02
int 21h

mov ah,4ch
int 21h

main endp
end main
