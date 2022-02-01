{ stdenv, cmake }:

stdenv.mkDerivation {
  name = "mylibc";
  nativeBuildInputs = [ cmake ];
  src = ./.;
}
