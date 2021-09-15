;Write Assembly program to Input Upper Case letter from user and display its
;lower case. (ADD 32 from ASCII)

.model small
.stack 100h
.data
.code

main proc

mov ah,01
int 21h

add al,32
mov dl,al
mov ah,02
int 21h

mov ah,4ch
int 21h

main endp
end main
