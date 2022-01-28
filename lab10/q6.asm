;Draw a border on the screen and write your name in the center of the screen.

.MODEL SMALL
.STACK 100H

.DATA

    msg1 db 'Areeb Sajjad ','$'

.CODE

    
    main proc

        mov ax,@DATA
        mov ds,ax

        mov ah,00h 
        mov al,13
        int 10h

        mov ah,0ch
        mov al,02h

        int 10h


        call DrawName

        call ending

    main endp

    DrawName proc

        mov ah,02h
        mov bx,0
        mov dh,10
        mov dl,15
        int 10h

        mov dx,offset msg1;
        mov ah,09h
        int 21h

    DrawName endp

    printNum proc

        add dl,48
        mov ah,02h
        int 21h

        ret

    printNum endp


    endlineOutput proc

        mov dl,10

        mov ah,02h
        int 21h

        ret

    endlineOutput endp

    ending proc

        mov ah,04ch
        int 21h

        ret

    ending endp

END main

