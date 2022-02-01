;Use mouse interfacing interrupt to:
;b. Show and hide the mouse cursor on the console in video mode.

.MODEL SMALL
.STACK 100H
.DATA

    msg1 db 'Mouse available ','$';
    msg2 db 'Mouse not available ','$';
    msg3 db 'Number of buttons: ','$';
    num dw ?

.CODE

    main proc

        mov ax,@DATA
        mov ds,ax


        mov ah,00h
        mov al,13
        int 10h

        
            call showMouse
            call delay
            call hideMouse
            call delay
            call showMouse
            call delay
            call hideMouse
            call delay
            call showMouse
            call delay
            call hideMouse
            call delay
            call showMouse
            call delay
            call hideMouse
            call delay
            call showMouse
            call delay
            call hideMouse
            call delay
            call showMouse
            call delay
            call hideMouse
            call delay


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
