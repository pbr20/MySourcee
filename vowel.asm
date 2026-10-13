.model small
.stack 100h
.data
str db "RithenAndRose$" 
str_len equ ($-str)
a db 10, 13, "Total vowel: $" 
b db 10, 13, "Total consonent: $"
.code
main proc
    
    mov ax, @data
    mov ds, ax
    
    
    lea si, str
    mov cx, str_len - 1
    
    mov bl, 0
    mov bh, 0
    vowel_check:
    and [si], 0dfh
    cmp [si], 'A'
    je is_vowel
    cmp [si], 'E'
    je is_vowel
    cmp [si], 'I'
    je is_vowel
    cmp [si], 'O'
    je is_vowel
    cmp [si], 'U'
    je is_vowel
    jmp not_vowel
    
    is_vowel:
    inc bl
    
    jmp l1
    
    not_vowel:
    inc bh
    
    l1:
    inc si
    loop vowel_check
    
    mov ah, 9
    lea dx, a
    int 21h
    
    mov ah, 2
    mov dl, bl
    add dl, 48
    int 21h
    
    mov ah, 9
    lea dx, b
    int 21h
    
    mov ah, 2
    mov dl, bh 
    add dl, 48
    int 21h 
   
    
    exit:
    mov ah, 4ch
    int 21h
    main endp

end main


