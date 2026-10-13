.model small
.stack 100h
.data
a db 10, 13, "Lower Case $"
b db "Upper Case $"
.code 
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, b
    int 21h
    
    mov ah, 1
    int 21h
    mov bl, al
    
    add bl, 32 ; bl = bl + 32 since upper + 32 = lower ascii
    
    mov ah, 9
    lea dx, a
    int 21h
    
    mov ah, 2
    mov dl, bl
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
     
    