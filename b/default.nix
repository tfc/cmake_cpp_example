{ stdenv, cmake }:

stdenv.mkDerivation {
  name = "mylibb";
  nativeBuildInputs = [ cmake ];
  src = ./.;
}
