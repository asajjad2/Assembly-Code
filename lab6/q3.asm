;Initialize the array as Array = [65, 66, 67, 68, 69, 70]. Print the output of array in the
;form of numbers (e.g., the output should be 65, 66, 67, 68, 69, 70). And print the
;output of array in the form of characters (e.g., A, B, C, D, E)

.MODEL SMALL
.STACK 100H
.DATA
arr1 db 65,66,67,68,69,70
rem db 0
quot db 0
.CODE
mov ax,@data

mov ds,ax
mov si,0
L1:
    cmp si,6
    je rand
    mov ah,0
    mov al,arr1[si]
    mov bl,10
    div bl

    mov rem,al
    mov quot,ah
    add rem,48
    add quot,48
    mov dl,rem
    mov ah,02h
    int 21h
    mov dl,quot
    mov ah,02h
    int 21h
    mov dl,10
    mov ah,02h
    int 21h
    inc si
    jmp L1
rand:
    mov dl,10
    mov ah,02h
    int 21h
    mov si,0

L2:
    cmp si,6
    je exit
    mov dl,arr1[si]
    mov ah,02h
    int 21h
    mov dl,10
    mov ah,02h
    int 21h
    inc si
    jmp L2
    exit:
    MOV AH,4CH
    INT 21h ; return 0

End