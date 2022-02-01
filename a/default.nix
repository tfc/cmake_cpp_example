{ stdenv, cmake, mylibc, mylibd }:

stdenv.mkDerivation {
  name = "myliba";
  propagatedBuildInputs = [ mylibc mylibd ];
  nativeBuildInputs = [ cmake ];
  src = ./.;
}
