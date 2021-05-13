;Multiplicação sem Scanf

    extern printf

segment .data
a: dq 200
b: dq 100
msg: dw "Multiplication:",0
fmt: dq "%s %lld ",10,0

segment .text
    global main

main:
    push RBP

    mov RAX , 0
    mov RDX, 0
    mov RAX , [a]
    mov RDX , [b]
    mul RDX
    ;mul é uma função de multiplicação
    ;Sempre multiplica RAX pelo valor que está no registrador indicado
    ;O resultado é guardado no RAX
    mov RDI, fmt
    mov RSI, msg
    mov RDX, RAX
    mov RAX , 0
    call printf

mov RAX, 0
pop RBP
ret