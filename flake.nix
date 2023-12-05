{
  description = "CMake abcd app";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

  outputs = { self, nixpkgs }:
    let
      # Change this to aarch64-linux or -darwin for other systems
      # flake-utils or flake-parts can be used to automate this
      system = "x86_64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ (import ./overlay.nix) ];
      };
    in
      {
        packages.${system}.default = pkgs.myapp;

        devShells.${system}.default = pkgs.mkShell {
          inputsFrom = [ self.packages.${system}.default ];
          # we wouldn't need the whole devShells definition if we
          # wouldn't add additional packages
          nativeBuildInputs = [
            pkgs.graphviz
            pkgs.jq
          ];
        };

        # if the binary name was the same as the package name, this
        # item would work implicitly
        apps.${system}.default = {
          type = "app";
          program = "${pkgs.myapp}/bin/MyApp";
        };
      };
}
