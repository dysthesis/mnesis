{
  description = "A Verso book for the Mnesis project.";

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      # We decompose this flake into separate modules with different
      # responsibilities. They are then imported below, recombined.
      imports = [
        ./flake/shell
        ./flake/packages
        ./flake/formatting

        inputs.treefmt-nix.flakeModule
      ];

      # The _module.args attribute defines variables that are made accessible
      # across any flake modules as arguments.
      perSystem = {
        system,
        lib,
        ...
      }: let
        npins = import ./flake/npins;
      in {
        _module.args = {
          # Overlay pkgs.leanPackages with dependencies that are not present in
          # upstream nixpkgs
          pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [
              (_: prev: {
                leanPackages = prev.leanPackages.overrideScope (self: _: {
                  md4lean = self.callPackage ./flake/packages/md4lean.nix {
                    src = npins.md4lean;
                  };
                  subverso = self.callPackage ./flake/packages/subverso.nix {
                    src = npins.subverso;
                  };
                  verso = self.callPackage ./flake/packages/verso.nix {
                    src = npins.verso;
                  };
                });
              })
            ];
          };

          # Define a source of truth for where the source code for Lean lies
          leanSource = lib.cleanSourceWith {
            src = ./.;
            filter = path: type: let
              relPath = lib.removePrefix (toString ./. + "/") path;
              baseName = baseNameOf path;
            in
              lib.cleanSourceFilter path type
              && !lib.hasPrefix ".lake" relPath
              && !lib.hasPrefix "_out" relPath
              && !lib.hasPrefix ".direnv" relPath
              && !lib.hasPrefix ".jj" relPath
              && baseName != "result";
          };

          # Expose npins sources for non-Flake dependencies
          inherit npins;
        };
      };

      # Here, we define the architectures which we support.
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    };

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };
}
