;
;Write a procedure to convert the uppercase string to lowercase or lowercase string
;to uppercase depending upon on input string.

.model small
.stack 100h
.data

        msg1  db   "input string:  $"
        msg2 db  "capitalized:  $"
        str1 db  255 dup(?)

.code

start:

          mov ax,@data
          mov ds,ax

 

          lea dx,msg1
          mov ah,09h
          int 21h

          lea si,str1
          mov ah,01h

 

input:

          int 21h
          mov bl,al

          cmp al,0dh
          je  output

          xor al,20h
          mov [si],al
          inc si
          jmp input



 
output:

 

          mov al,"$"
          mov [si],al

          lea dx,msg2
          mov ah,09h
          int 21h

          lea dx,str1
          mov ah,09h
          int 21h

mov ah,4ch
int 21h

end    start
