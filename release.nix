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
  myapp-static = pkgs.pkgsStatic.myapp;
  myapp-win64 = pkgs.pkgsCross.mingwW64.myapp;
  myapp-aarch64 = pkgs.pkgsCross.aarch64-multiplatform.myapp;
}
