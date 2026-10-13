.model small
.stack 100h
.data  

a db 'AND operation $'
b db 10, 13, 'OR operation $'
c db 10, 13, 'X-OR operaton $'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, a
    int 21h
    
    mov bl, 101b
    and bl, 111b
    
    mov ah, 2
    mov dl, bl
    add dl, 48
    int 21h
    
    mov ah, 9
    lea dx, b
    int 21h 
    
    mov ah, 2
    mov bl, 101b
    or bl, 111b
    
    mov dl, bl
    add dl, 48
    int 21h
    
    mov ah, 9
    lea dx, c
    int 21h
    
    mov ah, 2
    mov bl, 101b
    xor bl, 111b
    
    mov dl, bl
    add dl, 48
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
