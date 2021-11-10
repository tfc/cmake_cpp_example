{
  description = "Modular CMake Project Example with Nix";

  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-21.05;

  outputs = { self, nixpkgs }: rec {
    packages.x86_64-linux = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      inherit (pkgs) cmake stdenv;
    in
    rec {
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
      myapp = stdenv.mkDerivation {
        name = "myapp";
        buildInputs = [ a b c d ];
        nativeBuildInputs = [ cmake ];
        src = ./app;
      };
    };

    defaultPackage.x86_64-linux = packages.x86_64-linux.myapp;
  };
}
