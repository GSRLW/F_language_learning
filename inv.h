/**
 * @file inv.h
 * @author your name (you@domain.com)
 * @brief invert copy from https://www.scratchapixel.com
 * @version 0.1
 * @date 2021-12-30
 * 
 * @note 这一段抄的代码，自己猜测了数据类型及对应的构造函数等，但是还不能正确work
 * 
 * @copyright Copyright (c) 2021
 * 
 */

#ifndef _INCLUDE_MATRIX_INV_
#define _INCLUDE_MATRIX_INV_

#include <iostream>
#include <cmath>
#include <iomanip>

template <typename T, int N>
class Matrix
{
private:
  /* data */
  T m[N][N];

public:
  Matrix(/* args */);
  Matrix(Matrix<T, N> &B); //copy constructor
  ~Matrix();
  Matrix<T, N> &invert();
  friend Matrix<T, N> operator*(const Matrix<T, N>& A,const Matrix<T, N>& B);
  void printClass();
  T &operator()(int i, int j)
  {
    return m[i][j];
  }

  void setAll(T &&v)
  {
    for (int i = 0; i < N; i++)
    {
      for (int j = 0; j < N; j++)
      {
        m[i][j] = v;
      }
    }
  }
  void setsysIJ(int i, int j, T &&v)
  {
    if (i >= N || j >= N)
      std::abort;
    m[i][j] = v;
    if (i != j)
      m[j][i] = v;
  }
};

template <typename T, int N>
void Matrix<T, N>::printClass()
{
  for (int i = 0; i < N; i++)
  {
    for (int j = 0; j < N; j++)
    {
      std::cout<< std::setw(14) << std::setprecision(8) << m[i][j] << std::flush;
    }
    std::cout << std::flush << std::endl;
  }
}

template <typename T, int N>
Matrix<T, N>::Matrix(/* args */)
{
  setAll((T)0.0);
  for (int i = 0; i < N; i++)
  {
    m[i][i] = (T)1.0;
  }
}

template <typename T, int N>
Matrix<T, N>::Matrix(Matrix<T, N> &B) //copy
{
  for (int i = 0; i < N; i++)
  {
    for (int j = 0; j < N; j++)
    {
      m[i][j] = B.m[i][j];
    }
  }
}

template <typename T, int N>
Matrix<T, N>::~Matrix()
{
}

template <typename T, int N>
Matrix<T, N> &Matrix<T, N>::invert()
{
  Matrix<T, N> mat;
  for (unsigned column = 0; column < N; ++column)
  {
    // Swap row in case our pivot point is not working
    if (m[column][column] == 0)
    {
      unsigned big = column;
      for (unsigned row = 0; row < N; ++row)
        if (fabs(m[row][column]) > fabs(m[big][column]))
          big = row;
      // Print this is a singular matrix, return identity ?
      if (big == column)
        fprintf(stderr, "Singular matrix\n");
      // Swap rows
      else
        for (unsigned j = 0; j < N; ++j)
        {
          std::swap(m[column][j], m[big][j]);
          std::swap(mat.m[column][j], mat.m[big][j]);
        }
    }
    // Set each row in the column to 0
    for (unsigned row = 0; row < N; ++row)
    {
      if (row != column)
      {
        T coeff = m[row][column] / m[column][column];
        if (coeff != 0)
        {
          for (unsigned j = 0; j < N; ++j)
          {
            m[row][j] -= coeff * m[column][j];
            mat.m[row][j] -= coeff * mat.m[column][j];
            // std::cout << "aa---" << row << "," << j << "---" << mat.m[row][j] << "++" << coeff << std::endl;
          }
          // Set the element to 0 for safety
          m[row][column] = 0;
        }
      }
    }
    std::cout << "column = " << column << std::endl;
    for (int i = 0; i < N; i++)
    {
      for (int j = 0; j < N; j++)
      {
        std::cout << std::setw(14) << std::setprecision(8) << m[i][j]  << std::flush;
      }
      std::cout << " || \t";
      for (int j = 0; j < N; j++)
      {
        std::cout << std::setw(14) << std::setprecision(8) << mat.m[i][j]  << std::flush;
      }
      std::cout << std::endl
                << std::flush;
    }
  }
  // Set each element of the diagonal to 1
  for (unsigned row = 0; row < N; ++row)
  {
    for (unsigned column = 0; column < N; ++column)
    {
      mat.m[row][column] /= m[row][row];
    }
  }
  *this = mat;
  return *this;
}

  template <typename T, int N>
  Matrix<T, N> operator*(const Matrix<T, N>& A, const Matrix<T, N>& B){
    Matrix<T, N> mat;
    
    return mat;
  }
#endif