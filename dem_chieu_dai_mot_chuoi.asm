;dem chieu dai mot chuoi

.model small
.stack 100
.data
    tb1 db "nhap vao 1 chuoi: $"           
    tb2 db 10,13,"tong chieu dai cua chuoi: $" 
    s db 100 dup("$") ; khai bao chuoi nhap vao
    ; byte 0: chua so ki tu toi da cua xau nhap vao
    ; byte 1: chua chieu dai cua xau (vi du: "123456789" co chieu dai la 9)
    ; byte 2: chua dia chi cua ky tu dau tien

.code

main:
    ; khoi tao data segment
    mov ax, @data
    mov ds, ax

    ; xuat thong bao tb1
    lea dx, tb1
    mov ah, 9
    int 21h 

    ; nhap chuoi vao bien `s`
    lea dx, s
    mov ah, 10
    int 21h 

    ; xuat thong bao tb2
    lea dx, tb2
    mov ah, 9
    int 21h  

    ; tinh chieu dai cua chuoi
    mov ax, 0
    mov al, s+1  ; lay chieu dai chuoi vao al (al = chieu dai chuoi)
    mov cx, 0    ; khoi tao bien dem cx = 0 (count)
    mov bx, 10   ; khoi tao so chia (chia cho 10 de tach chu so)
    
    ; vong lap dem cac chu so cua chieu dai chuoi va day vao ngan xep (stack)
lapdem1:
    mov dx, 0   ; khoi tao dx = 0 (phu hop cho phep chia)
    div bx      ; chia ax cho 10, ket qua duoc luu vao ax va dx
    push dx     ; day so du (chu so) vao ngan xep
    inc cx      ; tang bien dem cx len 1
    cmp ax, 0   ; kiem tra phan thuong (ax) co bang 0 khong
    jnz lapdem1 ; neu khac 0 thi tiep tuc lap

    ; lay tung chu so tu ngan xep ra de in
lapdem2:
    pop dx      ; lay chu so tu ngan xep ra (dx)
    add dx, '0' ; chuyen chu so thanh ky tu (ascii)
    mov ah, 2
    int 21h     ; goi ngat de in ky tu
    loop lapdem2 ; lap cho den khi cx = 0 (het chu so)

    ; ket thuc chuong trinh
    mov ah, 4ch
    int 21h
end main
