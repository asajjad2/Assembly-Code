.model small

.stack 100h

.data
	
.code

	mov ax,@DATA
	mov ds,ax

	mov si,0
    mov ax,0
    mov bx,0
    mov cx,0
	outerLoop:

           cmp al,3
           jg done
           mov bl,al

    innerLoop:
               
                
                cmp bl, 8
                jg innerLoopDone
                mov cl,bl

                innerinnerLoop:
                    
                    cmp cl,al
                    jl innerinnerLoopDone

                        inc si;
                        dec cl
                        jmp innerinnerLoop

                innerinnerLoopDone:

                    add bl,2
                    jmp innerLoop

    innerLoopDone:

                inc al
                jmp outerLoop
    done:
	
        mov dx,si
        add dl,48
        mov ah,02h
        int 21h

	EXIT:
		mov ah,4ch
		int 21h

end
	