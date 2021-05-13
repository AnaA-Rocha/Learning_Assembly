; Adi��o

    extern printf

segment .data ;declara vari�vel
a: dq 200
b: dq 100

add: dw "Addition: ",0
fmt: dq "%s %lld ",10,0 ;|  lld = long long int| \n | end

segment .text ;segmento de c�digo
    global main

main:
    push RBP ;coloca RBP na pilha, prepara o registrador
    
    mov RAX, 0 ; zera o RAX
    mov RDX, 0 ; zera o RDX
    
    mov RAX, [a] ; move para o RAX o conte�do de a
    add RAX, [b] ; soma o conte�do de RAX com o conte�do de B
    
    mov RDI, fmt ; formata��o da sa�da � jogada no RDI
    mov RSI, add ; Coloca o conte�do de add na RSI
    mov RDX, RAX ; Joga o conte�do de RAX no RDX
   
    mov RAX, 0 ; Zera o RAX
    call printf
    
    pop RBP ; Restaura a pilha
    mov RAX, 0
    ret