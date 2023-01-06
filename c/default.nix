{ stdenv, cmake }:

stdenv.mkDerivation {
  name = "libc";
  nativeBuildInputs = [ cmake ];
  src = ./.;
}
