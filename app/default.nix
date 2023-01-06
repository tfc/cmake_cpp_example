{ stdenv, cmake, liba, libb, libc, libd }:

stdenv.mkDerivation {
  name = "myapp";
  buildInputs = [ liba libb libc libd ];
  nativeBuildInputs = [ cmake ];
  src = ./.;
}
