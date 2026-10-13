.model small
.stack 100h
.data
a dw 1232
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, a
    mov cx, 0
    mov bx, 10
    sum_loop:
    
    mov dx, 0
    div bx
    
    
    add cx, dx 
    
    cmp ax, 0
    jne sum_loop
    
    mov ah, 2
    mov dl, cl 
    add dl, 48
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
        
    