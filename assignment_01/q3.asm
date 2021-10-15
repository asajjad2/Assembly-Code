;Take three multi digit numbers from user and display the maximum and minimum number.

.MODEL SMALL
.STACK 100H
.DATA
msg1 db &quot;Input 3 multi digit numbers&quot;,&#39;$&#39;;
msg2 db &quot;Greatest: &quot;,&#39;$&#39;;
msg3 db &quot;Smallest: &quot;,&#39;$&#39;;
arr db 3 dup(?)
obtained db 5 dup(?)
var db 0
quo db 0
rem db 0
count db 0
largest db 0
smallest db 0
.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX
mov dx,offset msg1;
mov ah,09h
int 21h
mov dl,10
mov ah,02h
int 21h

mov si,0
mov cx,3
InputTotals:
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
JMP InputTotals
nextNumber:
inc si
loop InputTotals
figureGreatest:
mov al,arr[0]
mov ah,arr[1]
cmp al,ah
jg L1;if A&gt;B
jmp L2;if A&lt;B
L1:
mov al,arr[0]
mov ah,arr[2]
cmp al,ah
jg L3;if A&gt;B &amp;&amp; A&gt;C
jmp L4;if A&gt;B &amp;&amp; A&lt;C
L2:
mov al,arr[1]
mov ah,arr[2]
cmp al,ah
jg L5;if B&gt;A &amp;&amp; B&gt;C
jmp L4;if B&gt;A &amp;&amp; B&lt;C
L3:
mov al,arr[0]
mov largest,al
jmp figrueSmallest
L4:
mov al,arr[2]

mov largest,al
jmp figrueSmallest
L5:
mov al,arr[1]
mov largest,al
jmp figrueSmallest
figrueSmallest:
mov al,arr[0]
mov ah,arr[1]
cmp al,ah
jl L6;if A&lt;B
jmp L7;if A&gt;B
L6:
mov al,arr[0]
mov ah,arr[2]
cmp al,ah
jl L8;if A&lt;B &amp;&amp; A&lt;C - a smallest
jmp L9;if A&lt;B &amp;&amp; A&gt;C - c smallest
L7:
mov al,arr[1]
mov ah,arr[2]
cmp al,ah
jl L10;if B&lt;A &amp;&amp; B&lt;C
jmp L9;if B&lt;A &amp;&amp; B&gt;C
L8:
mov al,arr[0]
mov smallest,al
jmp display
L9:
mov al,arr[2]
mov smallest,al
jmp display
L10:
mov al,arr[1]
mov smallest,al
jmp display
display:
mov dx,offset msg2;
mov ah,09h

int 21h
;print largest
OUTPUT1:
mov al,largest
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
je OUTPUT2
pop dx
mov ah,02h
int 21h
dec count
jmp PRINT1
OUTPUT2:
mov dl,10
mov ah,02h
int 21h
mov dx,offset msg3
mov ah,09h
int 21h
mov al,smallest
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
je EXIT
pop dx
mov ah,02h
int 21h
dec count
jmp PRINT2

EXIT:
mov dl,10
mov ah,02h
int 21h
mov ah,4ch
int 21H
MAIN ENDP
end main
