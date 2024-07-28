section .data
    input db "12345", 0 # this is the input change it
    msg_valid db "The input is a valid number.", 0
    msg_invalid db "The input is not a valid number.", 0

section .bss
    i resb 1

section .text
    global _start

_start:
    mov ecx, input
    call is_number
    cmp al, 1
    je valid_number

invalid_number:
    mov edx, msg_invalid
    jmp print_message

valid_number:
    mov edx, msg_valid

print_message:
    mov ecx, edx
    mov ebx, 1
    mov edx, 26
    mov eax, 4
    int 0x80

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80

is_number:
    mov al, 1

check_next_char:
    mov bl, byte [ecx]
    cmp bl, 0
    je done

    cmp bl, '0'
    jl invalid

    cmp bl, '9'
    jg invalid

    inc ecx
    jmp check_next_char

invalid:
    mov al, 0
    ret

done:
    ret
