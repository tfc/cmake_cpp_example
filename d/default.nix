{ stdenv, cmake }:

stdenv.mkDerivation {
  name = "mylibd";
  nativeBuildInputs = [ cmake ];
  src = ./.;
}
