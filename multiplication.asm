;mul -> unsigned
;imul -> signed/integer
;syntax mul/imul   

;div -> unsigned
;idiv -> signed
;div/idiv divisor

.model small
.stack 100h
.data
a db ?
b db ?
c db "Enter 1st number:$"
d db 10, 13, "Enter 2nd number:$" 
e db 10, 13, "Result:$"
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, c
    int 21h
    
    mov ah,1
    int 21h 
    sub al, 48
    mov a, al
    
    
    mov ah, 9
    lea dx, d
    int 21h
    
    mov ah, 1
    int 21h
    mov b, al
    sub b, 48
    
    mov ah, 9
    lea dx, e
    int 21h
    
    mov al, a
    mul b     ; a x b = al
    
    mov ah, 2
    mov dl, al
    add dl, 48
    int 21h
    
    mov ah, 0
    mov al, a
    div b     ; a / b = al
     
    mov ah, 2
    mov dl, al
    add dl, 48
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main
