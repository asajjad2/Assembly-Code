;Set the mouse cursor on specific co-ordinates on the screen.

.MODEL SMALL
.STACK 100H
.DATA

    msg1 db 'moving mouse cursor at 100,150 if you press enter ','$';
    msg2 db 'Mouse not available ','$';
    msg3 db 'Number of buttons: ','$';
    num dw ?

.CODE

    main proc

        mov ax,@DATA
        mov ds,ax


        mov ah,00h
        mov al,12h
        int 10h

        call showMouse
        
        mov dx,offset msg1;
        mov ah,09h
        int 21h

        mov ah,01
        int 21h

        cmp al,'p'
        je found
        jmp exit

    found:

        mov ax,4
        mov cx,100 
        mov dx,150 
        int 33h

        


    exit:
    
        call ending
        
    main endp

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
