extern options_text ;imports data from the options file
extern sites_text
extern doc_text
extern history_text

section .bss
	input resb 2 ;reserves 2 bytes for user-input
	
section .data
	intro db "Darknet_Index_Guide-DIG", 10 ;intro message
	intro_len equ $ - intro ;length of the intro
	
	version db "Version 1.02.00", 10 ;versioning
	version_len equ $ - version ;length of the version

	inputms db "INPUT: " ;input print
	input_len equ $ - inputms ;length of input prompt

	resource db 10, "Recommended equipment for  accessing and safely using the Darknet is Tor Browser on Personal Computers and Laptops and Onion Browser on Smart Devices. Mullvad VPN is the best privacy-first VPN. Although has no free options.", 10
	resource_len equ $ - resource ;length of resource

	invalidms db 10, "INVALID INPUT", 10 ;invalid input message
	invalidms_len equ $ - invalidms ;length of the invalidms message

	notice db 10, "NOTICE: This program is not of malicious intents. The intent of the developer, Nathan Slone, is not of malicious nor criminal intent, only education. The license of the program is detailed on the repository of the program [https://github.com/Void-STUDIOSDEV/DIG/blob/main/LICENSE.md] is under the GNU General Public LIcense v2.0, please adhere to the license.", 10
	notice_len equ $ - notice ;length of the notice message


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
			mov rax, 1 ;syswrite
			mov rdi, 1 ;stdout
			mov rsi, resource ;pointer to the resource message
			mov rdx, resource_len ;pointer to the length of the resource length
			syscall

			jmp loop_start

;---PRINT NOTICE---
	notice_option:
			mov rax, 1 ;syswrite
			mov rdi, 1 ;stdout
			mov rsi, notice ;pointer to the notice message
			mov rdx, notice_len ;pointer to the length of the notice length
			syscall

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