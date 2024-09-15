; nhap mot so vao va xuat ra giai thua

.model small
.stack 100
.data
    muoi dw 10  ;gan gtri 10 cho bien muoi
    tb db 10,13 , 'Ket qua giai thua la: $'
.code
main proc 
    mov ax, @data
    mov ds, ax  ;khoi tao thanh ghi ds
    
    mov ah ,1 ;nhap 1 ki tu tu ban phim
    int 21h
    sub al, '0'  ;chuyen ki tu thanh so
    mov cx, 0  ;cx =0
    mov cl, al ;cl =5
    
    lea dx, tb
    mov ah, 9
    int 21h
    mov ax, 1   ;ktao gtri ban dau =1
    mov bx, 1  ;bien tang
    
    giaithua:      ;ham tinh giai thua tra ve 1 so
        mul bx ;ax*bx luu vao trong ax
        inc bx  ;tang gia tri bx len 1
        cmp bx, cx  ;so sanh bx voi cx
        jle giaithua  ;neu bx <= cx thi tiep tuc lap
    mov cx, 0
    
    lappush:   ;lay tu ki tu cua so vao day trong ngan xep
        mov dx, 0
        div muoi   ;chia cho 10
        add dx, '0'  
        push dx   ;day vao ngan xep
        inc cx  ;tang cx len 1 dvi
        cmp ax,0 
        jne lappush
        
    hienthi: ;hien thi tung ki tu o trong ngan xep
        pop dx ;lay 1 so o dau ngan xep
        mov ah,2
        int 21h
        loop hienthi
    
    mov ah, 4ch
    int 21h
main endp
end main
    
           
       
    
    