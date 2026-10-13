.model small                                                        .model small
.stack 100h
.data
note dw "Press Enter after entering your name$"
nam dw  10, 13, "Enter your first name:$"
count db 0
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, note
    int 21h
    mov ah, 9
    lea dx, nam
    int 21h
    
    mov ah, 1
    mov cx, 100
    
    l1:
    
    mov cx, 10
    int 21h;
    cmp al, 0DH
    je l2
    inc count
    
    loop l1
    
    l2:
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    mov ah, 0
    mov al, count
    mov bl, 10
    div bl
    
    mov bh, ah
    
    cmp al, 0
    je ones_digit:
    
    mov ah, 2
    mov dl, al
    add dl, 48
    int 21h
    
    ones_digit:
    mov dl, bh
    add dl, 48
    int 21h 
    
    exit:
    mov ah, 4ch
    int 21h
    
    main endp
end main
    
    