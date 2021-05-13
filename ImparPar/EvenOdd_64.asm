;even - odd(impar)
    extern printf
    extern scanf

segment .data ;declara variável
a: dq 2 ;quadword = 8 bytes
b: dq 2
fmt_even: dq "%lld is Even, vulgo par!", 10, 0
fmt_odd: dq "%lld is Odd, vulgo impar!", 10, 0
fmt_in: dq "%lld", 0

segment .text ;código
global main

main:
    push RBP ;RBP é preservado
    
    mov RAX, 0; first return
    mov RDI, fmt_in; first argument
    mov RSI, a; second argument
    call scanf;
    
    mov RAX, 0;
    mov RDX, 0; ;Third argument or second return
    mov RAX, [a];
    mov RBX, [b];
    idiv RBX; RAX/RBX --> Resultado no RAX, Resto no RDX
    
    cmp RDX, 1; Compara o resto da divisão com 1
    jz ELSE; Se RDX=1 = impar pula para o bloco else
    ;Se não, continua = PAR
    mov RDI, fmt_even;
    mov RSI, [a];
    jmp IMPRIME; Desvia para o blovo imprime
    
    ELSE:
        mov RDI, fmt_odd
        mov RSI, [a]
        jmp IMPRIME
        
    IMPRIME:
        mov RAX, 0
        call printf
        
    pop RBP;
    mov RAX, 0;
    ret
    
        
    
    