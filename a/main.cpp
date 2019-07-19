#include <a.hpp>
#include <c.hpp>

#include <algorithm>
#include <cctype>

namespace liba {

std::string function_a() { return "a"; }

std::string function_c() {
  auto c{libc::function_c()};
  std::transform(std::begin(c), std::end(c), std::begin(c),
      [](unsigned char c){ return std::tolower(c); });
  return c;
}

}
