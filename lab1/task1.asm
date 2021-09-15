;Write an assembly language program to print hello world using mov ah,02 service routine.
.model small
.stack 100h
.data
.code

main proc

mov dl,'H'
mov ah,2
int 21h

mov dl,'e'
mov ah,2
int 21h

mov dl,'l'
mov ah,2
int 21h

mov dl,'l'
mov ah,2
int 21h

mov dl,'o'
mov ah,2
int 21h

mov dl,' '
mov ah,2
int 21h

mov dl,'W'
mov ah,2
int 21h

mov dl,'o'
mov ah,2
int 21h

mov dl,'r'
mov ah,2
int 21h

mov dl,'l'
mov ah,2
int 21h

mov dl,'d'
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main
