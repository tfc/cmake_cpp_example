{ stdenv, cmake, myliba, mylibb, mylibc, mylibd }:

stdenv.mkDerivation {
  name = "myapp";
  buildInputs = [ myliba mylibb ];
  nativeBuildInputs = [ cmake ];
  src = ./.;
}
