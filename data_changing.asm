IDEAL
STUDENT_NAME equ "Elis Troyanovsky$"
 
MODEL small


public  aTom1
public  ZeroToNine2
public  ZeroToNine3
public  Array4 
public  BufferFromEx5
public  BufferToEx5
public  BufferFrom6 
public  BufferTo6
public  BufferTo6Len
public  MyLine7
public  Line7Length
public  MyWords7 
public  MyWords7Length 
public  MyQ8
public  MySum8  
public  MySet9  
public  Count1
public  Count2
public  Count3
public  Num10  
public  BinaryStr10  
public  EndGates11 
public  Gate78 
public  Num12A 
public  Num12B 
public  StrNum13 
public  WordNum13 
public  Num14Word 
public  StrWord14 


public  ShowAxDecimal
public  ex1      
public  ex2      
public  ex3      
public  ex4      
public  ex5      
public  ex6      
public  ex7a     
public  ex7b     
public  ex8      
public  ex9      
public  ex10     
public  ex11     
public  ex12     
public  ex13     
public  ex14c 

stack 256
DATASEG

		;exercise 1
		aTom1 db 13 dup(?), '$'

		;exercise 2
		ZeroToNine2 db 10 dup(?), '$'

		;exercise 3
		ZeroToNine3 db 10 dup(?), '$'
		
		;exercise 4
		Array4 db 100 dup(?), '$'
		
		;exercise 5
		BufferFromEx5 db 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, '$'
		BufferToEx5 db 10 dup(?), '$'

		;exercise 6
		BufferFrom6 db 15, -5, 100, 0, 2, 50, -20, 13, 14, -100
					db 30, 8, -2, 120, 5, -50, 40, 6, 11, -10
					db 25, -120, 1, 0, 99, -99, 127, -128, 10, 13
					db 60, -60, 4, 3, 18, 19, -8, -15, 7, 70
					db -70, 80, 9, -9, 21, 35, -35, 10, 11, -1, '$'
					
		BufferTo6 db 50 dup(?), '$'
		BufferTo6Len db  0, '$'
		
		;exercise 7
		MyLine7 db 95, 35, 130, 48, 22, 54, -20, 33, 14, -32
				db 30, 8, -2, 123, 5, 40, 6, 11, 0dh, '$'
		Line7Length db ?, '$'

		;exercise 7b
		MyWords7 dw 100h, 200h, 300h, 400h, 500h, 600h, 700h, 800h, 900h, 0A00h, 0B00h, 0C00h, 0DDDDh, '$'
		MyWords7Length db ?, '$'
		
		
		;exercise 8
		MyQ8   db 101, 130,30,201, 120, -3,100,255,0, '$'
		MySum8 dw ?, '$'
		
		;exercise 9
		MySet9 dw  100, -10, 0, 50, -100, 0, 1, 200, -2, 0, 15,0FFFFh, '$'
		Count1 db 0, '$'
		Count2 db 0, '$'
		Count3 db 0, '$'
		
		;exercise 10
		Num10 db 0FAh, '$'
		BinaryStr10 db 9 dup(?), '$'
		
		;exercise 11
		EndGates11 db 0AFh, '$' 
		Gate78   db ?, '$'
		
		True11 db "both 7&8 are 1 ",'$'
		False11 db "at least one of the bits 7,8 is 0",'$'
		
		;exercise 12
		Num12A db 70, '$'
		Num12B db ?, '$'
		
		
		;exercise 13
		StrNum13   db "38534!"
		StringOfNumsLen = ($ - StrNum13)
		WordNum13  dw ?, '$'
		 
		
		;exercise 14
		Num14Word   dw ?
	 
		StrWord14   db ?,?,?,?, '$'
		

CODESEG


