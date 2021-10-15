;Take total marks and obtained marks of a student for 5 subjects and calculate and
;display the total marks and percentage.

.MODEL SMALL
.STACK 100H
.DATA
msg1 db &quot;Total Marks: &quot;,&#39;$&#39;;
msg2 db &quot;Percentage: &quot;,&#39;$&#39;;
msg3 db &quot; %&quot;,&#39;$&#39;;
msg4 db &quot;Input total marks of all subjects:&quot;,&#39;$&#39;;
msg5 db &quot;Input obtained marks of all subjects:&quot;,&#39;$&#39;;
msg6 db &quot;Obtained Total: &quot;,&#39;$&#39;;
total db 5 dup(?)
obtained db 5 dup(?)
var db 0
quo db 0
rem db 0
count db 0
totalSum db 0
obtainedSum db 0
percent db 0
.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX

mov dx,offset msg4;
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

mov dx,offset msg5;
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h
mov si,0
mov cx,5

InputObtained:
mov ah,01
int 21h
cmp al,13
je nextNumber2
sub al,48
mov var,al
mov al,obtained[si]
mov bl,10
mul bl
add al,var
mov obtained[si], al
JMP InputObtained
nextNumber2:
inc si
loop InputObtained
mov cx,5
mov si,0
mov ax,0
SumObtained:
add al,obtained[si]
inc si
mov obtainedSum,al
loop SumObtained
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
je NEXT
pop dx
mov ah,02h
int 21h
dec count
jmp PRINT1
NEXT:
mov dl,10
mov ah,02h
int 21h
mov dx,offset msg6;
mov ah,09h
int 21h
;print obtained
OUTPUT2:
mov al,obtainedSum
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
je NEXT2
pop dx
mov ah,02h
int 21h
dec count
jmp PRINT2
NEXT2:
mov dl,10

mov ah,02h
int 21h
mov ax,0
mov al,obtainedSum
mov bl,100
mul bl
mov bl,totalSum
div bl
mov percent,al
mov dx,offset msg2;
mov ah,09h
int 21h
;print percentage
OUTPUT3:
mov al,percent
mov ah,0
OUTPUTCALC3:
cmp ax,0
je PRINT3
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
jmp OUTPUTCALC3
PRINT3:
cmp count,0
je EXIT
pop dx
mov ah,02h
int 21h
dec count
jmp PRINT3

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
