;Get the mouse button information, which button is pressed, left or right.

.model small
.stack 100h
.data
showi db "Click mouse button and press any key","$"
left db "Left button clicked$"
right db "Right button clicked$"


.code
main proc
mov ax,@data
mov ds,ax

mov ah,0h
mov al,12h

int 10h

mov dx,offset showi
mov ah,09h
int 21h

mov dl,10
mov ah,02
int 21h

mov ax,1 ; show
int 33h

L1:
mov ax,5
int 33h
.if(ax==1)
jmp leftt
.elseif (ax==2)
jmp rightt
.endif
jmp l1

rightt:
mov dx,offset right
mov ah,09h
int 21h
jmp exit


leftt:
mov dx,offset left
mov ah,09h
int 21h


exit:
mov ah,4ch
int 21h
main endp
end

