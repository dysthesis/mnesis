{
  perSystem = {
    pkgs,
    leanSource,
    ...
  }: {
    packages = rec {
      # Expose vendored Lean packages from the scoped leanPackages set.
      inherit (pkgs.leanPackages) verso subverso md4lean;

      mnesisLean = pkgs.leanPackages.buildLakePackage {
        pname = "mnesis-lean";
        version = "0.1.0";
        src = leanSource;
        leanDeps = [verso];
        lakeHash = null;
      };

      mnesis = pkgs.stdenvNoCC.mkDerivation {
        pname = "mnesis-book";
        version = "0.1.0";
        src = leanSource;
        nativeBuildInputs = [mnesisLean];
        dontConfigure = true;

        buildPhase = ''
          runHook preBuild
          export HOME="$TMPDIR"
          generate-book
          runHook postBuild
        '';

        installPhase = ''
          runHook preInstall
          mkdir -p "$out"
          cp -R _out/html-multi/. "$out/"
          runHook postInstall
        '';
      };

      default = mnesis;
    };
  };
}
