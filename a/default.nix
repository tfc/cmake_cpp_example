{ stdenv, lib, cmake, libc, libd, static ? false }:

stdenv.mkDerivation {
  name = "liba";
  buildInputs = [ libc ];
  # this is a header-only dependency
  propagatedBuildInputs = [ libd ];
  nativeBuildInputs = [ cmake ];
  src = ./.;

  cmakeFlags = lib.optional (!static) "-DBUILD_SHARED_LIBS:BOOL=ON";
}