start:
		mov ax, @data
		mov ds,ax


		 

		

		call ex1
	 
		call ex2
		
	 
		call ex3
	 
		call ex4
		
		
	 
		call ex5
		
	 
		call ex6
		
		 
	 
		call ex7a
		
		call ex7b
		
		call ex8
		mov ax, [word ptr MySum8]
		
		call ShowAxDecimal
	
		
		call ex9
	 
		call ex10
	 
		call ex11
	 
		call ex12
	 
		call ex13
	 
	 
		mov [Num14Word], 0F70Ch  
 		call ex14c     ; this will call to ex14b and ex14a
		
		
		
		call TTTTTttttttTTT
	 

exit:
		mov ax, 04C00h
		int 21h

		
	 

		
;------------------------------------------------
;------------------------------------------------
;-- End of Main Program ... Start of Procedures 
;------------------------------------------------
;------------------------------------------------




;================================================
; Description -  Move 'a' 'm'  to global var aTom1  
; INPUT: None
; OUTPUT: 
; Register Usage: ; only if value might be changed
;================================================
proc ex1
    push ax 
	push bx
	push cx

		mov al, 'a'
		mov bx, offset aTom1
		mov [bx], al
		mov cx, 12
	copy_to_data:
		inc al
		inc bx
		mov [bx], al
		loop copy_to_data
	
	
	
@@ret:
	pop cx
	pop bx
	pop ax
    ret
endp ex1





;================================================
; Description - Stores ASCII characters '0' to '9' in variable ZeroToNine2
; INPUT: -
; OUTPUT: ZeroToNine2 (Memory) - filled with '0'..'9'
; Register Usage: -
;================================================
proc ex2
	push ax 
	push bx
	push cx
		mov al, '0'
		mov bx, offset ZeroToNine2
		mov [bx], al
		mov cx, 9
	copy_nums_to_data:
		inc al
		inc bx
		mov [bx], al
		loop copy_nums_to_data
 

@@ret:
	pop cx
	pop bx
	pop ax
    ret
endp ex2





;================================================
; Description - Stores numeric values 0 to 9 in variable ZeroToNine3
; INPUT: -
; OUTPUT: ZeroToNine3 (Memory) - filled with byte values 0..9
; Register Usage: -
;================================================
proc ex3
	push ax 
	push bx
	push cx
		mov al, 0
		mov bx, offset ZeroToNine3
		mov [bx], al
		mov cx, 9
	copy_nums_to_data2:
		inc al
		inc bx
		mov [bx], al
		loop copy_nums_to_data2

@@ret:
	pop cx
	pop bx
	pop ax
    ret
endp ex3





;================================================
; Description - Fills byte 0CCh in Array4 if address is odd or divisible by 7
; INPUT: -
; OUTPUT: Array4 - (Memory) modified
; Register Usage: -
;================================================
proc ex4
    push ax 
    push bx
    push cx
    push dx
    push si 

    mov si, offset Array4
    mov bx, 7
    mov cx, 100

check_address:
    mov ax, si 
    

    test ax, 1      
    jnz save_loop
    
   
    xor dx, dx
    div bx
    cmp dx, 0
    je save_loop
    
    jmp go_loop

save_loop:
    mov [byte ptr si], 0CCh

go_loop:
    inc si
    loop check_address

@@ret:
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
endp ex4





;================================================
; Description - Copies 10 bytes from BufferFromEx5 to BufferToEx5
; INPUT: -
; OUTPUT: BufferToEx5 - (Memory) modified
; Register Usage: -
;================================================
proc ex5
	push ax 
	push bx
	push cx
	push dx
	push si
	
		mov si, offset BufferFromEx5
		mov bx, offset BufferToEx5
		mov cx, 10
	from_to_buffer:
		mov dl, [byte ptr ds:si]
		mov [byte ptr ds:bx], dl
		inc si
		inc bx
		loop from_to_buffer
 

@@ret:
	pop si
	pop dx
	pop cx
	pop bx
	pop ax
    ret
endp ex5





