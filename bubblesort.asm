.model small
.stack 100h
.data
a db 6 , 3, 8, 1, 9, 3, 4, 1
n equ 8
b db ?
.code
main proc
    mov ax , @data
    mov ds, ax
    
    
    mov cx, n-1
    outter_pass:
    
    lea si, a
    push cx
    
    inner_pass:
    
    mov bl, [si]
    cmp bl, [si+1]
    jbe no_swap
    
    xchg bl, [si+1]
    mov [si], bl
    
    no_swap:
    inc si
    
    loop inner_pass
    
    pop cx
    
    loop outter_pass
    
    lea si, a
    mov cx, n
    
    l1:
    
    mov ah, 2
    mov dl, [si]
    add dl, 48
    int 21h
    inc si
   
    loop l1
    
    
    
    
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
    