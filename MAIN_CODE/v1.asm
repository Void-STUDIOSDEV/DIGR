extern options_text ;imports data from the opt file
extern sites_text ;imports data from the sites file
extern doc_text ;imports data from the doc file
extern history_text ;imports data from the hist file
extern resource_text ;imports data from the res file
extern not_text ;imports data from the not file

section .bss
	input resb 2 ;reserves 2 bytes for user-input
	
section .data
	intro db "Darknet_Index_Guide-DIG", 10 ;intro message
	intro_len equ $ - intro ;length of the intro
	
	version db "Version 1.03.00", 10 ;versioning
	version_len equ $ - version ;length of the version

	inputms db "INPUT: " ;input print
	input_len equ $ - inputms ;length of input prompt

	invalidms db 10, "INVALID INPUT", 10 ;invalid input message
	invalidms_len equ $ - invalidms ;length of the invalidms message


section .text
	global _start

_start:
;---INTRO PRINT---
	mov rax, 1 ;syswrite
	mov rdi, 1 ;stdout
	mov rsi, intro ;pointer to the intro message
	mov rdx, intro_len ;pointer to the length of the intro
	syscall

;---VERSION PRINT---
	mov rax, 1 ;syswrite
	mov rdi, 1 ;stdout
	mov rsi, version ;pointer to the version print
	mov rdx, version_len ;pointer to the length of the version
	syscall

loop_start:
;---OPTIONS PRINT---
		call options_text ;calls all the data in the options.asm file

;---INPUT PROMPT PRINT---
		mov rax, 1 ;syswrite
		mov rdi, 1 ;stdout
		mov rsi, inputms ;pointer to the input print
		mov rdx, input_len ;pointer to the length of the options
		syscall

;---TAKE INPUT---
		mov rax, 0 ;sysread
		mov rdi, 0 ;stdin
		mov rsi, input ;initialize input
		mov rdx, 32 ;max amount of bytes to read
		syscall

		mov al, [input] ;read only the first character


		cmp al, 's' ;compare al to S
		je sites_option

		cmp al, 'd' ;compare al to D
		je document_option

		cmp al, 'h' ;compares al to H
		je history_option

		cmp al, 'r' ;compares al to R
		je resource_option

		cmp al, 'n' ;compares al to E
		je notice_option

		cmp al, 'e' ;compares al to E
		je exit_option

		jmp invalid ;fallback

;---PRINT FOR DOCUMENT---
	document_option:
			call doc_text ;calls the data from the doc.asm files

			jmp loop_start

;---PRINT FOR SITES---
	sites_option:
			call sites_text ;calls the data from the sites.asm file
			
			jmp loop_start

;---PRINT FOR HISTORY---
	history_option:
			call history_text

			jmp loop_start

;---PRINT RESOURCES---
	resource_option:
			call resource_text

			jmp loop_start

;---PRINT NOTICE---
	notice_option:
			call not_text

			jmp loop_start

;---EXIT---
	exit_option:
			mov rax, 60 ;sysexit
			xor rdi, rdi ;return 0
			syscall

	invalid:
			mov rax, 1 ;syswrite
			mov rdi, 1 ;stdout
			mov rsi, invalidms ;pointer to the invalid message
			mov rdx, invalidms_len ;pointer to the length of resource length
			syscall

			jmp loop_start