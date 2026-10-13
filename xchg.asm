.model small
.stack 100h
.data
a db 49
b db 50
.code
main proc
    mov ax, @data
    mov ds, ax
               
    mov bl, b
    
    mov ah, 2
    xchg a, bl
    xchg b, bl
    
    mov dl, a
    int 21h
    
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    mov dl, b
    int 21h
    
    exit:
    mov ah, 4ch
    int 21h
    main endp
end main         

; 1. XCHG means exchange or swap.
; 2. Both operands must have the same size.
; 3. Register-to-register exchange is allowed.
; 4. Register-to-memory exchange is allowed.
; 5. Memory-to-memory exchange is not allowed directly.
; 6. Immediate values cannot be used as operands.
; 7. XCHG does not affect flags.
; 8. XCHG AX, AX is valid but has no practical effect.