{
  perSystem = {
    pkgs,
    leanSource,
    ...
  }: {
    packages = rec {
      mnesis = pkgs.leanPackages.buildLakePackage {
        pname = "mnesis";
        version = "0.1.0";
        src = leanSource;
      };

      # Vendor verso since nixpkgs does not have it in their pkgs.leanPackages

      default = mnesis;
    };
  };
}
