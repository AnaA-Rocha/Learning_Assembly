; máximo divisor comum
    
    extern printf
    extern scanf

section .data ;declara variáveis
a: dq 2
b: dq 2
fmt_out: dq "The GCD is: %lld",10,0
fmt_in: dq "%lld", 0

segment .text

    global main
main:
    push RBP ;é preservado
    
    mov RAX, 0;
    mov RDI, fmt_in; first argument
    mov RSI, a; second argument
    call scanf;
    
    mov RAX, 0;
    mov RDI, fmt_in; first argument
    mov RSI, b; second argument
    call scanf;
    
    mov RAX, 0; first return
    mov RDX, 0; second return
    mov RAX, [a];
    mov RBX, [b];
    
    
WHILE:
    mov RDX, 0    
    idiv RBX; RAX = Resultado, RDX = resto
    cmp RDX, 0; if RDX == 0
    jz IMPRIME; JZ ==
    mov RAX, RBX;
    mov RBX, RDX;
    jmp WHILE  
       
IMPRIME:
    mov RAX, 0; 1 return
    mov RDI, fmt_out; 1 argument
    mov RSI, RBX; 2 argument
    call printf
    
pop RBP
mov RAX, 0
ret