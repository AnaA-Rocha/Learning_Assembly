; Somando números de 1 a N
; OBS: N não está incluso
; para incluir o n, basta mudar o jge por jg

    extern printf
    extern scanf

segment .data
n: dq 2;
fmt_out: dq "The sum from 1 to %lld is: %lld ",10,0;
fmt_in: dq "%lld", 0;

segment .text
    global main
main:
    push RBP;
    
    ;Ler n
    mov RAX, 0;
    mov RDI, fmt_in;
    mov RSI, n;
    call scanf;
    
    mov RAX, 0; n
    mov RBX, 0; soma
    mov RCX, 0; contador
    mov RAX, [n];
    
    WHILE:
        inc RCX ;inc = incrementa 1 ao registrador
        cmp RCX, RAX;
        jge END_WHILE; ;se Contador for >= que n, desvia para END_WHILE
        add RBX, RCX; Soma = Soma + Contador
        jmp WHILE;
    
    END_WHILE:
        mov RDI, fmt_out;
        mov RSI, [n];
        mov RDX, RBX;
        jmp IMPRIME
        
    IMPRIME:
        mov RAX, 0;
        call printf
    
    pop RBP;
    mov RAX, 0;
    ret;
        
        