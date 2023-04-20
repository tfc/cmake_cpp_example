{ stdenv, cmake, liba, libb }:

stdenv.mkDerivation {
  name = "myapp";
  buildInputs = [ liba libb ];
  nativeBuildInputs = [ cmake ];
  src = ./.;
}
