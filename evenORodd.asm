.model small
.stack 100h
.data
msg db "Enter Number: $"
even db 10,  13, "Even Number$"
odd db 10, 13, "Odd Number$"
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg
    int 21h
    
    mov ah, 1
    int 21h 
    sub al, 48
    and al, 1
    je oddn
    
    evenn:
    mov ah, 9
    lea dx, odd
    int 21h
    jmp exit
    
    oddn:
    mov ah, 9
    lea dx, even
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
    
 