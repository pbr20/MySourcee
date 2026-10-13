.model small
.stack 100h
.code
main proc
    
    mov ah, 2
    mov cx, 10
    mov bl , 0
    
    l1:
    
    l2:
    
    mov dl, bl
    cmp dl, 255
    je exit
    int 21h 
    
    inc bl
    
    loop l2
    
    mov cx, 10
    
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


; Ascii Value printing
    
    