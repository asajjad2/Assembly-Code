;Take a 3x3 matrix from user and find maximum value is each row and minimum
;value in each column.

.model small

.stack 100h

.data

    mat db 9 dup(?)
    max db 3 dup(?)
    min db 3 dup(?)
    msg db "Enter 9 single digit values",'$'
    msg1 db "Max = ",'$'
    msg2 db "Min = ",'$'

 

.code

 

    mov ax,@data

    mov ds,ax

    

    mov dx,offset msg

    mov ah,09h

    int 21h

    

    mov dl,10

    mov ah,02

    int 21h

    

    mov cx,0

    mov si,offset mat

 

l1:

 

    mov ah,1

    int 21h

    

    sub al,48

    mov [si],al

    

    inc si

    inc cx

    

    cmp cx,9

    

    jl l1

    

    mov si,offset mat

    mov cx,0

    

    mov dl,10

    mov ah,2

    int 21h

    

    mov ax,0

    mov dx,0

    mov bx,0

 

l2:

 

    mov cl,0

    mov al,[si]

 

l3:

    cmp [si],al

    jle l0

    

    mov al,[si]

 

l0:

 

    inc si

    inc cl

 

    cmp cl,3

    jl l3

 

    mov max[bx],al

    inc bx

    

    inc ch

    cmp ch,3

    jl l2

 

    ;mov si,offset mat
    mov ax,0
    mov cx,0
    mov dx,0
    mov bx,0
 
l4:

 

    mov si,offset mat
    mov cl,0
    mov al,[si+bx]


l5:
    cmp [si+bx],al
    jge l6

    

    mov al,[si+bx]


l6:

 

    add si,4
    inc cl

    

    cmp cl,3
    jl l5

    

    mov min[bx],al
    inc bx

    

    inc ch
    cmp ch,3
    jl l4

    

    mov dx,offset msg1
    mov ah,09
    int 21h

    

    mov bx,0

 

l11:

 

    mov dl,max[bx]
    add dl,48
    mov ah,2
    int 21h

    
    mov dl,' '
    mov ah,2

    int 21h

    

    inc bx

    cmp bx,3

    jl l11

    

    mov dl,10

    mov ah,02

    int 21h

    

    mov dx,offset msg2

    mov ah,09

    int 21h

    

    mov bx,0

 

l12:

 

    mov dl,min[bx]

    add dl,48

    mov ah,2

    int 21h

    

    mov dl,' '

    mov ah,2

    int 21h

    

    inc bx
    cmp bx,3
    jl l12

    

    

    mov ah,4ch
    int 21h
    end

    
    
    mov ah,4ch
    int 21h
    end