;================================================
; Description - Copies bytes > 12 from BufferFrom6 to BufferTo6 and stores the count in BufferTo6Len.
; INPUT: -
; OUTPUT: BufferTo6 , BufferTo6Len updated
; Register Usage: -
;================================================
proc ex6
	push ax 
	push bx
	push cx
	push dx
	push si
	
		mov si, offset BufferFrom6
		mov bx, offset BufferTo6
		mov dh, 0
		mov cx, 50
	from_to_buffer_test:
		mov dl, [byte ptr ds:si]
		cmp dl, 0Ch
		ja print_to_memory
		jmp next_loop
	print_to_memory:
		mov [byte ptr ds:bx], dl
		inc dh
		inc bx
	next_loop:
		inc si
		loop from_to_buffer_test
		mov[byte ptr ds:BufferTo6Len], dh
 
@@ret:
	pop si
    pop dx
	pop cx
	pop bx
	pop ax
    ret
endp ex6





;================================================
; Description - Calculates length of string ending with 0Dh
; INPUT: MyLine7
; OUTPUT: Line7Length updated
; Register Usage: -
;================================================
proc ex7a
	push ax 
	push bx
	push cx
	push si
	
		mov si, offset MyLine7
		xor bx, bx
		xor ax, ax
		
	compare_loop:
		mov bl, [byte ptr si]
		cmp bl, 0dh
		je exit_from_cmp
		
		inc al
		inc si
		jmp compare_loop
 
	exit_from_cmp:
	mov [byte ptr Line7Length], al

@@ret:
	pop si
	pop cx
	pop bx
	pop ax
    ret
endp ex7a





;================================================
; Description - Calculates length of word array ending with 0DDDDh
; INPUT: MyWords7
; OUTPUT: MyWords7Length (Memory)
; Register Usage: -
;================================================
proc ex7b
	push ax 
	push bx
	push cx
	push si

		mov si, offset MyWords7
		xor bx, bx
		xor ax, ax
		
	compare_loop_word:
		mov bx, [word ptr si]
		cmp bx, 0DDDDh
		je exit_from_cmp_word
		
		inc al
		add si, 2
		jmp compare_loop_word
 
	exit_from_cmp_word:
		mov [byte ptr MyWords7Length], al
 

@@ret:
	pop si
	pop cx
	pop bx
	pop ax
    ret
endp ex7b





;================================================
; Description - Sums signed bytes bigger than 100 from MyQ8 array
; INPUT: MyQ8
; OUTPUT: MySum8 (Memory)
; Register Usage: -
;================================================
proc ex8
	push ax 
	push bx
	push cx
	push si

		mov si, offset MyQ8
		xor bx, bx
		xor ax, ax
	compare_loop_sum:
		mov bl, [byte ptr si]
		cmp bl, 00h
		je exit_from_cmp_sum
		cmp bl, 100
		jle skip_add
		add ax, bx
	skip_add:
		inc si
		jmp compare_loop_sum
 
	exit_from_cmp_sum:
		mov [word ptr MySum8], ax

@@ret:
	pop si
	pop cx
	pop bx
	pop ax
    ret
endp ex8





;================================================
; Description - Counts Positive, Negative, and Zero values in MySet9
; INPUT: MySet9
; OUTPUT: Count1 (Pos), Count2 (Neg), Count3 (Zero)
; Register Usage: -
;================================================
proc ex9
	push ax 
	push bx
	push dx
	push cx
	push si
		
		mov si, offset MySet9
		xor bx, bx
		xor ax, ax
		xor dx, dx
		xor cx, cx
	compare_loop_word_count:
		mov bx, [word ptr si]
		cmp bx, 0FFFFh
		je exit_from_cmp_word_count
		
		cmp bx, 0
		jg add_pos
		jl add_neg
		je add_eq
		
	add_pos:
		inc al
		jmp back_loop

	add_neg:
		inc ah
		jmp back_loop
		
	add_eq:
		inc dl
		jmp back_loop

	back_loop:
		add si, 2
		jmp compare_loop_word_count
 
	exit_from_cmp_word_count:
		
		mov [byte ptr Count1], al
		mov [byte ptr Count2], ah
		mov [byte ptr Count3], dl
 
@@ret:
	pop si
	pop cx
	pop dx
	pop bx
	pop ax
    ret
