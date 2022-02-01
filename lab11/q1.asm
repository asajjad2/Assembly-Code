;Use mouse interfacing interrupt to:
;a. Find the status of the mouse and display the number of buttons of the mouse.

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

        mov ax,0
        int 33h

        cmp ax,0
        je MouseNotAvailable

        mov dx,offset msg1;
        mov ah,09h
        int 21h

        call endlineOutput

        mov dx,offset msg3;
        mov ah,09h
        int 21h

        mov dx,bx
        call printNum

        jmp exit

    MouseNotAvailable:

        mov dx,offset msg2;
        mov ah,09h
        int 21h

    exit:
    
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
