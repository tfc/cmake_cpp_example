{ stdenv, cmake }:

stdenv.mkDerivation {
  name = "libd";
  nativeBuildInputs = [ cmake ];
  src = ./.;
}
