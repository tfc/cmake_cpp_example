#include <a.hpp>
#include <c.hpp>

#include <algorithm>
#include <cctype>

namespace liba {

std::string function_a() { return "a"; }

std::string function_c() { return libc::function_c(); }

}
