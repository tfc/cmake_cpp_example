{ stdenv, lib, cmake, liba, libb, static ? false }:

stdenv.mkDerivation {
  name = "myapp";
  buildInputs = [ liba libb ];
  nativeBuildInputs = [ cmake ];
  src = ./.;

  cmakeFlags = lib.optional (!static) "-DBUILD_SHARED_LIBS:BOOL=ON";
}
