.model small
.stack 100h
.data
a db "abcdedcba$"
a_len equ ($-a)
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, a
    lea di, a
    add di , a_len - 2
      
    
 
   
    
    mov cx, a_len
    
    check_palindrom:
    
    mov bl, [di]
    
    cmp [si], bl
    jne no
    
    cmp si, di
    jb yes
    
    inc si
    dec di
    
    loop check_palindrom
    
    yes:
    mov ah, 2
    mov dl, 'y'
    int 21h
    jmp exit
    
    no:
    mov ah, 2
    mov dl, 'n'
    int 21h
    jmp exit 
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main