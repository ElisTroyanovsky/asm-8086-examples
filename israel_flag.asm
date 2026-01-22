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

    mov di, 160              
    mov cx, 24*80          
fill_white:
    mov al, ' '
    mov ah, 70h             
    mov [es:di], ax
    add di, 2
    loop fill_white


    mov di, (4*80 + 0) * 2
    mov cx, 3*80
top_stripe:
    mov al, ' '
    mov ah, 10h             
    mov [es:di], ax
    add di, 2
    loop top_stripe

    ; нижняя полоса
    mov di, (19*80 + 0) * 2
    mov cx, 3*80
bot_stripe:
    mov al, ' '
    mov ah, 10h             
    mov [es:di], ax
    add di, 2
    loop bot_stripe
	
	; star
	mov di, (7*80 + 40) * 2
	mov al, '*'
    mov ah, 01110001b         
    mov [es:di], ax
	
	mov di, (8*80 + 39) * 2
	mov al, '/'
    mov ah, 01110001b             
    mov [es:di], ax
	
	mov di, (8*80 + 41) * 2
	mov al, '\'
    mov ah, 01110001b          
    mov [es:di], ax
	
	mov di, (9*80 + 38) * 2
	mov al, '/'
    mov ah, 01110001b          
    mov [es:di], ax
	
	mov di, (9*80 + 42) * 2
	mov al, '\'
    mov ah, 01110001b          
    mov [es:di], ax
	
	
	mov di, (10*80 + 30) * 2
    mov cx, 21
starline:
    mov al, '-'
    mov ah, 01110001b    
    mov [es:di], ax
    add di, 2
    loop starline
	
	mov di, (11*80 + 31) * 2
	mov al, '\'
    mov ah, 01110001b            
    mov [es:di], ax
	
	mov di, (11*80 + 35) * 2
	mov al, '/'
    mov ah, 01110001b           
    mov [es:di], ax
	
	mov di, (11*80 + 46) * 2
	mov al, '\'
    mov ah, 01110001b           
    mov [es:di], ax
	
	mov di, (11*80 + 50) * 2
	mov al, '/'
    mov ah, 01110001b              
    mov [es:di], ax
	
	
	mov di, (12*80 + 33) * 2
	mov al, '*'
    mov ah, 01110001b        
    mov [es:di], ax
	
	mov di, (12*80 + 48) * 2
	mov al, '*'
    mov ah, 01110001b              
    mov [es:di], ax
	
	mov di, (13*80 + 31) * 2
	mov al, '/'
    mov ah, 01110001b             
    mov [es:di], ax
	
	mov di, (13*80 + 35) * 2
	mov al, '\'
    mov ah, 01110001b              
    mov [es:di], ax
	
	mov di, (13*80 + 46) * 2
	mov al, '/'
    mov ah, 01110001b              
    mov [es:di], ax
	
	mov di, (13*80 + 50) * 2
	mov al, '\'
    mov ah, 01110001b             
    mov [es:di], ax
	
	mov di, (14*80 + 30) * 2
    mov cx, 21
starline1:
    mov al, '-'
    mov ah, 01110001b              
    mov [es:di], ax
    add di, 2
    loop starline1
	
	mov di, (15*80 + 38) * 2
	mov al, '\'
    mov ah, 01110001b             
    mov [es:di], ax
	
	mov di, (15*80 + 42) * 2
	mov al, '/'
    mov ah, 01110001b             
    mov [es:di], ax
	
	
	mov di, (16*80 + 39) * 2
	mov al, '\'
    mov ah, 01110001b             
    mov [es:di], ax
	
	mov di, (16*80 + 41) * 2
	mov al, '/'
    mov ah, 01110001b             
    mov [es:di], ax
	
	mov di, (17*80 + 40) * 2
	mov al, '*'
    mov ah, 01110001b             
    mov [es:di], ax

exit:
    mov ax, 4C00h
    int 21h
END start