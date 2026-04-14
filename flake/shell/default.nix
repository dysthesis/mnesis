{
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      name = "mnesis-dev";
      packages = with pkgs; [
        # Lean tooling
        lean4

        # Nix tooling
        nil
        alejandra
        statix
        deadnix
      ];
    };
  };
}
