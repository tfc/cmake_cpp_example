{ stdenv, cmake, libc, libd }:

stdenv.mkDerivation {
  name = "liba";
  buildInputs = [ libc libd ];
  nativeBuildInputs = [ cmake ];
  src = ./.;
}
