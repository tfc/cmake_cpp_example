#include <a.hpp>
#include <b.hpp>

#include <iostream>

int main() {
  std::cout << liba::function_a()
            << libb::function_b()
            << liba::function_c()
            << libd::function_d()
            << '\n';
}
