section .data
    options db  10, "ALL OPTIONS: SITES [S], HISTORY [H], DOCUMENATION [D], RESOURCES [R], NOTICE, [E] EXIT [E]", 10 ;options
    options_len equ $ - options ;length of input


section .text
    global options_text

options_text:
    mov rax, 1 ;syswrite
    mov rdi, 1 ;stdout
    mov rsi, options ;pointer to the options
    mov rdx, options_len ;pointer to the length of the options
    syscall
    ret ;returns back to the main file (further research required)