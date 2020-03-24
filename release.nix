with import <nixpkgs> {};

rec {
  recurseForDerivations = true;
  lib = rec {
    recurseForDerivations = true;
    a = stdenv.mkDerivation {
      name = "liba";
      buildInputs = [ c d ];
      nativeBuildInputs = [ cmake ];
      src = ./a;
    };
    b = stdenv.mkDerivation {
      name = "libb";
      nativeBuildInputs = [ cmake ];
      src = ./b;
    };
    c = stdenv.mkDerivation {
      name = "libc";
      nativeBuildInputs = [ cmake ];
      src = ./c;
    };
    d = stdenv.mkDerivation {
      name = "libd";
      nativeBuildInputs = [ cmake ];
      src = ./d;
    };
  };
  myapp = stdenv.mkDerivation {
    name = "myapp";
    buildInputs = with lib; [ a b c d ];
    nativeBuildInputs = [ cmake ];
    src = ./app;
  };
}
