section .data
    resource db 10, "Recommended equipment for  accessing and safely using the Darknet is Tor Browser on Personal Computers and Laptops and Onion Browser on Smart Devices. Mullvad VPN is the best privacy-first VPN. Although has no free options.", 10
	resource_len equ $ - resource

section .text
    global resource_text

resource_text:
    mov rax, 1
    mov rdi, 1
    mov rsi, resource
    mov rdx, resource_len
    syscall

    ret