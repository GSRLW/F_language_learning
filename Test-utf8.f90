function FE_basis_local_fun(x,length,vertices,basis_type,basis_index,basis_der)
    !局部基函数(高斯点，顶点，基函数类型，基函数编号，基函数求导)
    implicit none
    real::FE_basis_local_fun,h
    real,intent(in) ::x
    integer,intent(in):: basis_type,basis_index,basis_der,length
    real,intent(in) :: vertices(length)
    h=vertices(2)-vertices(1)
    if(basis_type==101)then!1D linear
        if (basis_index==1)then
            if(basis_der==0)then
                FE_basis_local_fun=(vertices(2)-x)/h
            endif
        elseif(basis_index==2)then
            if(basis_der==0)then
                FE_basis_local_fun=(x-vertices(1))/h
            endif
        endif
    endif
end function FE_basis_local_fun


function coe_fun(x)!参数方程
    implicit none
    real::x,coe_fun
    coe_fun=1
end function coe_fun
    
real function Guass_quad(coe_fun,length,vertices,basis_type_trial,basis_index_trial,&
        basis_der_trial,basis_type_test,basis_index_test,basis_der_test)
    !高斯积分(参数方程，顶点，基函数类型，基函数编号，基函数求导)
    implicit none
    real:: local_trial,local_test
    real,dimension(length) ::vertices
    integer:: basis_type_trial,basis_index_trial,basis_der_trial,basis_type_test,&
        basis_index_test,basis_der_test,length
    real,dimension(:),allocatable::wi,ti,xi,gi
    integer:: k,Gpn=3
    real, external :: FE_basis_local_fun
    real, external :: coe_fun
    allocate(wi(Gpn),ti(Gpn),xi(Gpn),gi(Gpn))
    wi(1)=0.555556;wi(2)=0.888889;wi(3)=0.555556
    ti(1)=-0.774597;ti(2)=0;ti(3)=0.774597
    xi(1:Gpn)=0.5d0*((vertices(2)-vertices(1))*ti(1:Gpn)+(vertices(2)+vertices(1)))
    Guass_quad = 0.0
        do k=1,Gpn
    local_trial=FE_basis_local_fun(xi(k),length,vertices,basis_type_trial,basis_index_trial,basis_der_trial)
    local_test=FE_basis_local_fun(xi(k),length,vertices,basis_type_test,basis_index_test,basis_der_test)
        Guass_quad=Guass_quad+wi(k)*coe_fun(xi(k))*local_trial*local_test
        enddo
    deallocate(wi)
    deallocate(ti)
    deallocate(xi)
    deallocate(gi)
end function Guass_quad
    
program Test
    implicit none
    integer::basis_type_trial=101,basis_type_test=101,basis_index_trial=1,basis_index_test=1,basis_der_trial=0,basis_der_test=0
    real::vertices(2)=[0,1]
    real, external :: coe_fun,Guass_quad
    real aa
    
    aa =  Guass_quad(coe_fun,2,vertices,basis_type_trial,basis_index_trial,basis_der_trial,&
        basis_type_test,basis_index_test,basis_der_test)
    write(*,*) 'run successful! Guass_quad = ',aa
end program Test