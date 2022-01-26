;
;Take two multidigit inputs from user and display the sum of those numbers. You need
;to create separate procedures for taking inputs, for addition and for the display of sum.

.MODEL SMALL

.STACK 100H

.DATA

 

num word 2 dup(?)

count db 2

 

.CODE

 

main proc

 

mov ax,@data
mov ds,ax

 

 

mov si,offset num
call input

 

mov si,offset num
call addition

 

call print

 

 

MOV AH,4CH
INT 21h 

 

main endp

 

input proc

 

mov ax,0
mov bx,0
mov cx,0
mov dx,0

 

l0:

    mov ah,1
    int 21h
    cmp al,13
    je br
    sub al,48
    mov bh,0
    mov bl,al
    mov ax,cx
    mov dx,10
    mul dx
    add ax,bx
    mov cx,ax
    jmp l0

 

br:

    mov [si],cx
    add si,2
    mov cx,0
    dec count
    cmp count,0
    jne l0
    
 

ret

input endp

 

 

print proc

 

put:

    cmp ax,0
    je get
    mov dx,0
    mov bx,10
    div bx
    push dx
    inc cx
    jmp put

 

get:

    cmp cx,0
    je exit
    pop bx
    mov dx,bx
    add dx,48
    mov ah,2
    int 21h
    dec cx
    jmp get

exit:

 

ret
print endp

 

addition proc

    mov ax,[si]
    mov bx,[si+2]
    add ax,bx

ret
addition endp

 

END
