.model small
.stack 100h
.data
n dw 8
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, n
    mov ax, 0
    mov bx, 1
    
    fibonacci:
    
    mov dl, al
    add dl, 48
    
    push ax
    push bx
    push cx
    
    mov ah, 2
    int 21h
    mov dl, 32
    int 21h
    
    pop cx
    pop bx
    pop ax
    
    mov dx, ax
    add ax, bx
    mov bx, dx
    
    loop fibonacci
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
    
    
    
    