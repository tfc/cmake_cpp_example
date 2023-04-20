{ stdenv, cmake, libc, libd }:

stdenv.mkDerivation {
  name = "liba";
  buildInputs = [ libc ];
  # this is a header-only dependency
  propagatedBuildInputs = [ libd ];
  nativeBuildInputs = [ cmake ];
  src = ./.;
}
