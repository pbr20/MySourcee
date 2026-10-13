.model small
.stack 100h
.data
msg db "Loop Concept $"  
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 2
    mov dl, msg
    int 21h
    
    mov dl, 10
    int 21h
    mov dl , 13
    int 21h
    
    mov cx, 26
    mov dl, 'A'
    
    level1:
    int 21h
    inc dl  
    loop level1
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main