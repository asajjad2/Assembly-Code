;Find the transpose of a 3x3 matrix.

.model small

.stack 100h

.data

    array1 db 1,2,3,4,5,6,7,8,9
    array2 db 9 dup(?)
    max db 0
    
.code

    mov ax,@DATA
    mov ds,ax

    mov si,offset array1
    mov ax,0
    mov bx,0
    mov cx,0
    
    L1:
        
        cmp cl,3
        je L2

        mov al,[si]
        mov array2[bx],al
        add bx,3
        inc si
        inc cl
        jmp L1

    L2:

        mov si,offset array1
        add si,3
        mov ax,0
        mov bx,0
        add bx,1
        mov cx,0

        L3:

            cmp cl,3
            je L4

            mov al,[si]
            mov array2[bx],al
            add bx,3
            inc si
            inc cl
            jmp L3
    L4:
        
        mov si,offset array1
        add si,6
        mov ax,0
        mov bx,0
        add bx,2
        mov cx,0

        L5:

            cmp cl,3
            je done

            mov al,[si]
            mov array2[bx],al
            add bx,3
            inc si
            inc cl
            jmp L5


    done:

        mov si,offset array2
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


