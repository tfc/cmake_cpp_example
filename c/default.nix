{ stdenv, lib, cmake
, static ? stdenv.hostPlatform.isStatic
}:

stdenv.mkDerivation {
  name = "libc";
  nativeBuildInputs = [ cmake ];
  src = ./.;

  cmakeFlags = lib.optional (!static) "-DBUILD_SHARED_LIBS:BOOL=ON";
}
