; nhap 1 chuoi, in ra thong bao va chuoi vua nhap

.model small
.stack 100
.data
    tb db 10, 13, 'Chuoi da nhap la: $' ;10: xuong dong, 13: lui dau dong
    str db 100 dup('$')   ;mang chua 100 ptu gia tri $
    
.code
main proc
    mov ax, @data
    mov ds, ax  ; khoi tao thanh ghi ds
    
    ;nhap chuoi ki tu
    mov ah, 10   
    lea dx, str   ;tro den dia chi dau str
    int 21h
    
    mov ah,9 ;in ra mot xau ki tu
    lea dx, tb
    int 21h    
    
    ; dua dx chi ve phan tu thu 2 cua mang la
    ; ki tu dau tien duoc nhap vao
    lea dx, str +2
    int 21h 
    
    mov ah, 4ch
    int 21h
main endp

    
    