endp ex9





;================================================
; Description - Convert Num10 to Binary String and print it on the screen
; INPUT: Num10
; OUTPUT: Output to screen
; Register Usage: -
;================================================
proc ex10
    push ax 
    push bx
    push cx
    push dx
    push si 
    
    mov cx, 8
    mov bl, [byte ptr Num10]
    mov si, offset BinaryStr10
    
loop_cary:
    shl bl, 1
    
    mov dl, '0'
    adc dl, 0
    
    mov [byte ptr si], dl
    inc si
    
    mov ah, 02h
    int 21h
    
    loop loop_cary
    
    mov dl, 'B'
    mov [byte ptr si], dl
    
    mov ah, 02h
    int 21h

@@ret:
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
endp ex10





;================================================
; Description - Checks if bits 7 and 8 of EndGates11 are 1. Sets Gate78 to 'T' or 'F' and prints message.
; INPUT: EndGates11
; OUTPUT: Gate78 (Memory), Screen output
; Register Usage: -
;================================================
proc ex11
	push ax 
	push bx
	push cx
	push dx
	
	
	xor ax, ax
	xor dx, dx
	mov al, [byte ptr EndGates11]
	
	shl al, 1
	adc dl, 0
	
	shl al, 1
	adc dl, 0
	
	cmp dl, 2
	je equal
	jne not_equal
	
equal:
	mov [byte ptr Gate78], 'T'
	mov dx, offset True11
	mov ah, 09h
	int 021h
	jmp end_printer



not_equal:
	mov [byte ptr Gate78], 'F'
	mov dx, offset False11
	mov ah, 09h
	int 021h
	jmp end_printer
	
 
end_printer:

@@ret:
	pop dx
	pop cx
	pop bx
	pop ax
    ret
endp ex11





;================================================
; Description - Checks if Num12A is between 10 and 70. If yes, copies it to Num12B.
; INPUT: Num12A
; OUTPUT: Num12B updated (if condition met)
; Register Usage: -
;================================================
proc ex12
	push ax 
	push bx
	push cx
	
	
	mov al, [byte ptr Num12A]
	cmp al, 10
	jb exit_frm_cmp
	cmp al, 70
	ja exit_frm_cmp
	mov [byte ptr Num12B], al
	
 
exit_frm_cmp:
@@ret:
	pop cx
	pop bx
	pop ax
    ret
endp ex12





;================================================
; Description - Converts string to Word value
; INPUT: StrNum13
; OUTPUT: WordNum13 - (Memory)
; Register Usage: -
;================================================
proc ex13
	push ax 
	push bx
	push cx
	push si
	push di
	push dx
	
	mov di, offset StrNum13
	xor bx, bx
	xor ax, ax
	xor cx, cx
	mov si, 10

mult_cycle:

	xor ax, ax
	mov al, [byte ptr di]
	cmp al, '!'
	je end_of_mult
	cmp al, ' '
	je skip_loop
	
	mov ax, cx
	mul si
	mov cx, ax
	xor ax, ax
	mov al, [byte ptr di]
	sub al, '0'
	add cx, ax
	
skip_loop:
	inc di
	jmp mult_cycle
	
end_of_mult:
	mov [word ptr WordNum13], cx

@@ret:
	pop dx
	pop di
	pop si
	pop cx
	pop bx
	pop ax
    ret
endp ex13





;================================================
; Description - Converts right 4 bits of AL to Hex Char and saves it in DL
; INPUT: AL
; OUTPUT: DL
; Register Usage: dx
;================================================
proc ex14a
	push ax 
	push bx
	push cx
	
	and al, 00Fh
	cmp al, 9
	jbe its_a_num
	add al, 'A' - 10
	jmp continue
	
its_a_num:
	add al, '0'

continue:
	mov dl, al
 

@@ret:
	pop cx
	pop bx
	pop ax
    ret
endp ex14a





