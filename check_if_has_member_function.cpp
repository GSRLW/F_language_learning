/**
 * @file check_if_has_member_function.cpp
 * @author your name (you@domain.com)
 * @brief 网上找的示例代码，以宏函数的形式以支持代码复用，用于判断是否存在某一成员函数。
 * @version 0.1
 * @date 2022-01-10
 * 
 * @copyright Copyright (c) 2022
 * 
 * @note 此代码使用场景很少， 因为大部分时候不存在某成员函数直接编译期间报错即可。模板相关可能会需要
 * 
 */

#include <iostream>

#define HAS_MEMBER(member)\
template<typename T,typename ...Args>struct has_member_##member\
{ \
private:\
  template<typename U> static auto Check(int) -> decltype(std::declval<U>().member(std::declval<Args>()...), std::true_type()); \
  template<typename U> static auto Check(...) -> decltype(std::false_type()); \
public: \
static const bool value = std::is_same<decltype(Check<T>(0)),std::true_type>::value; \
}; \

using namespace std;

class AAA
{
private:
    /* data */
public:
    AAA(/* args */);
    ~AAA();
    // template<typename ... XX>
    // void AAB(string& a, XX ... rest){
    //     std::cout<<"a="<<a<<std::endl;

    // }
    template<class = typename std::enable_if<std::is_class<AAA>::value>::type >
    void AAB(string a){
        std::cout<<"HELO world\n";
    }
};

AAA::AAA(/* args */)
{
}

AAA::~AAA()
{
}
HAS_MEMBER(AAB);
int main(){
    AAA as;
    // if(has_member_AAB<AAA, string, int >::value){
        as.AAB("a");
    // }

    return 0;
}