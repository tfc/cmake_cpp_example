{ stdenv, lib, cmake, libc, libd
, static ? stdenv.hostPlatform.isStatic
}:

stdenv.mkDerivation {
  name = "liba";

  # this is overcomplicated but interesting for learning purposes:
  # static builds have no visible reference to the original nix store
  # of any deps.
  # dynamic builds at least contain a reference to lib C
  buildInputs = lib.optional (!static) libc;
  propagatedBuildInputs = [ libd ] ++ lib.optional (static) libc;

  nativeBuildInputs = [ cmake ];
  src = ./.;

  cmakeFlags = lib.optional (!static) "-DBUILD_SHARED_LIBS:BOOL=ON";
}
