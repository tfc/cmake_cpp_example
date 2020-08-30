{
  description = "CMake C++ Example with modularized subprojects";

  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
    inherit (pkgs) cmake stdenv;
  in
    rec {
      lib = rec {
        a = stdenv.mkDerivation {
          name = "liba";
          buildInputs = [ c d ];
          nativeBuildInputs = [ cmake ];
          src = self + "/a";
        };

        b = stdenv.mkDerivation {
          name = "libb";
          nativeBuildInputs = [ cmake ];
          src = self + "/b";
        };

        c = stdenv.mkDerivation {
          name = "libc";
          nativeBuildInputs = [ cmake ];
          src = self + "/c";
        };

        d = stdenv.mkDerivation {
          name = "libd";
          nativeBuildInputs = [ cmake ];
          src = self + "/d";
        };
      };

      myapp = stdenv.mkDerivation {
        name = "myapp";
        buildInputs = with lib; [ a b c d ];
        nativeBuildInputs = [ cmake ];
        src = self + "/app";
      };

      defaultPackage.x86_64-linux = myapp;
    };
}
