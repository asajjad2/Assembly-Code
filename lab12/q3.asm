;Use keyboard interfacing and mouse interfacing simultaneously to display the mouse
;cursor on screen and move the cursor by arrow keys.


.model small
.stack 100h
.data
showi db "  Press up,down,left,right keys","$"
ascii db "  to move cursor:: $"
scan db "Right clicked scan code::$"
xcor dw 100
ycor dw 150
.code
main proc
mov ax,@data
mov ds,ax

mov ah,0h
mov al,13
int 10h

mov ah,0ch
mov al,02h
mov bx,0
mov cx,xcor
mov dx,ycor
int 10h

;mov ax,1 ; show
;int 33h

call endlineOutput

mov dx,offset showi
mov ah,09h
int 21h

call endlineOutput

call showMouse
mov ax,4
mov cx,xcor
mov dx,ycor
int 33h

mov dx,offset ascii
mov ah,09h
int 21h

L1:
    mov ah,0ch ;clears buffer
    mov al,0
    int 21h
    ;call stringPrint
    ;call endlineOutput
    mov ax,1
    int 16h
    jz L1
    mov ah,0
    int 16h
jmp clicked

clicked:
    
    .if(ah==75)
    call printLeft
    jmp L1
    .elseif(ah==80)
    call printUp
    jmp L1
    .elseif(ah==77)
    call printRight
    jmp L1
    .elseif(ah==72)
    call printDown
    jmp L1
    .endif
    jmp L1


exit:

    mov ah,4ch
    int 21h

main endp

printLeft proc
    
    dec xcor
    mov ax,4
    mov cx,xcor
    mov dx,ycor
    int 33h
    
    ret
printLeft endp

printUp proc

    inc ycor
    mov ax,4
    mov cx,xcor
    mov dx,ycor
    int 33h

    ret
printUp endp

printRight proc

    inc xcor
    mov ax,4
    mov cx,xcor
    mov dx,ycor
    int 33h

    ret
printRight endp

printDown proc

    dec ycor
    mov ax,4
    mov cx,xcor
    mov dx,ycor
    int 33h

    ret
printDown endp

stringPrint proc

    mov dx,offset showi
    mov ah,09h
    int 21h

    ret
stringPrint endp

endlineOutput proc
    mov dl,10
    mov ah,02h
    int 21h
    ret
endlineOutput endp

showMouse proc
    mov ax,1
    int 33h
    ret
showMouse endp

end


