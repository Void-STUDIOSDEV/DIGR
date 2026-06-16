section .data
	history db 10, "Version 1.00.00: Remade the program | Version 1.01.00: Splitted the options and sites | Version 1.02.00: Split the history | Version 1.03.00: Split Resource and Notice into seperate files", 10
	history_len equ $ - history

section .text
    global history_text

history_text:
	mov rax, 1
	mov rdi, 1
	mov rsi, history
	mov rdx, history_len
	syscall

	ret