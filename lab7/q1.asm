;Take a 3x3 matrix from user and display it in matrix form.
.model small

.stack 100h

.data

    array1 db 9 dup(?)
    var1 db "ARE",0
    
.code

    mov ax,@DATA
    mov ds,ax

    mov si,offset array1
    mov ax,0
    mov bx,0
    mov cx,0
    outerLoop:

           cmp cl,3
           je Inputdone
           mov bl,0

    innerLoop:
               
                
                cmp bl, 3
                je innerLoopDone
                mov ah,01h
                int 21h
                sub al,48
                mov [si],al
                inc si
                inc bl
                jmp innerLoop

    innerLoopDone:

                inc cl
                jmp outerLoop
    Inputdone:
    mov dl,10
    mov ah,02h
    int 21h
    mov si,offset array1
    mov ax,0
    mov bx,0
    mov cx,0
    
    outerLoop1:

           cmp cl,3
           je EXIT
           mov bl,0

    innerLoop1:
               
                
                cmp bl, 3
                je innerLoopDone1
                mov dl,[si]
                add dl,48
                mov ah,02h
                int 21h
                mov dl,' '
                mov ah,02h
                int 21h
                inc si
                inc bl
                jmp innerLoop1

    innerLoopDone1:

                mov dl,10
                mov ah,02h
                int 21h
                inc cl
                jmp outerLoop1

        

    EXIT:
        mov ah,4ch
        int 21h

end
