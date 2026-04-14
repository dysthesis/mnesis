{
  description = "A protocol for personal data management.";

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      # We decompose this flake into separate modules with different
      # responsibilities. They are then imported below, recombined.
      imports = [
        ./flake/shell
        ./flake/packages
      ];

      # The _module.args attribute defines variables that are made accessible
      # across any flake modules as arguments.
      perSystem = _: {
        _module.args = {
          # Define a source of truth for where the source code for Lean lies
          leanSource = ./.;
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
  };
}