;================================================
; Description - Converts Byte in AL to 2 Hex Chars in DH and DL
; INPUT: AL
; OUTPUT: Dx, DL
; Register Usage: dx
;================================================
proc ex14b
	push ax
	push cx
	push ax 
	
	shr al, 4 
    call ex14a
    mov dh, dl
    
   
    pop ax         
    and al, 0Fh
    call ex14a 
 

@@ret:
	pop cx
	pop ax
    ret
endp ex14b





;================================================
; Description - Converts Word in Num14Word to chars of Hex String in StrWord14
; INPUT: Num14Word
; OUTPUT: StrWord14 (Memory)
; Register Usage: -
;================================================
proc ex14c
	push ax 
	push bx
	push cx
	push dx
	
	mov ax, [Num14Word]
	push ax
    mov al, ah 
    call ex14b
    
    mov [byte ptr StrWord14], dh
    mov [byte ptr StrWord14+1], dl
    
    pop ax
    
    call ex14b
    
    mov [byte ptr StrWord14+2], dh
    mov [byte ptr StrWord14+3], dl
	
	
 

@@ret:
	pop dx
	pop cx
	pop bx
	pop ax
    ret
endp ex14c







;================================================
; Description: print bytes to the screen ax times
; INPUT: bx = pointer to the bytes , ax = how many bytes
; OUTPUT: screen
; Register Usage:  ax ,bx 
;================================================
proc printBytesAXTimes
	push cx
	push dx
	
	mov cx,ax
@@ag:
	mov dl, [bx]
	mov ah,2
	int 21h
	inc bx
	loop @@ag
	
	pop dx
	pop cx
	ret
endp printBytesAXTimes





; guess what this proc does ?
; without good names and lack of description, 
; no comments .... it is very difficult
;================================================
; Description -  Prints on the screen hexo of the number that is in ax
; INPUT: ax
; OUTPUT: Screen
; Register Usage: bx, dx, cx
;================================================
proc TTTTTttttttTTT
	
	mov bx,ax
	mov cx,4
CHChchchchc:
	
	mov dx,0f000h
	and dx,bx
	rol dx, 4          
	cmp dl, 9
	ja PPPFFFFpppfffff
	add dl, 48
	jmp ZzzzZzzZZZZ

PPPFFFFpppfffff:	 
	add dl, '7'

ZzzzZzzZZZZ:
	mov ah, 2
	int 33
	shl bx,4
	loop CHChchchchc
	
	ret
endp TTTTTttttttTTT





;================================================
; Description - Write on screen the value of ax (decimal)
;               the practice :  
;				Divide AX by 10 and put the Mod on stack 
;               Repeat Until AX smaller than 10 then print AX (MSB) 
;           	then pop from the stack all what we kept there and show it. 
; INPUT: AX
; OUTPUT: Screen 
; Register Usage:   
;================================================
proc ShowAxDecimal
	push ax
	push bx
	push cx
	push dx

	; check if negative
	test ax,08000h
	jz PositiveAx
		
	;  put '-' on the screen
	push ax
	mov dl,'-'
	mov ah,2
	int 21h
	pop ax

	neg ax ; make it positive
PositiveAx:
	mov cx,0   ; will count how many time we did push 
	mov bx,10  ; the divider

put_mode_to_stack:
	xor dx,dx
	div bx
	add dl,30h
	; dl is the current LSB digit 
	; we cant push only dl so we push all dx
	push dx    
	inc cx
	cmp ax,9   ; check if it is the last time to div
	jg put_mode_to_stack

	cmp ax,0
	jz pop_next  ; jump if ax was totally 0
	add al,30h  
	mov dl, al    
	mov ah, 2h
	int 21h        ; show first digit MSB
	   
pop_next: 
	pop ax    ; remove all rest LIFO (reverse) (MSB to LSB)
	mov dl, al
	mov ah, 2h
	int 21h        ; show all rest digits
	loop pop_next

	mov dl, ','
	mov ah, 2h
	int 21h

	pop dx
	pop cx
	pop bx
	pop ax

	ret
endp ShowAxDecimal

END start