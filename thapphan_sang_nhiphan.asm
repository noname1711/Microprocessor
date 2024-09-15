;chuyen tu he 10 sang he 2

.model small
.stack 100
.data 
    tb db 10,13 ,'so da nhap dang nhi phan: $'
    str db 10 dup ('$')  ;nhap vao 1 chuoi toi da 10 kitu 
.code
main proc
    mov ax, @data
    mov ds, ax ;khoi tao thanh ghi ds
    
    mov ax, '#' ;so sanh
    push ax  ; push dau # vao trong ngan xep
    
    ;nhap so dang chuoi
    mov ah, 10
    lea dx, str
    int 21h
    
    ;chuyen chuoi thanh so
    mov cl, [str +1] ;lay so ki tu cua chuoi (vd: cl =2)
    lea si, str+2  ;tro den dia chi cua ki tu dau tien cua chuoi str
    mov ax, 0  ;ax = 0123...
    mov bx, 10 ;bx =10; he so nhan
    
    thapphan: ;chuyen chuoi thanh so
        mul bx ;nhan 10
        mov dl , [si] ;dl ='1'
        sub dl ,'0' ; -> dl =1
        add ax, dx ; ax = ax+dx
        inc si  ; increase tang si len 1 dvi
        loop thapphan
    
    ;chuyen thanh so nhi phan
    mov cl,2 ;he so chia   
    
    nhiphan:  ;ham chuyen so tphan -> nhi phan va day vao nganxep
        mov ah, 0;phan du =0
        div cl ; chia ax cho 2
        push ax ;day ax vao ngan xep (al+ah)
        cmp al, 0  ;so sanh thuong khac 0 thi tiep tuc chia
        jne nhiphan  ;nhay neu ko =
        
    mov ah, 9
    lea dx, tb
    int 21h
    
    mov ah, 2
    inra: 
        pop dx ;lay tung ptu trong ngan xep
        cmp dx, '#'
        je done ;jump equal
        mov dl, dh ;lay dc so tu ngan xep
        add dl, '0' ;chuyen tu so -> ki tu
        int 21h
        jmp inra
    
    done: 
        mov ah, 4ch
        int 21h
main endp
end main
    
    
    
    
    
