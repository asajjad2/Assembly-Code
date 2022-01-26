;Write a Procedure which takes 5 numbers as argument. Calculate sum of numbers
;and return their sum. Prints the sum in main procedure. You have to use Stack for
;Passing and Retrieving Arguments.

.MODEL SMALL
.STACK 100H
.DATA

arr dw 5 dup(?)
count db 5

.CODE

main proc

    mov ax,@data
    mov ds,ax

    mov si,offset arr
    call input

    mov count,5
    mov si,offset arr
    ll:
    cmp count,0
    je ll1
    mov bx,[si]
    add si,2
    push bx
    dec count
    jmp ll

ll1:

    call sumf
    pop ax
    call print


    MOV AH,4CH
    INT 21h 

main endp

input proc

    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0

label1:

    mov ah,1
    int 21h
    cmp al,13
    je label2
    sub al,48
    mov bh,0
    mov bl,al
    mov ax,cx
    mov dx,10
    mul dx
    add ax,bx
    mov cx,ax
    jmp l0

label2:
    mov [si],cx
    add si,2
    mov cx,0
    dec count
    cmp count,0
    jne label1


ret
input endp



print proc

label3:

    cmp ax,0
    je label4
    mov dx,0
    mov bx,10
    div bx
    push dx
    inc cx
    jmp put

label4:

    cmp cx,0
    je exit
    pop bx
    mov dx,bx
    add dx,48
    mov ah,2
    int 21h
    dec cx
    jmp label3

exit:

ret
print endp

sumf proc

    pop si

    mov ax,0
    mov cx,5

    label0:
    cmp cx,0
    je exit

    pop bx

    add ax,bx
    dec cx
    jmp label0

    exit:

    push ax
    push si

ret
sumf endp

END
