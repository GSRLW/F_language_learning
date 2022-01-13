module operator_i
    interface operator(.i.) !!// 自定义重载矩阵求逆操作符
    module procedure brinv !!// 实矩阵求逆
    end interface
contains
!!// 实矩阵求逆核心代码 trans from 徐士良《Fortran常用算法集》
function brinv(re) result(r)

    real,intent(in) :: re(:,:) !!// 原矩阵
    real :: r(size(re,1),size(re,1)) !!// 逆矩阵
    integer :: flag,n !!// flag判断奇异性；n是矩阵维度
    real :: t,d !!// 中间变量
    integer :: is(size(re,1)),js(size(re,1)) !!// 中间变量

    n=size(re,1) !!// 获取矩阵维度
    r=re !!// 复制值
    flag=1
    do k=1,n
        d=0.0
        do i=k,n
            do j=k,n
                if (abs(r(i,j)).gt.d) then
                    d=abs(r(i,j))
                    is(k)=i
                    js(k)=j
                end if
            end do
        end do
        if (d+1.0.eq.1.0) then
            flag=0
            write(*,*) "flag=0,实矩阵奇异！" 
			return !!// 矩阵奇异，退出逆矩阵求解
        end if
        ! swap r(k,j) - r(is(k),j)   
        do j=1,n
            t=r(k,j)
            r(k,j)=r(is(k),j)
            r(is(k),j)=t
        end do
        ! swap r(i,k) - r(i,is(k))   
        do i=1,n
            t=r(i,k)
            r(i,k)=r(i,js(k))
            r(i,js(k))=t
        end do
        r(k,k)=1/r(k,k)
        do j=1,n
            if (j.ne.k) r(k,j)=r(k,j)*r(k,k)
        end do
        do i=1,n
            if (i.ne.k) then
                do j=1,n
                    if (j.ne.k) r(i,j)=r(i,j)-r(i,k)*r(k,j)
                end do
            end if
        end do
        do i=1,n
            if (i.ne.k) r(i,k)=-r(i,k)*r(k,k)
        end do
    end do
    do k=n,1,-1
        do j=1,n
            t=r(k,j)
            r(k,j)=r(js(k),j)
            r(js(k),j)=t
        end do
        do i=1,n
            t=r(i,k)
            r(i,k)=r(i,is(k))
            r(i,is(k))=t
        end do
    end do
end function

end module



 