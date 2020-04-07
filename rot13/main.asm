.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
	; define variables here

.code

main PROC
	; write your assembly code here
	INVOTE ExitProcess, 0
main ENDP
END main