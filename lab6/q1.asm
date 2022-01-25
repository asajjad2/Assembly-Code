;Take 5 multi digit inputs from user and store in an array. Print the smallest and largest
;number of that array and display the index value at which those numbers are placed.

.MODEL SMALL
.STACK 100H
.DATA
msg1 db &quot;smallest:&quot;,&#39;$&#39;
msg2 db &quot;largest:&quot;,&#39;$&#39;
msg3 db &quot;at Index:&quot;,&#39;$&#39;
arr db 5 dup(?)
var db 0
small db 0
large db 0
.CODE
    MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    mov si,0
    mov cx,5
Input:
    mov ah,01
    int 21h
    cmp al,13
    je nextNumber
    sub al,48
    mov var,al
    mov al,arr[si]
    mov bl,10
    mul bl
    add al,var
    mov arr[si], al
    JMP Input
nextNumber:
    inc si
    loop Input
    mov si,0
    mov bl,arr[si]
    mov small,bl
    mov cx,5

findingSmallest:
    inc si
    mov bl,arr[si]
    cmp bl,small
    jb foundSmaller
    loop findingSmallest
foundSmaller:
    mov small,bl
    mov dl,'0';
    mov dh,0
    mov ah,02h
    int 21h
    loop findingSmallest
    mov si,0
    mov bl,arr[si]
    mov large,bl
    mov cx,5
findingLargest:
    inc si
    mov bl,arr[si]
    cmp bl,large
    jae foundLarger
    loop findingLargest
foundLarger:
    mov large,bl
    mov dl,'0';
    mov dh,0
    mov ah,02h
    int 21h
    loop findingLargest
OUTPUT:
    mov ax,var
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
    mov ah,4ch
    int 21H

MAIN ENDP
end main