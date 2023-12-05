let
  sources = import ./nix/sources.nix {};
  pkgs = import sources.nixpkgs {
    overlays = [ (import ./overlay.nix) ];
  };
in
{
  inherit (pkgs)
    liba
    libb
    libc
    libd
    myapp;

  myapp-patched =
    let
      patchIt = drv: inStr: outStr: drv.overrideAttrs (_: {
        patchPhase = ''
          substituteInPlace main.cpp \
            --replace '"${inStr}"' '"${outStr}"'
        '';
      });
    in
    pkgs.myapp.override {
      liba = (patchIt pkgs.liba "a" "x").override {
        libc = patchIt pkgs.libc "C" "z";
        libd = patchIt pkgs.libd "d" "w";
      };
      libb = patchIt pkgs.libb "b" "y";
    };

  myapp-static = pkgs.pkgsStatic.myapp;
  myapp-win64 = pkgs.pkgsCross.mingwW64.myapp;
  myapp-aarch64 = pkgs.pkgsCross.aarch64-multiplatform.myapp;

  devShell = pkgs.mkShell {
    inputsFrom = with pkgs; [ liba libb libc libd myapp ];
    nativeBuildInputs = [ pkgs.graphviz ];
  };
}
