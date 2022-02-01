let
  sources = import ./nix/sources.nix { };

  overlayFunction = final: prev: rec {
    myliba = final.callPackage ./a { };
    mylibb = final.callPackage ./b { };
    mylibc = final.callPackage ./c { };
    mylibd = final.callPackage ./d { };
    myapp = final.callPackage ./app { };
  };

  bigA = final: prev: {
    myliba = prev.myliba.overrideAttrs (old: {
      postPatch = ''
        sed -i 's/"a"/"A"/' main.cpp
      '';
    });
  };

  bigC = final: prev: {
    mylibc = prev.mylibc.overrideAttrs (old: {
      postPatch = ''
        sed -i 's/"c"/"C"/' main.cpp
      '';
    });
  };

  pkgs = import sources.nixpkgs {
    overlays = [
      overlayFunction
      bigA
      bigC
    ];
  };
  inherit (pkgs.lib) recurseIntoAttrs;
in
recurseIntoAttrs rec {
  lib = recurseIntoAttrs rec {
    inherit (pkgs)
      myliba
      mylibb
      mylibc
      mylibd
      ;
  };
  inherit (pkgs) myapp;
}
