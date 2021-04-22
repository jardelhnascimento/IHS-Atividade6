;BITS 32
section .text
global sort
sort:
    enter 0,0
    pusha

    mov ebx, dword[ebp + 8]    ;size em ebx
    mov esi, [ebp + 12]         ;&vetor em esi

    ;bubble sort
    bubblesort:

    xor ecx, ecx
    xor ax, ax ; 'flag' que indica se houve troca de valores e coloca na pilha
    push ax
    loopfor:
        cmp ecx, ebx
        jge endloop
        ;carregar 2 ints em eax e edx

        mov eax, dword[esi + ecx*4]
        add ecx, 1
        mov edx, dword[esi + ecx*4]
        sub ecx, 1


        ;compara 
        cmp eax, edx
        jg troca


        ;não troca
        add ecx, 1  ;adiciona 1 ao contador e vai para prox iteração do loop
        jmp loopfor

        troca:
        mov [esi + ecx*4], dword edx
        add ecx, 1
        mov [esi + ecx*4], dword eax
        ;levanta flag de trocado
        pop ax
        mov ax, 0x0001
        push ax
        ;vai para proxima iteração do loop com ecx incrementado
        jmp loopfor

    endloop:
        ;verifica se ocorreu troca, se sim, executa novamente
        pop ax
        cmp ax, 0x0001
        je bubblesort
    end:
        
        popa
        leave