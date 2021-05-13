;Divisão

    extern printf

segment .data ;declaração de variável
a: dq 300 ;dq = 4 bytes
b: dq 100 ;dq = 4 bytes
msg: dw "Quotient:",0 ;dw = 2 bytes
fmt: dq "%s %lld ", 10, 0

segment .text ;Bloco de código
    global main

main:
    push RBP;
    
    mov RAX, 0
    mov RBX, 0
    mov RDX, 0
    
    mov RAX, [a] ;300
    mov RBX, [b] ;100 ;divisor
    
    div RBX
    ; dividi o valor de EDX/EAX
    ; O resultado é guardado no EAX
    ; O resto é guardado no EDX
    ; A função div chama o divisor
    
    mov RDI, fmt
    mov RSI, msg
    mov RDX, RAX
    mov RAX, 0
    call printf
    
    mov RAX, 0
    pop RBP
    ret