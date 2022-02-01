;Get the position of mouse cursor in x and y co-ordinates.

.MODEL SMALL
.STACK 100H
.DATA

    msg1 db 'mouse cursor at: ','$';
    msg2 db ',','$';
    msg3 db 'Press p to display mouse cursor location ','$';
    xpos dw ?
    ypos dw ?
    var dw 0;
    rem db 0;
    quo db 0;
    count db 0;

.CODE

    main proc

        mov ax,@DATA
        mov ds,ax


        mov ah,00h
        mov al,12h
        int 10h

        call showMouse

        mov ax,4
        mov cx,100 
        mov dx,100
        int 33h

        
        mov dx,offset msg1;
        mov ah,09h
        int 21h

        mov ax,3
        mov var,cx
        mov ypos,dx
        int 33h

        mov ah,01
        int 21h

        cmp al,'p'
        je found
        jmp exit

    found:

        call endlineOutput

        mov dx,offset msg1;
        mov ah,09h
        int 21h

        call doublePrint

        mov dx,offset msg2;
        mov ah,09h
        int 21h

        mov bx,ypos
        mov var,bx

        call doublePrint

    exit:
    
        call ending
        
    main endp

    doublePrint proc

        OUTPUT:
            mov ax,var
        OUTPUTCALC:
            cmp ax,0
            je PRINT
            mov bl,10
            div bl
            mov rem,ah
            mov quo,al
            mov cl,rem
            mov ch,0

            add cl,48
            push cx
            mov al,quo
            mov ah,0
            inc count
            jmp OUTPUTCALC
        PRINT:
            cmp count,0
            je EXIT
            pop dx
            mov ah,02h
            int 21h
            dec count
            jmp PRINT
        EXIT:
            ret

    doublePrint endp

    delay proc
        mov ax,0
        .while(ax<0FFFFh)
            inc ax
        .endw
    delay endp

    showMouse proc
        mov ax,1
        int 33h
        ret
    showMouse endp

    hideMouse proc
        mov ax,0
        int 33h
        ret
    hideMouse endp


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

