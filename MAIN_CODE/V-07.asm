extern options_text ;imports data from the options file

section .bss
	input resb 2 ;reserves 2 bytes for user-input
	
section .data
	intro db "Darknet_Index_Guide-DIG", 10 ;intro message
	intro_len equ $ - intro ;length of the intro
	
	version db "Version 1.00.00", 10 ;versioning
	version_len equ $ - version ;length of the version

	inputms db "INPUT: " ;input print
	input_len equ $ - inputms ;length of input prompt

	sites db 10, "Darknet Army Forum: Forum of [edgy] sellers, varying from different things | DigAI: An uncensored AI. Willing to help with any projects | WSS: A Darknet chatroom, full of a different types of people, and featured on videos from people like Tranium | Tor.Link: A site that is a hub for other sites | NEXTCCV.CC: A Darknet market ranging from pre-made scripts, to CCV | CRYPTBB: A forum and a market [FURTHER RESEARCH REQUIRED] | DEF-CON: A legal site that uses onion for protection, where those of Cybersecurity, government cyber jobs, and more come together | DIGITAL THRIFT SHOP (PL): A market selling cheap items on the Darknet ranging from fake IDs to stolen items of medium to high value | GERMANIA: A Germanic-based market selling items [FURTHER RESEARCH REQUIRED] | BLACKMARK: A market selling a high variety of items [FURTHER RESEARCH REQUIRED] | THE HIDDEN WIKI: Not a site on the Darknet but is a wiki-style hub to other sites that are Darknet| Onionindex: Not a site on the Darknet but is a site that leads to other sites that are Darknet [FURTHER RESEARCH REQUIRED] | BREAKING BAD FORUM: A forum and a market place selling items to make the illegal substance Breaking Bad revolves around, also selling recipes alike | Onionlinks: a Darknet hub that links to other Darknet sites | Onion Identity Services: A market that sells fake IDs, fake Passports, and more | Dread: An onion site themed like Reddit, the original went down and now only copy-cats are left | Excavator: A Darknet hub that leads to other sites, even those that should never be interacted with | Anubis Market: A new, small, little site of vendors/sellers [FURTHER RESEARCH REQUIRED] | Osiris Market: A small trading site [FURTHER RESEARCH REQUIRED].", 10
	sites_len equ $ - sites ;length of sites message

	document db 10, "The nature of this program is educational [for those who are not willing to get on the Darknet/Market] and a safety guide for those who are on the Darknet. The legality of this program is lawfully in a gray-zone. As it depends on the user's purpose of consuming this program.", 10
	document_len equ $ - document ;length of documents

	history db 10, "Version 00.00.00: added the introduction | Version 00.01.00: added the core options | Version 00.01.01: fixed the options selection | 01.01.01: added the 'not in' function | 01.01.02: fixed some typos | 02.01.02: finishes the core options of the program. It is now ready to be released to the public. Updates of course will still take place | 02.02.01: changed program name from 'Dark Web & Market Index / Guide' to 'Darknet & Market Index / Guide' as it is better fitting | 02.03.02: Added a donation link, to further fund projects and machines I use to make the projects | 02.04.02: Added a 'developer' section | 02.05.02: Added an add-on for developers | 02.05.03: Added a clear input section, so users know what to do | 03.05.03: Added the loop mechanism | 03.06.03: Forgot to remove the placeholder for Version History, sorry | 03.06.03: I am never doing placeholders again | 3.06.04: Fixed some typos. Should be clean for now | 3.06.05: Changed a few security ratings based off research | 3.06.06: Fixed some issues I accidentally created | 3.07.06: Removed the redundant 'not in' statement | 3.07.07: Added version shorthand next to the version-numbers | 3.07.08: Fixed some typos | 4.07.08: Program officially launched. First number changed to align. Will be going by 'V-O<>, O for OFFICIAL | 4.08.08: Added a largest donation amount section and changes the bulletin list from '-' to '#' | 4.09.08: Added two more options, Recommendations and Developer Recommendations | 4.10.08: made input simple | 4.10.08: Made some changes in donator area and enter-name-area | 4.11.08: Changed 'Dark Net' to 'Darknet' to be linguistically accurate | 4.11.10: Changed Dark Net to Darknet inside the printed text itself | 4.12.10: Added a Resources [rs] page to the selection and fixed the versioning issue in the History [h] page | 4.13.10: Removed the Security page from the program for easier maintenance, quicker updating, and easier user-usage | 4.14.10: Changed things in thye Archetypes page | 4.15.10: Added a 'news' page | 4.16.10: Added a mechanic that allows multiple variants of 'DEV' name | 4.17.10: Reverted mechanic back to previous as it did not work | 4.18.10: Removed donations and news page | 5.18.10: Added a countdown for the exit command and adde the Y/M/D time | 5.19.10: Added a timer to the beginning of the program. Tweaked end-program timer | 5.20.10: Changed the countdown timer to be a second longer | 5.21.10: Changed option names | 5.21.11: Fixed an obvious typo that I missed | 5.21.12: Changed the invalid input print to also show what the input the user did | 5.22.12: Restructured DEVELOPER name system | 5.22.13: Changed text color and input printing | 5.23.12: Added two new sites to the list | 6.23.13: Made it more DOS-like. I am getting more interested in old tech. | 7.23.12: Changed the language to ASSEMBLY x86_64 INTEL Syntax", 10
	history_len equ $ - history ;length of history

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
			mov rax, 1 ;syswrite
			mov rdi, 1 ;stdout
			mov rsi, document ;pointer to the documents message
			mov rdx, document_len ;pointer to the length of the documents
			syscall

			jmp loop_start

;---PRINT FOR SITES---
	sites_option:
			mov rax, 1 ;syswrite
			mov rdi, 1 ;stdout
			mov rsi, sites ;pointer to the sites message
			mov rdx, sites_len ;pointer to the sites message
			syscall
		
			jmp loop_start

;---PRINT FOR HISTORY---
	history_option:
			mov rax, 1 ;syswrite
			mov rdi, 1 ;stdout
			mov rsi, history ;pointer to the history message
			mov rdx, history_len ;pointer to the length of the history message
			syscall

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