;My first Hello World

;DB - Define Byte = 8 bits
;DW - Define Word = 2 bytes
;DD - Define double world = 4 bytes 
   
        extern	printf
                
        segment .data ;Aqui declara as variáveis
    Hellow: db "Hello World",0
    fmt: db "%s",10,0 ; Define o formato do printf(string) | \n | 0 (fim da string)

        segment .text ;Aqui fica o código
        
        global main ;Ponto de partida do gcc
        
    main:
        push RBP ;Coloca o registrador na pilha
        
        mov RDI,fmt ;Coloca fmt(formatação) no registrador RDI
        mov RSI,Hellow ;Coloca Hellow no registrador RSI
        mov RAX,0 ;Zera o registrador
        call printf
        
        pop RBP ;Restaura a pilha
        
        mov RAX,0 ;Zera o registrador
        ret ;return
        
; O valor de retorno das funções em C são guardadas no RAX