module generate_M_T
    implicit none
    ! public ?
    real,dimension(:,:),pointer::M
    integer,dimension(:,:),pointer::T
    contains !这个后面定义这个module提供的函数，和你在外面全局写的sub不一样！
    subroutine printMT
        implicit none
        WRITE(*,*) M
        write(*,*) T
    end subroutine
end module generate_M_T