;Draw a single pixel on the screen. The pixel should be in the center of the screen.

.MODEL SMALL
.STACK 100H

.DATA

    msg1 db 'Input first number ','$'
    msg2 db 'Input second number ','$'
    msg3 db 'Evens: ','$'
    msg4 db 'Odds: ','$'
    
    numA db ?
    numB db ?
    counter db ?
    rem db ?

.CODE

    
    main proc

        mov ax,@DATA
        mov ds,ax

        mov ah,00h 
        mov al,13
        int 10h

        mov ah,0ch
        mov al,02h

        mov bx,0
        mov cx,159
        mov dx,99

        int 10h




        call ending

    main endp



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
