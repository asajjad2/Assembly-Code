;Program a calculator using nested procedures and macros (e.g., for input and output
;and wherever applicable). The calculator should perform all the basic arithmetic
;operations.

.MODEL SMALL
.STACK 100H
.DATA

    msg1 db 'Input first number: ','$'
    msg2 db 'Input second number: ','$'
    msg3 db 'Addition: ','$'
    msg4 db 'Subtraction: ','$'
    msg5 db 'Multiplication: ','$'
    msg6 db 'Division: ','$'

    num1 db ?
    num2 db ?

.CODE

    
    main proc

        mov ax,@DATA
        mov ds,ax

    
        mov dx,offset msg1;
        mov ah,09h
        int 21h

        call endlineOutput

        mov ah,01h
        int 21h
        sub al,48
        mov cl,al

        call endlineOutput

        mov dx,offset msg2;
        mov ah,09h
        int 21h

        call endlineOutput

        mov ah,01h
        int 21h
        sub al,48
        mov ch,al

        call endlineOutput

        call sum

        call ending

    main endp



    sum proc

        mov dx,offset msg3;
        mov ah,09h
        int 21h

        mov dl,cl
        add dl,ch

        call printNum
        call endlineOutput

        call subtract

        ret
        
    sum endp

    subtract proc

        mov dx,offset msg4;
        mov ah,09h
        int 21h

        mov dl,ch
        sub dl,cl

        call printNum
        call endlineOutput

        call multiply

        ret

    subtract endp

    multiply proc

        mov dx,offset msg5
        mov ah,09h
        int 21h

        mov al,cl
        mov bl,ch
        mul bl

        mov dl,al

        call printNum
        call endlineOutput

        call division

        ret

    multiply endp

    division proc

        mov dx,offset msg6
        mov ah,09h
        int 21h



        mov al,ch
        mov ah,0
        mov bl,cl
        div bl

        mov dl,al

        call printNum
        call endlineOutput

        ret

    division endp



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
