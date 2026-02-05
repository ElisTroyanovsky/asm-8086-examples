IDEAL
MODEL small
STACK 100h

DATASEG
	dataTest db "AAAAAAAAAAAAAAAA"
	array1 db 10, -3, 127, 34, 50, 22, 0
	array2 db 10, -3, 127, 34, 50, 22, 0
	array3 db 10, -3, 127, 34, 50, 22, 0
	arrLen dw 7
	retAdress dw ?
CODESEG
start:
    mov ax, @data
    mov ds, ax
	
	;Insertion_Sort TEST
	push [arrLen] 
	push offset array1
	call Insertion_Sort
	
	mov cx, 7
	mov si, offset array1
my_loop1:
	mov al, [si]
	cbw
	call ShowAxDecimal
	inc si
	loop my_loop1
	
	mov dl, 10
	mov ah, 2h
	int 21h
	
	;Selection_Sort TEST
	push [arrLen] 
	push offset array2
	call Selection_Sort
	
	mov cx, 7
	mov si, offset array2
my_loop2:
	mov al, [si]
	cbw
	call ShowAxDecimal
	inc si
	loop my_loop2
	
	mov dl, 10
	mov ah, 2h
	int 21h
	
	;Bubble_sort TEST
	push [arrLen] 
	push offset array3
	call Bubble_sort
	
	mov cx, 7
	mov si, offset array3
my_loop3:
	mov al, [si]
	cbw
	call ShowAxDecimal
	inc si
	loop my_loop3

    mov ax, 4c00h
    int 21h
	
;================================================
; Description - Finds address of the minimum element in a sub-array
; INPUT: Stack [bp+8] = Start Index, [bp+6] = Array Length, [bp+4] = Array Offset
; OUTPUT: Stack [bp+8] - Address (offset) of min element (replaces Start Index)
; Register Usage: All registers preserved (Push/Pop used)
;================================================
	proc find_min
		push bp
		mov bp, sp ;ret = +2
		
		push bx
		push si
		push cx
		push dx
		push ax
		push di
		
		mov si, [bp+4] 
		mov cx, [bp+6]
		mov bx, [bp+8]
		
		add si, bx
		sub cx, bx
		
		mov di, si
		
		mov al, [di]
		cbw
		mov dx, ax
		
		inc si
		dec cx
		jz one_elementt
		
search_loop:
		mov al, [si]
		cbw
		cmp ax, dx
		jge not_smaller
		
		mov di, si ;element smaller
		mov dx, ax
		
not_smaller:
		inc si
		loop search_loop
		
one_elementt:
		mov [bp+8], di
	@@ret:
		pop di
		pop ax
		pop dx
		pop cx
		pop si
		pop bx
		pop bp
		ret 4
	endp find_min
	
	
	
	
;================================================
; Description - Swaps two bytes in memory given their addresses
; INPUT: Stack [bp+6] = Address of 1st byte, Stack [bp+4] = Address of 2nd byte
; OUTPUT: Memory at given addresses is modified
; Register Usage: All registers preserved
;================================================
	proc Swap
		push bp
		mov  bp, sp
		push ax
		push bx
		push si
		push di

		mov  si, [bp+4]
		mov  di, [bp+6]     

		mov  al, [si]
		mov  bl, [di]
		mov  [si], bl
		mov  [di], al
		
		pop di
		pop si
		pop bx
		pop ax
		pop bp
		ret 4
	endp Swap






;================================================
; Description - Sorts the array using Selection Sort algorithm
; INPUT: Stack [bp+6] = Array Length, Stack [bp+4] = Array Offset
; OUTPUT: Array in memory is modified (sorted ascending)
; Register Usage: All registers preserved
;================================================
	proc Selection_Sort
		push bp
		mov bp, sp ;ret = +2
		push si
		push cx
		push dx
		push ax
		push di
		push bx
		
		mov si, [bp+4] 
		mov cx, [bp+6]
		mov dx, cx
		xor bx, bx
		mov di, si
		mov ax, cx
		dec cx
		jz one_elem
		
sort_loop:
		mov si, di
		push bx
		push ax
		push si
		call find_min
		
		add si, bx
		push si
		call Swap
		
		inc bx
		loop sort_loop
one_elem:
	@@ret:
		pop bx
		pop di
		pop ax
		pop dx
		pop cx
		pop si
		pop bp
		ret
	endp Selection_Sort
	
	
	
	
	
;================================================
; Description - Sorts the array using Insertion Sort algorithm
; INPUT: Stack [bp+6] = Array Length, Stack [bp+4] = Array Offset
; OUTPUT: Array in memory is modified (sorted ascending)
; Register Usage: All registers preserved
;================================================
	proc Insertion_Sort
		push bp
		mov bp, sp ;ret = +2
		push si
		push cx
		push dx
		push ax
		push di
		push bx
		
		mov di, [bp+4] 
		mov cx, [bp+6]
		dec cx
		jz one_eleme
		mov bx, 1
		push bx
Insort_loop:
		mov si, di
		add si, bx 
		
		mov al, [si]
		cbw
		mov dx, ax
		
		dec si
		mov al, [si]
		cbw
		
		cmp ax, dx
		jng right_place
		
		push si
		inc si
		push si
		call Swap
		
		dec bx
		jnz Insort_loop
		
right_place:
		pop bx
		inc bx
		push bx
		loop Insort_loop
one_eleme:
		pop bx
	@@ret:
		pop bx
		pop di
		pop ax
		pop dx
		pop cx
		pop si
		pop bp
		ret
	endp Insertion_Sort
	
	
	
;================================================
; Description - Sorts the array using Bubble Sort algorithm
; INPUT: Stack [bp+6] = Array Length, Stack [bp+4] = Array Offset
; OUTPUT: Array in memory is modified (sorted ascending)
; Register Usage: All registers preserved
;================================================
	proc Bubble_sort
		push bp
		mov bp, sp ;ret = +2
		push si
		push cx
		push dx
		push ax
		push di
		push bx
		
		
		
		mov cx, [bp+6]
		dec cx
		mov bx, cx
	

check_loop:
		mov si, [bp+4]
		mov cx, bx
bubble:

		mov di, si
		inc di
	
		mov al, [si]
		cbw
		mov dx, ax
		mov al, [si + 1]
		cbw
		cmp dx, ax
		jng no_swap
	
		push cx
	
		push di
		push si
	
		call Swap
	
		pop cx
	
no_swap:
		inc si
		loop bubble
	
		dec bx
		cmp bx, 0
		jne check_loop
		
		
	@@ret:
		pop bx
		pop di
		pop ax
		pop dx
		pop cx
		pop si
		pop bp
		ret
	endp Bubble_sort



;================================================
; Description - Prints the value of AX to console as signed decimal
; INPUT: AX - Value to print
; OUTPUT: Console output (Standard Output)
; Register Usage: All registers preserved (AX is restored at the end)
;================================================
	proc ShowAxDecimal
       push ax
	   push bx
	   push cx
	   push dx
	   ;jmp PositiveAx
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
	   ;tumtumtumsahur
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
	   ;kkk
	   
	   ret
endp ShowAxDecimal

END start