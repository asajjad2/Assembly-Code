;Use keyboard interfacing interrupt and draw pixels as you press the up, down, left,
;and right arrow keys.

.model small
.stack 100h
.data
showi db "  Press up,down,left,right keys,d for diagonal","$"
ascii db "  to print pixels:: $"
scan db "Right clicked scan code::$"
xcor dw 159
ycor dw 99
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
    .elseif(al=='d')
    call printDiagonal
    jmp L1
    .endif
    jmp L1


exit:

    mov ah,4ch
    int 21h

main endp

printLeft proc

    mov ah,0ch
    mov al,03h

    mov bx,0
    dec xcor
    mov cx,xcor
    mov dx,ycor
    int 10h

    ret
printLeft endp

printUp proc

    mov ah,0ch
    mov al,04h
    mov bx,0
    inc ycor
    mov cx,xcor
    mov dx,ycor
    int 10h

    ret
printUp endp

printRight proc

    mov ah,0ch
    mov al,05h
    mov bx,0
    inc xcor
    mov cx,xcor
    mov dx,ycor
    int 10h

    ret
printRight endp

printDown proc

    mov ah,0ch
    mov al,06h
    mov bx,0
    dec ycor
    mov cx,xcor
    mov dx,ycor
    int 10h

    ret
printDown endp

printDiagonal proc

    mov ah,0ch
    mov al,07h
    mov bx,0
    inc xcor
    inc ycor
    mov cx,xcor
    mov dx,ycor

    int 10h

    ret
printDiagonal endp

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

end

