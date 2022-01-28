;Write a macro that takes two arguments from user i.e., the first number and the last
;number and the macro when called prints even/odd numbers starting from the first
;number (entered by the user) till the last number.

mPrintEvenOdd MACRO num1, num2

    mov ch,num2
    mov cl,num1
    sub ch,cl

    mov counter,ch

    mov dx,offset msg3;
    mov ah,09h
    int 21h

    call endlineOutput

    call printEven
    call endlineOutput

    mov ch,num2
    mov cl,num1
    sub ch,cl

    mov counter,ch

    mov dx,offset msg4;
    mov ah,09h
    int 21h

    call endlineOutput

    call printOdd


ENDM


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

        mov dx,offset msg1;
        mov ah,09h
        int 21h

        mov ah,01h
        int 21h
        sub al,48
        mov numA,al

        call endlineOutput

        mov dx,offset msg2;
        mov ah,09h
        int 21h

        mov ah,01h
        int 21h
        sub al,48
        mov numB,al

        call endlineOutput

        mPrintEvenOdd numA,numB



        call ending

    main endp

    printOdd proc

        comparison:

            cmp counter,0
            je exit
            dec counter
            mov al,cl
            mov ah,0
            mov bl,2
            div bl
            mov rem,ah
            cmp rem,0
            je printEq
            inc cl
            jmp comparison

        printEq:

            mov dl,cl
            add dl,49
            mov ah,02h
            int 21h
            inc cl
            jmp comparison

        exit:
            
            ret

    printOdd endp

    printEven proc

        comparison:

            cmp counter,0
            je exit
            dec counter
            mov al,cl
            mov ah,0
            mov bl,2
            div bl
            mov rem,ah
            cmp rem,0
            je printEq
            inc cl
            jmp comparison

        printEq:

            mov dl,cl
            add dl,48
            mov ah,02h
            int 21h
            inc cl
            jmp comparison

        exit:
            
            ret

    printEven endp

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
