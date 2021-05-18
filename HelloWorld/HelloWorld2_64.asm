; Hello World
    extern printf;
    
    segment .data
msg: db "Hello World!", 0;
fmt: db "%s", 10, 0;

    segment .text

    global main
main:
    push rbp; frame pointer 
    
    mov rdi, fmt; first argument
    mov rsi, msg; second argument
    mov rax, 0; or Xor Rax,Rax -> Se tiver erro, retorna aqui
    call printf;
    
    pop rbp;
    
    mov rax, 0; vê se teve erro
    ret