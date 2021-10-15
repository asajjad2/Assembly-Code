;A customer went for shopping and bought 5 different items. You need to take the
;prices of the items from user (in multiple digits) then add the prices of all the items and display
;the total bill of that customer.

.MODEL SMALL
.STACK 100H
.DATA
msg1 db &quot;Total Bill: &quot;,&#39;$&#39;;
msg2 db &quot;Please input the prices for your 5 items &quot;,&#39;$&#39;;
msg3 db &quot; dollars&quot;,&#39;$&#39;;
total db 5 dup(?)
obtained db 5 dup(?)
var db 0
quo db 0
rem db 0
count db 0
totalSum db 0
.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX
mov dx,offset msg2;
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h
mov si,0
mov cx,5
InputTotals:
mov ah,01
int 21h
cmp al,13
je nextNumber
sub al,48
mov var,al
mov al,total[si]
mov bl,10
mul bl

add al,var
mov total[si], al
JMP InputTotals
nextNumber:
inc si
loop InputTotals
mov cx,5
mov si,0
mov ax,0
SumTotal:
add al,total[si]
inc si
mov totalSum,al
loop SumTotal

mov dx,offset msg1;
mov ah,09h
int 21h

;print total
OUTPUT1:
mov al,totalSum
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
je EXIT
pop dx
mov ah,02h
int 21h
dec count
jmp PRINT1

EXIT:
mov dx,offset msg3;
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h
mov ah,4ch
int 21H
MAIN ENDP
end main
