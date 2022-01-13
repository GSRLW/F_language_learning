
#include <iostream>
#include <iomanip>
#include "inv.h"

int main(int argc, char* argv[]){
  Matrix<double,5> A,B;
  // A.setsysIJ(0,0,5.222014);
  // A.setsysIJ(0,1,-6.115638);
  // A.setsysIJ(0,2,0.8936235);
  // A.setsysIJ(1,1,13.95403);
  // A.setsysIJ(1,2,-7.838395);
  // A.setsysIJ(2,2,15.55442);
  // A.setsysIJ(2,3,-10.08298);
  // A.setsysIJ(2,4,1.473337);
  // A.setsysIJ(3,3,23.00632);
  // A.setsysIJ(3,4,-12.92333);
  // A.setsysIJ(4,4,11.45000);
A.setsysIJ(4,4,2.0);
A.setsysIJ(3,3,3.0);
A.setsysIJ(2,2,3.0);
A.setsysIJ(1,1,3.0);
A.setsysIJ(0,0,2.0);
A.setsysIJ(3,4,-1.0);
A.setsysIJ(2,3,-1.0);
A.setsysIJ(2,1,-1.0);
A.setsysIJ(1,0,-1.0);
  A.printClass(); 
  // B=A;
  // std::cout<<"----------------------------\n";
  // B.printClass(); 
  A.invert();
  std::cout<<"----------------------------\n";
  A.printClass();
  std::cout<<"-------------------------++-\n";
  (A*B).printClass();
  return 0;
}