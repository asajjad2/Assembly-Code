;Write Assembly program to Input Lower Case letter from user and display its
;upper case. (Subtract 32 in ASCII)

.model small
.stack 100h
.data
.code

main proc

mov ah,01
int 21h

sub al,32
mov dl,al
mov ah,02
int 21h

mov ah,4ch
int 21h

main endp
end main
