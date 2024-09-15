; chuyen tu he 10 -> he 16

; vidu: 444 = 1*16^2 +11*16 +12*16 = 1BC

.model small
.stack 100h
.data
.code
main proc
    mov ax, @data
    mov ds, ax ;khoi tao thanh ghi ds
    mov ax, 444  ;chuyen 444 he 10 vao thanh ghi ax -> he 16
    call printnum16  ;goi ham printnum16
    mov ah, 4ch
    int 21h
main endp

printnum16 proc
    mov bx, 16 ;khoi tao bl =16
    mov cx, 0  ;ktao bien dem
    
    hexa:  ;xay dung stack
        div bl ;lay so htai /16
        push ax ; day gtri vao ngan xep
        inc cx ;tang bien dem them 1
        cmp al ,0 ;neu thuong al cua lenh div =0 thi kthuc startsplit
        je ketqua ;jump equal
        mov ah, 0 ; clear ah cua lenh div va quay lai tiep tuc chia(quay lai startsplit)
        jmp hexa
        
    ketqua:
    inkq:
        pop ax ;lay tung gtri o dinh ngan xep vua day vao o ham startsplit
        mov dl, ah ;lay phan tu di chuyen vao dl
        
        cmp dl,10 ;neu ptu la 10 thi chuyen den ham in ki tu A
        je hex_a
        cmp dl, 11 ;neu ptu la 11 thi chuyen den ham in ki tu B
        je hex_b   
        cmp dl,12  ;neu ptu la 12 thi chuyen den ham in ki tu C
        je hex_c
        cmp dl, 13 ;neu ptu la 13 thi chuyen den ham in ki tu D
        je hex_d
        cmp dl, 14  ;neu ptu la 14 thi chuyen den ham in ki tu E
        je hex_e
        cmp dl, 15  ;neu ptu la 15 thi chuyen den ham in ki tu F
        je hex_f
        
        add dl, '0' ;neu ko la ki tu A ->F, chuyen cac so tu 0->9 sang ascii
        jmp print ;nhay den ham in so tu 0 -> 9
        
        hex_a:
            mov dl, 'A'
            jmp print 
        hex_b:
            mov dl, 'B'
            jmp print
        hex_c:
            mov dl, 'C'
            jmp print
        hex_d:
            mov dl, 'D'
            jmp print
        hex_e:
            mov dl, 'E'
            jmp print
        hex_f:
            mov dl, 'F'
            jmp print 
        print: ;in 1 ki tu ra mhinh
            mov ah,2
            int 21h
     loop inkq
     ret  ;return
printnum16 endp
end main
        
        