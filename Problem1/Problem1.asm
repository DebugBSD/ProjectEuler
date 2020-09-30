.686
.model flat, stdcall
; Problem 1 - Multiples of 3 and 5
;
; Statement:
; If we list all the natural numbers below 10 that are multiples of 3 or 5, we 
; get 3, 5, 6 and 9. The sum of these multiples is 23.
; 
; Find the sum of all the multiples of 3 or 5 below 1000.


EXIT_SUCCESS = 0
EXIT_FAILURE = -1

ExitProcess PROTO exitValue:DWORD

.CONST

.DATA? ; BSS


.DATA

multiples DWORD 0

.CODE

IsMultiple proc uses ebx edx, number:DWORD, dividend:DWORD
	mov eax, number
	xor edx, edx
	div dividend
	.if !edx
		mov eax, 1 ; Is Multiple
	.else
		mov eax, 0
	.endif
	ret
IsMultiple endp

main PROC
	
	xor ebx, ebx
	mov ecx, 1000
	dec ecx
L1:
	invoke IsMultiple,ecx,3
	.if eax
		add multiples, ecx
		jmp J2
	.endif

	invoke IsMultiple,ecx,5
	.if eax
		add multiples, ecx
	.endif
J2:
	loop L1
	
	nop
	invoke ExitProcess, 0
main endp

end main