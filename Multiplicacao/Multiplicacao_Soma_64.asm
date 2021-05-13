; Multiplicação sem leitura de número
; Somas sucessivas

    extern printf
    
segment .data
    a: dq 200
    b: dq 100
    msg: dq "Multiplication:",0;
    fmt_out: dq "%s %lld ",10,0;
    
segment .text
    global main
    
main:
    push RBP;
    
    mov RAX, 0;
    mov RBX, 0;
    mov RCX, 0; Contador
    mov RDX, 0; Soma
    mov RAX, [a];
    mov RBX, [b];
    
WHILE:
    cmp RCX, RBX;
    jge END_WHILE
    add RDX, [a]
    inc RCX
    jmp WHILE

END_WHILE:
    mov RDI, fmt_out; 1 argument
    mov RSI, msg; 2 argument
    mov RDX, RDX; 3 argumetn
    jmp IMPRIME
        
IMPRIME:
    mov RAX, 0;
    call printf
    
pop RBP;
mov RAX, 0;
ret;