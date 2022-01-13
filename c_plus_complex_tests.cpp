#include <iostream>
#include <complex.h>
int main(int argc, char* argv[]){
  _Complex double a;
  __complex__ double b;
  _Complex short int y;
  std::cout<<"a = "<<a<<std::endl;
  std::cout<<"a = "<<b<<std::endl;
  std::cout<<"a = "<<y<<std::endl;
  std::cout<<"....."<<std::endl;
}