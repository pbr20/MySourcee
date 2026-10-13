.model small
.stack 100h
.data
a db 10, 13, "***********$"
b db "****$" 
c db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 2
    mov dl, '?'
    int 21h
    
    mov ah, 1
    int 21h
    mov bl, al
    int 21h
    mov bh,al
    int 21h
    mov c, al
    
    mov ah, 9
    mov cx, 5
    lea dx, a
    l1:
    int 21h
    loop l1
           
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov ah, 9       
    lea dx, b
    int 21h
    
    mov ah, 2
    mov dl, bl
    int 21h
    mov dl, bh
    int 21h
    mov dl, c
    int 21h
    
    mov ah, 9
    lea dx, b
    int 21h
    
    lea dx, a
    int 21h
    int 21h
    int 21h
    
    mov ah, 2
    mov dl, 7
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
    
    
    