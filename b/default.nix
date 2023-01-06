{ stdenv, cmake }:

stdenv.mkDerivation {
  name = "libb";
  nativeBuildInputs = [ cmake ];
  src = ./.;
}

