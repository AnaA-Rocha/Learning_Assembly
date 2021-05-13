;Division with scanf

    extern printf
    extern scanf

segment .data
a: dq 2
b: dq -1
msg1: dw "Quotient:",0
msg2: dw "Rest:",0
fmt_out: dq "%s %lld %s %lld ",10,0
fmt_in: dq "%lld", 0

segment .text
    global main
main:

    push RBP
    
    mov RAX, 0
    mov RSI, a
    mov RDI, fmt_in
    call scanf
    
    mov RAX, 0
    mov RSI, b
    mov RDI, fmt_in
    call scanf
    
    mov RAX, 0
    mov RBX, 0
    mov RDX, 0
    mov RCX, 0
    
    mov RAX, [a]
    mov RBX, [b]
    idiv RBX ;divisor
    mov R11, RDX
    ;idiv = divide o conteúdo de EDX/EAX
    ;neste caso, como está chamando o RBX, vai ser RAX/RBX
    ;O resultado da divisão é guardado no EAX
    ;O resto é guardado no EDX
    ;A função idiv chama o divisor
    
    mov RDI, fmt_out ;Primeiro Argumento
    mov RSI, msg1 ;Segundo Argumento
    mov RDX, RAX ;Terceiro Argumento
    mov RCX, msg2 ;Qaurto Argumento
    mov R8, R11 ;Quinto Argumento
    mov RAX, 0
    call printf
    
    
    
    pop RBP
    mov RAX, 0
    ret
