;Print the string ‘I live in Pakistan. Islamabad is its capital city.’ in reverse order using
;stack operations.

.MODEL SMALL
.STACK 100H
.DATA

       msg db "I live in Pakistan. Islamabad is its capital city.",'$'

 

.CODE

       mov ax,@data
       mov ds,ax

       mov si, offset msg
       mov cx, lengthof msg
       add cx, 9
       mov ax,0

 

pushing:

       push [si]
       inc si
       cmp si,cx
       je exit
       jmp pushing



exit:
       sub cx, 10

popping:

       pop bx
       mov dx,bx
       mov ah,02h
       int 21h
       loop popping

 

exit1:

 
mov ah,4ch
int 21h

 

END
