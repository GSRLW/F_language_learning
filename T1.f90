subroutine generate_M_T_1D(left,right,h_partition,basis_type)
        use generate_M_T    !这里建议写only
	real,intent(in)::left,right,h_partition
	integer,intent(in)::basis_type
integer::i,N
real::h
h=h_partition
if(basis_type==101)then
   N=(right-left)/h;
   allocate(M(1,N+1),T(2,N))   ! 配对
   M(:,:)=0
   T(:,:)=0
   do i=1,N+1
       M(1,i)=left+(i-1)*h;       
   enddo
   do i=1,N
       T(1,i)=i;    
       T(2,i)=i+1;
   enddo  
endif
	end subroutine generate_M_T_1D

	program main
        use generate_M_T,only : printMT
	implicit none
call generate_M_T_1D(0.,1.,0.25,101)
call printMT
	end program main