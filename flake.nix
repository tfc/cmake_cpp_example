{
  description = "bla";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs {};
    in
      {
        packages.x86_64-linux.default = pkgs.myapp;
      };
}
