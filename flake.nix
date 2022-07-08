{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    devshell.url = "github:numtide/devshell";
    nixops-plugged.url = "github:lukebfox/nixops-plugged";

    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixops-plugged,
    flake-utils,
    devshell,
    ...
  }:
    (
      flake-utils.lib.eachDefaultSystem (
        system: let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              devshell.overlay
              (final: prev: nixops-plugged.packages."${system}")
            ];
          };
        in {
          devShells.default = pkgs.devshell.mkShell {
            imports = [
              (pkgs.devshell.importTOML ./devshell.toml)
            ];
          };
        }
      )
    )
    // {
      nixopsConfigurations = {
        default = import ./nixops {inherit nixpkgs;};
      };
    };
}
