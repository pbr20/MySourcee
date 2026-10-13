.model small
.stack 100h
.data
a db "Enter five numbers$"
b db 10, 13, "Largest Number: $" 
arr db 5 ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, a
    int 21h
    
    call next_line
    
    lea si, arr
    mov cx, 5
    
    
    
    input:
    mov ah, 1
    int 21h
    mov [si], al
    
    inc si
    
    mov ah, 2
    mov dl, 32
    int 21h
    
    loop input
    
    lea si, arr
    mov bl, [si]
    mov cx, 4
    
    inc si
    
    compare:
   
    
    cmp bl, [si]
    jae next
    
    mov bl, [si]
    
    
    next:
    inc si
    
    loop compare
    
    output:
    
    mov ah, 9
    lea dx, b
    int 21h
    
    mov ah, 2
    mov dl, bl
    int 21h
    
    
    
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
    
    
    next_line proc
        mov ah, 2
        mov dl, 10
        int 21h
        mov dl, 13
        int 21h
        
        ret
        
        next_line endp

end main
    


