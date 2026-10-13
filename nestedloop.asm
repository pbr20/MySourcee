.model small
.stack 100h
.data
a db "Star Printing $"

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, a
    int 21h
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov cx, 10
    
    l1:
    mov bx, cx 
    mov cx, 10    ;for 10x 10 
                  ; without this line its a lower tri angle
    
    l2:
    mov dl, '*'
    int 21h
    
    loop l2
    
    mov cx, bx
    
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    loop l1
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main