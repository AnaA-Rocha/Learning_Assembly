;printf1_64

    extern printf
    
    segment .data
a: dq 5;
fmt: db "a=%ld, rax=%ld", 10, 0; 10->"\n" ; 0->'0';

    segment .text
    
    global main
main:
    push rbp;
    
    mov rax, [a] ; Pega a variável a do store e põe no RAX
    add rax,2; a+2
    mov rdi, fmt; primeiro argumento
    mov rsi, [a]; segundo argumento
    mov rdx, rax; terceiro argumento
    mov rax,0;
    call printf
    
    pop rbp;
    
    mov rax,0;
    ret;