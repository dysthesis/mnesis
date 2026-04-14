{
  perSystem = {
    pkgs,
    leanSource,
    ...
  }: {
    packages = rec {
      # Expose vendored Lean packages from the scoped leanPackages set.
      inherit (pkgs.leanPackages) verso subverso md4lean;

      mnesis = pkgs.leanPackages.buildLakePackage {
        pname = "mnesis";
        version = "0.1.0";
        src = leanSource;
        leanDeps = [verso];
      };

      default = mnesis;
    };
  };
}
