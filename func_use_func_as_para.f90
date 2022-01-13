program simple
    implicit none
    integer a(99)
    real ,external :: func2
    
    call func1(a,func2)
end program simple

!本func需要用func作为参数
subroutine func1(a,f3)
    implicit none
    integer :: a(9)
    real, external :: f3
    write(*,*) a
    write(*,*) f3(a(1))
end subroutine

!定义一个func
real function func2(a)
    implicit none
    integer :: a
    func2 = a
end function