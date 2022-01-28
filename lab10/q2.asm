;Triangle

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

    pax dw 100
    pay dw 100
    pbx dw 150
    pby dw 50
    pcx dw 200
    pcy dw 100
    pdx dw 175
    pdy dw 150
    pex dw 125
    pey dw 150


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


        call DrawTri

        call ending

    main endp

    DrawTri proc

        mov cx,pax
        mov dx,pay

        drawab:

            int 10h
            inc cx
            dec dx
            cmp cx,pbx
            jnz drawab

        mov cx,pbx
        mov dx,pby

        drawbc:

            int 10h
            inc cx
            inc dx
            cmp cx,pcx
            jnz drawbc

        mov cx,pcx
        mov dx,pcy

        drawca:

            int 10h
            dec cx
            cmp cx,pax 
            jnz drawca

    DrawTri endp

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
