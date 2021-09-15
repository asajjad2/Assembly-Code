;Write Assembly program to input name from the user and display the word form
;by concatenating the next character of every letter. ( Input: VERY
;Output: WFSZ )


.model small
.stack 100h
.data
.code

main proc

mov ah,01
int 21h

mov bl,al

mov ah,01
int 21h

mov bh,al

mov ah,01
int 21h

mov cl,al

mov ah,01
int 21h

mov ch,al

add bl,1
mov dl,bl
mov ah,02
int 21h

inc bh
mov dl,bh
mov ah,02
int 21h

inc cl
mov dl,cl
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
