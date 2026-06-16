section .data
	notice db 10, "NOTICE: This program is not of malicious intents. The intent of the developer, Nathan Slone, is not of malicious nor criminal intent, only education. The license of the program is detailed on the repository of the program [https://github.com/Void-STUDIOSDEV/DIG/blob/main/LICENSE.md] is under the GNU General Public LIcense v2.0, please adhere to the license.", 10
	notice_len equ $ - notice ;length of the notice message

section .text
    global not_text

not_text:
    mov rax, 1
    mov rdi, 1
    mov rsi, notice
    mov rdx, notice_len
    syscall

    ret