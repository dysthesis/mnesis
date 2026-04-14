{
  perSystem = {pkgs, ...}: {
    devShells.default = pkgs.mkShell {
      name = "mnesis-dev";
      packages = with pkgs; [
        # Lean tooling
        leanPackages.lean4
        leanPackages.verso

        # Nix tooling
        nil
        alejandra
        statix
        deadnix
        npins
        just
      ];
    };
  };
}
