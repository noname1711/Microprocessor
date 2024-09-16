;tim ucln va bcnn

.model small
.stack 100h
.data
    str1 db 'UCLN: $'              ; Chuoi thong bao UCLN
    str2 db 10,13, 'BCNN: $'       ; Chuoi thong bao BCNN
.code
main proc
    mov ax, @data
    mov ds, ax                      ; Khoi tao data segment
    
    mov cl, 7                       ; Gia tri dau tien cho so thu nhat (CL = 7)
    mov ch, 9                       ; Gia tri dau tien cho so thu hai (CH = 9)
    
    mov dl, cl                      ; Luu gia tri CL vao DL
    mov dh, ch                      ; Luu gia tri CH vao DH
    
    ; Bat dau tinh UCLN (Uoc chung lon nhat)
    uc:
        cmp dl, dh                  ; So sanh DL va DH
        je ucend                    ; Neu DL = DH thi ket thuc tinh UCLN
        jg ucln                     ; Neu DL > DH, chuyen sang giam DL
        sub dh, dl                  ; Neu DH > DL, tru DH cho DL
        jmp uc                      ; Lap lai
        
    ucln:
        sub dl, dh                  ; Giam DL cho DH
        jmp uc                      ; Lap lai
        
    ucend: 
        push dx                     ; Day DX vao stack
        mov ah, 9
        lea dx, str1
        int 21h                     ; Hien thi chuoi "UCLN:"
            
    pop dx                          ; Lay lai gia tri DX tu stack
    xor ah, ah
    mov al, dl                      ; Lay gia tri UCLN vao AL
    push dx                         ; Day lai DX vao stack
    call printnum                   ; Goi ham hien thi so
    
    mov ah, 9
    lea dx, str2
    int 21h                         ; Hien thi chuoi "BCNN:"
    
    mov al, cl
    mul ch                          ; Tinh tich CL * CH
    
    pop dx                          ; Lay gia tri UCLN tu stack
    div dl                          ; Chia cho UCLN de tinh BCNN
    call printnum                   ; Goi ham hien thi so
    
    mov ah, 4ch
    int 21h                         ; Ket thuc chuong trinh
main endp

; Ham printnum: Hien thi so trong thanh ghi AX
printnum proc
    push ax
    push bx
    push cx
    push dx
    
    mov bl, 10                      ; Dung de chia so lay chu so
    mov cx, 0                       ; Dat CX = 0 de dem so chu so
    
    loopcat:
        div bl                      ; Chia AX cho 10 de lay chu so
        push ax                     ; Day phan nguyen vao stack
        inc cx                      ; Tang bo dem so chu so
        cmp al, 0
        je catexit                  ; Neu AL = 0 thi thoat khoi vong lap
        xor ah, ah
        jmp loopcat
        
    catexit:
    startprint:
        pop ax                      ; Lay tung chu so tu stack ra
        mov dl, ah                  ; Chuyen chu so vao DL
        add dl, '0'                 ; Chuyen thanh ma ASCII
        mov ah, 2
        int 21h                     ; Hien thi chu so
    loop startprint                 ; Lap lai den khi het cac chu so
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret                             ; Quay ve chuong trinh chinh
printnum endp

end main
 