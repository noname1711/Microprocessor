;tinh tong cac chu so

.model small
.stack 50
.data
    so db 10,0,10 dup($)        ; Khai bao bo dem nhap vao chuoi so (toi da 10 ky tu)
    tb1 db 'Nhap so: $'         ; Thong bao nhap so
    tb2 db 10, 13, 'Tong cac chu so: $' ; Thong bao ket qua
    tong db 0                   ; Bien luu gia tri tong
    muoi db 10                  ; Gia tri 10 dung cho chia lay so du
.code
main proc
    mov ax, @data
    mov ds, ax                  ; Khoi tao data segment
    
    lea dx,tb1
    mov ah,9
    int 21h                     ; Hien thi thong bao "Nhap so:"
    
    ; nhap so vao
    lea dx, so
    mov ah, 0ah
    int 21h                     ; Doc chuoi so nguoi dung nhap vao
    
    xor cx, cx
    lea si, so +2               ; Dua con tro den vi tri dau cua chuoi so (bo qua ky tu dau)
    mov cl, [so+1]              ; Lay do dai cua chuoi so
    
    xor ax,ax                   ; Dat ax = 0 de luu ket qua tong
    
lap:
        xor bx,bx
        mov bl,[si]             ; Lay tung ky tu trong chuoi so
        sub bl, 30h             ; Chuyen tu ma ASCII sang gia tri so
        add ax, bx              ; Cong gia tri so vao ax
        inc si                  ; Tang con tro de xu ly ky tu tiep theo
        loop lap                ; Lap lai cho den khi het cac ky tu so
        
    xor cx, cx
lapchia:
        xor dx, dx
        div muoi                ; Chia ax cho 10 de lay chu so cuoi cung
        add ah,30h              ; Chuyen ket qua thanh ma ASCII
        mov dl,ah
        push dx                 ; Day chu so vao stack
        inc cx                  ; Tang bo dem so chu so
        xor ah, ah
        cmp ax, 0               ; Neu ax khac 0, tiep tuc chia
        jne lapchia
        
    lea dx, tb2
    mov ah, 9
    int 21h                     ; Hien thi thong bao "Tong cac chu so:"
    
hienthi:
        pop dx                  ; Lay chu so tu stack ra
        mov ah,2
        int 21h                 ; Hien thi chu so tren man hinh
        loop hienthi            ; Lap lai cho den khi het chu so trong stack
    
    mov ah, 4ch
    int 21h                     ; Ket thuc chuong trinh
main endp
end main
