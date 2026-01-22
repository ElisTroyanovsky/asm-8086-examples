IDEAL
MODEL small
STACK 100h

DATASEG

CODESEG
start:
    mov ax, @data
    mov ds, ax
    mov ax, 0B800h
    mov es, ax
	




    
	mov di, (12*80 + 40) * 2
	mov al, '*'
    mov ah, 10011111b        
    mov [es:di], ax
enter_comand:

	test di, di
	jz   exit
	
	
	mov ah, 0h
	int 16h
	or al, 20h
	
checkUp:
    cmp al, 'w'
    jne checkDown
	mov ax, 0000h         
    mov [es:di], ax
	sub di, 0A0h
    jmp endInput

checkDown:
    cmp al, 's'
    jne checkLeft
	mov ax, 0000h         
    mov [es:di], ax
    add di, 0A0h
    jmp endInput

checkLeft:
    cmp al, 'a'
    jne checkRight
	mov ax, 0000h         
    mov [es:di], ax
    sub di, 2
    jmp endInput

checkRight:
    cmp al, 'd'
    jne endInput
	mov ax, 0000h         
    mov [es:di], ax
    add di, 2
    jmp endInput

endInput:
	mov al, '*'
    mov ah, 10011111b   
    mov [es:di], ax
	jmp enter_comand
	
	
	
exit:
    mov ax, 4C00h
    int 21h
END start