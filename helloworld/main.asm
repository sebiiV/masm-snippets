.386
.MODEL flat, stdcall
										; https://docs.microsoft.com/en-us/cpp/assembler/masm/proto
GetStdHandle PROTO STDCALL,				; https://docs.microsoft.com/en-us/windows/console/getstdhandle
    nStdHandle: SDWORD

WriteFile PROTO STDCALL,				; https://docs.microsoft.com/en-us/windows/desktop/api/fileapi/nf-fileapi-writefile
    hFile: DWORD,                       ; output handle
    lpBuffer: PTR BYTE,                 ; pointer to buffer
    nNumberOfBytesToWrite: DWORD,       ; size of buffer
    lpNumberOfBytesWritten: PTR DWORD,  ; num bytes written
    lpOverlapped: PTR DWORD             ; ptr to asynchronous info

ExitProcess PROTO STDCALL,				; https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitprocess
    dwExitCode: DWORD                   ; return code

.DATA									; https://docs.microsoft.com/en-us/cpp/assembler/masm/dot-data
    Hallo db "Hello world!",13,10		; 13 & 10 are CR LF (window line endings)

.DATA?									; https://docs.microsoft.com/en-us/cpp/assembler/masm/dot-data-q
    lpNrOfChars dd ?

.CODE									; https://docs.microsoft.com/en-us/cpp/assembler/masm/dot-code
main PROC								; https://docs.microsoft.com/en-us/cpp/assembler/masm/proc
    invoke GetStdHandle, -11            ; -> StdOut-Handle into EAX
    invoke WriteFile, eax, OFFSET Hallo, LENGTHOF Hallo, OFFSET lpNrOfChars, 0
    invoke ExitProcess, 0
main ENDP

END main								; https://docs.microsoft.com/en-us/cpp/assembler/masm/end-masm