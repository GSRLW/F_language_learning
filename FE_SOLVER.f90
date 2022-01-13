program FE_SOLVER
implicit none
INTEGER ,parameter::N=5 ! define a parameter
! integer i,j
real  array1(2,N)!,array2(N,2),array3(2,2)
! real  array4(2,3),array5(2,3),array6(2,3)
  
array1(1,1)=3.2;array1(1,2)=4.5;array1(1,3)=7.56;array1(1,4)=6.34;array1(1,5)=34.2;
array1(2,1)=44.3;array1(2,2)=12.3;array1(2,3)=1.236;array1(2,4)=12.2;array1(2,5)=9.5; 
call PrintArray(2,N,array1) 
 !  integer,dimension() FE_solver_1d
  !write(*��*) FE_solver_1d( )
  !end program FE_SOLVER
  !integer,dimension() function FE_solver_1d()
  !integer,dimension()
end program FE_SOLVER

subroutine PrintArray(m,n,array)
  implicit none
  integer m,n
  real array(m,n)
  integer length,i
  length=size(array,1) 
  do i=1,length
    print *,array(i,:)
  end do
  print *,''
end subroutine
