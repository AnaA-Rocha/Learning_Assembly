; Verificar qual n�mero � maior ou igual

    extern scanf
    extern printf
    
segment .data ;declara��o de vari�veis
a: dq 2;
b: dq -1;
fmt_in: dw "%ldd", 0 ;
fmt_out: dw "%lld is greater equal %lld", 10, 0;

segment .text ;c�digo
    global main
main:
    push RBP;
    
    ;Ler a
    mov RAX, 0; 1 retorno
    mov RDI, fmt_in; 1 par�metro
    mov RSI, a; 2 par�metro
    call scanf
    
    ;ler b
    mov RAX,0;
    mov RDI, fmt_in;
    mov RSI, b;
    call scanf
    
    ;if
    mov RAX, 0; 1 retorno
    mov RDX, 0; 2 retorno
    mov RAX, [a];
    mov RBX, [b];
    mov RDI, fmt_out
    cmp RAX, RBX
    ;jge equivale a >=
    jge YEP;
    mov RSI, RBX;
    mov RDX, RAX;
    jmp IMPRIME;
    
YEP:
    mov RSI, RAX;
    mov RDX, RBX;
    jmp IMPRIME;

IMPRIME:
    mov RAX, 0;
    call printf
    
pop RBP
mov RAX, 0
ret
    