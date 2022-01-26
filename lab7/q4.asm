;Take a 4x4 matrix from user and display the sum of diagonal.

.model small

.stack 0100h

.data

 

.code

arr db  16 dup (0)
sum db 0
rem db 0

main proc

 

mov si,offset arr



mov cx,4

Label1:

mov bl,0

    Label2:

        mov ah,01h     
        int 21h
        sub al,48
        mov arr[si],al   

       

        inc si

        inc bl
        cmp bl,4
        jne Label2

 

 

    mov dl,10
    mov ah,02h 
    int 21h

 

loop Label1

 
    mov dl,10
    mov ah,02h
    int 21h

 



mov cx,0
mov bx,0                  
mov cx,3
mov si,0

 

mov al,arr[si]
add sum,al
mov al,arr[si+5]
add sum,al
mov al,arr[si+10]
add sum,al
mov al,arr[si+15]
add sum,al


    mov ah,00
    mov al,sum
    mov bl,10

    div bl


    mov rem,ah
    mov dl,al
    add dl,48
    mov ah,02h
    int 21h

    mov dl,rem
    add dl,48
    mov ah,02h
    int 21h

mov ah,4ch

int 21h

 

main endp

end main
