;Initialize two 4x4 matrices and add their corresponding entries and display the
;resultant matrix.

.model small

.stack 100h

.data

    var1 BYTE "AAA",0
    array1 db 1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4
    array2 db 1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4
    array3 db 16 dup(?)
    var2 BYTE "AAA",0
    
.code

    mov ax,@DATA
    mov ds,ax

    mov si,offset var1
    mov si,offset array1
    mov bx,offset array2
    mov di,offset array3
    mov ax,0
    mov cx,0
    outerLoop:

           cmp cl,4
           je Inputdone
           mov al,0

    innerLoop:
               
                
                cmp al, 4
                je innerLoopDone
                mov dl,[si]
                add [di],dl
                mov dl,[bx]
                add [di],dl
                inc si
                inc bx
                inc di
                inc al
                jmp innerLoop

    innerLoopDone:

                inc cl
                jmp outerLoop
    Inputdone:
    mov dl,10
    mov ah,02h
    int 21h
    mov si,offset array3
    mov ax,0
    mov bx,0
    mov cx,0
    
    outerLoop1:

           cmp cl,4
           je EXIT
           mov bl,0

    innerLoop1:
               
                
                cmp bl, 4
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
