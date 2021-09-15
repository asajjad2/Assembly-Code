;Write Assembly program to input letter from the user and display the next
;character

.model small
.stack 100h
.data
.code

main proc

mov ah,01
int 21h

mov dl,al
inc dl
mov ah,02
int 21h

inc ch
mov dl,ch
mov ah,02
int 21h

mov ah,4ch
int 21h

main endp
end main
