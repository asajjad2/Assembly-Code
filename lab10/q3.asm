;Square


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

    pax dw 50
    pay dw 50
    pbx dw 100
    pby dw 50
    pcx dw 100
    pcy dw 100
    pdx dw 50
    pdy dw 100


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

        call DrawSquare

        call ending

    main endp

    DrawSquare proc

        mov cx,pax
        mov dx,pay

        drawab:

            int 10h
            inc cx
            cmp cx,pbx
            jnz drawab

        mov cx,pbx
        mov dx,pby

        drawbc:

            int 10h
            inc dx
            cmp dx,pcy
            jnz drawbc

        mov cx,pcx
        mov dx,pcy

        drawcd:

            int 10h
            dec cx
            cmp cx,pdx
            jnz drawcd

        mov cx,pdx
        mov dx,pdy

        drawad:

            int 10h
            dec dx
            cmp dx,pay
            jnz drawad

    DrawSquare endp

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

