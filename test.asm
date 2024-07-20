section .data
    msg db 'test', 0xA  ; 'test' followed by newline (0xA)

section .text
    global _start       ; Entry point for the program

_start:
    ; Write the message to stdout
    mov eax, 4          ; System call number for sys_write (4)
    mov ebx, 1          ; File descriptor for stdout (1)
    mov ecx, msg        ; Pointer to the message
    mov edx, 5          ; Length of the message (4 characters + newline)
    int 0x80            ; Interrupt to make the system call

    ; Exit the program
    mov eax, 1          ; System call number for sys_exit (1)
    xor ebx, ebx        ; Exit code 0
    int 0x80            ; Interrupt to make the system call
