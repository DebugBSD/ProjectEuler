; Main template
.686
.model flat, stdcall

include main.inc

.CONST

welcomeMsg BYTE 'Hello World',0
dwSizeOfMessage DWORD ($ - welcomeMsg)

.DATA? ; BSS

.DATA

hWnd DWORD ?

.CODE

main PROC
	LOCAL dwCharsWritten:DWORD
	
	; Handle to write some data to the console.
	invoke GetStdHandle, STD_OUTPUT_HANDLE
	mov hWnd, eax
	
	; Write a Hello World message.
	invoke WriteConsole, hWnd, addr welcomeMsg, dwSizeOfMessage, addr dwCharsWritten, 0
	
	invoke ExitProcess, EXIT_SUCCESS
main endp

end main