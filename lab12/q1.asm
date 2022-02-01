;Use keyboard interfacing interrupt to:
;a. Find out if any key is pressed or not
;b. Find out which key is pressed

.model small
.stack 100h
.data
showi db "No key pressed","$"
ascii db "Key clicked :: $"
scan db "Right clicked scan code::$"


.code
main proc
mov ax,@data
mov ds,ax

mov dl,10
mov ah,02
int 21h

mov ax,1 ; show
int 33h

mov ah,0ch ;clears buffer
mov al,0
int 21h

L1:
    ;call stringPrint
    ;call endlineOutput
    mov ax,1
    int 16h
    jz L1
    mov ah,0
    int 16h
jmp clicked

clicked:
    
    mov dx,offset ascii
    mov ah,09h
    int 21h


    mov dl,al
    mov ah,02h
    int 21h

    call endlineOutput

    jmp L1


exit:

    mov ah,4ch
    int 21h

main endp

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

