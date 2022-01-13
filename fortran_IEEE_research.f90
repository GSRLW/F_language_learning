program aaaaa
    implicit none
    ! 返回15位精度，+-8的指数位要求的kind SELECTED_REAL_KIND(15,15)
    real(kind=8) a
    real*8 b,bb
    real*4 bbb
    real bbbb ! 没有显式指定的real可以被参数 -fdefault-real-8 控制
    real(kind=4) c
    real(kind=16) d
    INTEGER i ! 默认kind = 4 于本版本
    integer(kind = 1) ii
    integer(kind = 2) iii
    integer(kind = 4) iiii
    integer(kind = 8) iiiii
    write(*,*) 'integer ...'
    write(*,*) 'integer kind=',kind(i),kind(ii),kind(iii),kind(iiii),kind(iiiii),kind(554545),kind(554545_8)
    write(*,*) 'integer huge=',huge(i),huge(ii),huge(iii),huge(iiii),huge(iiiii),huge(55455),huge(5545_8)
    ! ii = -129
    ! write(*,*) 'integer nbig=',98765432109876543210 , 'ii=',ii
    
    write(*,*) 'Real ...'
    write(*,*) 'Real kind=',kind(a),kind(b),kind(bbb),kind(bbbb),kind(c),kind(d)
    write(*,*) 'Real huge=',huge(a),huge(b),huge(bbb),huge(bbbb),huge(c),huge(d)
    write(*,*) 'Real tiny=',tiny(a),tiny(b),tiny(bbb),tiny(bbbb),tiny(c),tiny(d)
    write(*,*) '1.1234567890123456789_default/4/8/16 -->',&
    1.1234567890123456789,1.1234567890123456789_4,1.1234567890123456789_8,1.1234567890123456789_16
    a = 1.1234567890123456789e0
    write(*,*) 'a = 1.1234567890123456789e0 ----------->',a
    a = 1.1234567890123456789
    write(*,*) 'a = 1.1234567890123456789   ----------->',a
    a = 1.1234567890123456789d0
    write(*,*) 'a = 1.1234567890123456789d0 ----------->',a
    a = 1.1234567890123456789_8
    write(*,*) 'a = 1.1234567890123456789_8 ----------->',a
    a = 1.1234567890123456789_4
    write(*,*) 'a = 1.1234567890123456789_4 ----------->',a
    a = real(1.1234567890123456789_4,8)
    write(*,*) 'a = real(1.1234567890123456789_4,8) --->',a
    c = 1.1234567890123456789
    b = 1.1234567890123456789
    bb = 1.1234567890123456789
    write(*,*) 'sign ',sign(a,a),sign(c,real(a,4)),sign(real(a,4),c)
    write(*,*) 'dsign',dsign(a,a),dsign(b,b)  ! 使用 -fdefault-real-8 参数时会出现报错







end program aaaaa