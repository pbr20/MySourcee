.model small
.stack 100h
.code
main proc
    
    
    call add_number
    call add_number 
    
    
    
    exit:
    mov ah, 4ch
    int 21h
    main endp


add_number proc
        mov ah, 1
        int 21h
        mov bl, al
        
        call next_line
        
        mov ah,1
        int 21h
        mov bh, al
        
        
        add bl, bh
        sub bl, 48
        
        call next_line
        
        mov ah, 2
        mov dl, bl
        int 21h
        
        call next_line
        
        ret
        add_number endp


next_line proc
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    ret
    next_line endp
  
end main  