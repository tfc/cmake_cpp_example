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
}
