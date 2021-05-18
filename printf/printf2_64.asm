; more printf2_64

    extern printf
    
    segment .data
fmt2: db "printf2: flt2=%e", 10, 0
fmt3: db "char1=%c, str1=%s, len=%d", 10, 0
fmt4: db "char1=%c, str1=%s, len=%d, inta1=%d, inta2=%ld", 10, 0
fmt5: db "hex1=%lX, flt1=%e, flt2=%e", 10, 0

char1:	db	'a'			    ; a character 
str1:	db	"mystring",0	; a C string, "string" needs 0
len:	equ	$-str1			; len has value, not an address
inta1:	dd	12345678		; integer 12345678, note dd
inta2:	dq	12345678900		; long integer 12345678900, note dq
hex1:	dq	0x123456789ABCD	; long hex constant, note dq
flt1:	dd	5.327e-30		; 32-bit floating point, note dd
flt2:	dq	-123.456789e300	; 64-bit floating point, note dq  
    
    segment .bss ;unitialized data, cotains all global variables and static variables that ar initialized to zero
flttmp: resq 1              ; 64-bit temporary for printing flt1

    segment .text
   
    global main
main:
    push rbp;
    fld	dword [flt1]	        ; need to convert 32-bit to 64-bit
	fstp qword [flttmp]          ; floating load makes 80-bit, store as 64-bit
    
    mov rdi, fmt2;
    movq xmm0, qword[flt2]; xmm0 is used to pass and return floating point argument
    mov rax, 1; 1xmm register
    call printf;
    
    mov rdi, fmt3;
    mov rsi, [char1];
    mov rdx, str1;
    mov rcx, len;
    mov rax, 0; no xmm used
    call printf
    
    mov rdi, fmt4;
    mov rsi, [char1];
    mov rdx, str1;
    mov rcx, len;
    mov r8, [inta1];
    mov r9, [inta2];
    mov rax, 0;
    call printf;
    
    mov rdi, fmt5;
    mov rsi, [hex1];
    movq xmm0, qword [flttmp]
    movq xmm1, qword [flt2]
    mov rax, 2; ;2 xmm is used
    call printf;
    
    pop rbp
    mov rax, 0
    ret