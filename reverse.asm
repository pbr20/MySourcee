.model small
.stack 100h
.data 
str db 100 ? 
.code
main proc
    mov ax, @data
    mov ds,ax
    
    lea si, str
    mov cx, 2  
    mov bx , 0
    input:
    mov cx, 2
    mov ah, 1
    int 21h
    
    cmp al, 13
    je l2
    mov [si], al
    inc bx
    loop input
    
    l2:
    lea si, str 
    add si, bx 
    dec si
    mov cx, bx
     
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
     
    output:
    mov ah, 2
    mov dl, [si]
    int 21h
    
    dec si
    
    loop output
    
    
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main