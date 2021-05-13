; Adição

    extern printf

segment .data ;declara variável
a: dq 200
b: dq 100

add: dw "Addition: ",0
fmt: dq "%s %lld ",10,0 ;|  lld = long long int| \n | end

segment .text ;segmento de código
    global main

main:
    push RBP ;coloca RBP na pilha, prepara o registrador
    
    mov RAX, 0 ; zera o RAX
    mov RDX, 0 ; zera o RDX
    
    mov RAX, [a] ; move para o RAX o conteúdo de a
    add RAX, [b] ; soma o conteúdo de RAX com o conteúdo de B
    
    mov RDI, fmt ; formatação da saída é jogada no RDI
    mov RSI, add ; Coloca o conteúdo de add na RSI
    mov RDX, RAX ; Joga o conteúdo de RAX no RDX
   
    mov RAX, 0 ; Zera o RAX
    call printf
    
    pop RBP ; Restaura a pilha
    mov RAX, 0
    ret