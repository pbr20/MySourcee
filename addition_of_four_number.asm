.model small
.stack 100h
.data
a db "Enter 1st number $"
b db 10, 13, "Enter 2nd number $"
c db 10, 13, "Enter 3rd number $" 
d db 10, 13, "Enter 4th number $"
result db 10, 13, "Result: $"
e db ?
f db ?
msg db ?

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, a
    int 21h
    
    mov ah, 1
    int 21h
    mov bl, al
    
    mov ah, 9
    lea dx, b
    int 21h
    
    mov ah, 1
    int 21h
    mov bh, al
    
    mov ah, 9
    lea dx, c
    int 21h
    
    mov ah, 1
    int 21h
    mov e, al
    
    mov ah, 9
    lea dx, d
    int 21h
    
    mov ah, 1
    int 21h
    mov f, al
    
    ;Addition
    
    add bl,bh ; bl = bh + bl
    sub bl,48
    add bl, e ; bl = bl + ch
    sub bl,48
    add f, bl ; f = f + bl
    sub f, 48
    
    ;Result
    
    mov ah, 9
    lea dx,result
    int 21h
    
    mov ah, 2
    mov dl, f
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main