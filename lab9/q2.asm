;Write a program that declares a structure and stores the information of a shopper at a
;supermarket.
;Shopper’s name: xyz
;Shopper’s ID: 1234
;Shopper’s total bill: 5000
;Shopper’s total items: 10
;Shopper’s discount percentage: 10

.MODEL SMALL
.STACK 100H

    Shopper STRUCT

        name byte 20 DUP(0)
        ID word ?
        Bill word ?
        Items word ?
        DP word ?

    Shopper ENDS

.DATA

    msg1 db 'Shoppers name: ','$'
    msg2 db 'Shoppers ID: ','$'
    msg3 db 'Shoppers total bill: ','$'
    msg4 db 'Shoppers total items: ','$'
    msg5 db 'Shoppers discount percentage: ','$'
    msg6 db 'Input name ','$'
    msg7 db 'Input ID ','$'
    msg8 db 'Input total bill ','$'
    msg9 db 'Input total items ','$'
    msg10 db 'Input discount Percentage ','$'


    s1 Shopper <>

    rem db ?
    quo db ?
    count db 0



.CODE

    
    main proc

        mov ax,@DATA
        mov ds,ax

    
        mov dx,offset msg7;
        mov ah,09h
        int 21h

        call endlineOutput

        mov si,offset s1.ID
        call multiDigitInput

        mov dx,offset msg2;
        mov ah,09h
        int 21h

        call multiDigitOutput
        call endlineOutput

        mov dx,offset msg8;
        mov ah,09h
        int 21h

        call endlineOutput

        mov si,offset s1.Bill
        call multiDigitInput

        mov dx,offset msg3;
        mov ah,09h
        int 21h

        call multiDigitOutput
        call endlineOutput

        mov dx,offset msg9;
        mov ah,09h
        int 21h

        call endlineOutput

        mov si,offset s1.Items
        call multiDigitInput

        mov dx,offset msg4;
        mov ah,09h
        int 21h

        call multiDigitOutput
        call endlineOutput

        mov dx,offset msg10;
        mov ah,09h
        int 21h

        call endlineOutput

        mov si,offset s1.dp
        call multiDigitInput

        mov dx,offset msg5;
        mov ah,09h
        int 21h

        call multiDigitOutput
        call endlineOutput

        call ending

    main endp

    multiDigitOutput proc


    OUTPUT:
        mov ax,[si]

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

    multiDigitOutput endp

    multiInput proc
        
    
    INPUT:

        mov ah,01h
        int 21h
        cmp al,13
        je EXIT
        mov cl,al
        mov ax,[si]
        mov bl,10
        mul bl
        mov ch,0
        add ax,cx
        mov [si],ax
        jmp INPUT

    EXIT:

        ret

    multiInput endp

    multiDigitInput proc

    INPUT:

        mov ah,01h
        int 21h
        cmp al,13
        je Exit
        sub al,48
        mov cl,al
        mov ax,[si]
        mov bl,10
        mul bl
        mov ch,0
        add ax,cx
        mov [si],ax
        jmp INPUT

    Exit:

        ret

    multiDigitInput endp

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
