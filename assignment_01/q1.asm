;Take two multi digit numbers from user and display even/odd numbers in between
;that range. (e.g. user enters 10 and 20, output will be 10, 12, 14, 16, 18, 20 for even and 11, 13,
;15, 17, 19 for odd output)

.MODEL SMALL
.STACK 100H
.DATA
msg1 db &quot; is even&quot;,&#39;$&#39;;
msg2 db &quot; is odd&quot;,&#39;$&#39;;
msg3 db &quot; numbers in range&quot;,&#39;$&#39;;
arr db 2 dup(?)
var db 0
quo db 0
rem db 0
count db 0
small db 0
large db 0
.CODE
MAIN PROC

MOV AX, @DATA
MOV DS, AX
mov si,0
mov cx,2
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
mov bl,arr[0]
mov bh,arr[1]
sub bh,bl
mov cx,0
mov cl,bh ; cl is counter
mov dh,0
mov dl,cl
add dl,48
mov ah,02h
int 21h
mov dx,offset msg3;
mov ah,09h
int 21h
mov ch,-1

OuterLoop:
mov dl,10
mov ah,02h
int 21h
inc ch
cmp ch,cl
jg EXIT

mov dl,&#39;0&#39;
mov ah,02h
int 21h
mov ax,0
mov al,arr[0]
inc arr[0]
mov var,al
mov bx,0
mov bl,2
div bl
cmp ah,0
je L1
jmp L3
L1:
jmp OUTPUT1
L2: ;print even message
mov dx,offset msg1;
mov ah,09h
int 21h
jmp OuterLoop
L3:
jmp OUTPUT2
L4:;print odd message
mov dx,offset msg2;
mov ah,09h
int 21h
jmp OuterLoop
OUTPUT1:
mov al,var
mov ah,0
OUTPUTCALC1:
cmp ax,0
je PRINT1
mov bl,10
div bl
mov rem,ah
mov quo,al
mov dl,rem
mov dh,0
add dl,48
push dx
mov al,quo
mov ah,0
inc count
jmp OUTPUTCALC1

PRINT1:
cmp count,0
je L2
pop dx
mov ah,02h
int 21h
dec count
jmp PRINT1
OUTPUT2:
mov al,var
mov ah,0
OUTPUTCALC2:
cmp ax,0
je PRINT2
mov bl,10
div bl
mov rem,ah
mov quo,al
mov dl,rem
mov dh,0
add dl,48
push dx
mov al,quo
mov ah,0
inc count
jmp OUTPUTCALC2
PRINT2:
cmp count,0
je L4
pop dx
mov ah,02h
int 21h
dec count
jmp PRINT2

EXIT:
mov ah,4ch
int 21H
MAIN ENDP

end main
