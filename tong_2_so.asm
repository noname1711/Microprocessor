;tong 2 so 

.model tiny
.stack 100h
.data
    ; Khai bao cac thong bao va bien luu tru
    tb1 db 'Nhap so thu nhat: $'          ; Thong bao nhap so thu nhat
    tb2 db 13, 10, 'Nhap so thu hai: $'   ; Thong bao nhap so thu hai
    tb3 db 13, 10, 'Tong 2 so: $'         ; Thong bao ket qua tong 2 so
    so1 dw 0                              ; Bien luu so thu nhat
    so2 dw 0                              ; Bien luu so thu hai
    tong dw 0                             ; Bien luu tong hai so
.code
main proc
    mov ax, @data
    mov ds, ax      ; Thiet lap data segment (ds)

    ; In thong bao nhap so thu nhat
    lea dx,tb1      ; Dua dia chi tb1 vao dx
    mov ah,9
    int 21h         ; Goi ngat de in thong bao

nhap1:               ; Vong lap nhap so thu nhat
    mov ah,1
    int 21h         ; Doc ky tu tu ban phim
    cmp al,13       ; Kiem tra xem co nhan Enter khong
    je nhap2        ; Neu nhan Enter thi chuyen sang nhap so thu hai
    sub al,30h      ; Chuyen ky tu thanh gia tri so
    mov ah,0
    mov cx,ax       ; Luu lai gia tri so vua nhap
    mov ax,so1      ; Lay gia tri hien tai cua so1
    mov bx,10       ; Chuan bi nhan voi 10 de tang gia tri hang chuc
    mul bx          ; Nhan ax voi 10
    add ax,cx       ; Cong gia tri moi vao so1
    mov so1,ax      ; Luu ket qua vao so1
    jmp nhap1       ; Tiep tuc vong lap nhap so thu nhat

nhap2:
    ; In thong bao nhap so thu hai
    lea dx,tb2      ; Dua dia chi tb2 vao dx
    mov ah,9
    int 21h         ; Goi ngat de in thong bao

nhap:                ; Vong lap nhap so thu hai
    mov ah,1
    int 21h         ; Doc ky tu tu ban phim
    cmp al,13       ; Kiem tra xem co nhan Enter khong
    je tinhtong     ; Neu nhan Enter thi chuyen sang tinh tong
    sub al,30h      ; Chuyen ky tu thanh gia tri so
    mov ah,0
    mov cx,ax       ; Luu lai gia tri so vua nhap
    mov ax,so2      ; Lay gia tri hien tai cua so2
    mov bx,10       ; Chuan bi nhan voi 10 de tang gia tri hang chuc
    mul bx          ; Nhan ax voi 10
    add ax,cx       ; Cong gia tri moi vao so2
    mov so2,ax      ; Luu ket qua vao so2
    jmp nhap        ; Tiep tuc vong lap nhap so thu hai

tinhtong:
    mov dx,tong     ; Dat dia chi bien tong vao dx
    mov ax,so1      ; Lay gia tri so thu nhat vao ax
    mov bx,so2      ; Lay gia tri so thu hai vao bx
    add ax,bx       ; Cong hai gia tri so
    mov tong,ax     ; Luu ket qua tong vao bien tong

; In ket qua tong hai so
inso:
    mov ah,9
    lea dx,tb3      ; Dua dia chi tb3 vao dx
    int 21h         ; Goi ngat de in thong bao "Tong 2 so"

    mov ax,tong     ; Lay gia tri tong vao ax
    mov dx,0        ; Xoa thanh ghi dx
    mov bx,10       ; Dat bien chia la 10
    mov cx,0        ; Xoa thanh ghi cx (dem so chu so)

chia:               ; Vong lap chia de tach tung chu so
    div bx          ; Chia ax cho 10
    push dx         ; Luu lai gia tri du (chu so)
    inc cx          ; Tang bien dem chu so
    cmp ax,0        ; Kiem tra ax co bang 0 khong
    je hienkq       ; Neu ax = 0 thi hien thi ket qua
    xor dx,dx       ; Xoa thanh ghi dx
    jmp chia        ; Tiep tuc vong lap chia

hienkq:             ; Hien thi tung chu so
    pop dx          ; Lay chu so da luu lai
    add dl,30h      ; Chuyen gia tri thanh ky tu ASCII
    mov ah,2
    int 21h         ; Goi ngat de in ky tu
    loop hienkq     ; Lap lai den khi het chu so

ra:
    mov ah,4ch
    int 21h         ; Thoat chuong trinh
main endp

end main
