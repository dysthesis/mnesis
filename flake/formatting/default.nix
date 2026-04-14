{
  perSystem = _: {
    treefmt = {
      # Used to find the project root
      projectRootFile = "flake.nix";
      programs = {
        alejandra.enable = true; # Nix formatting
        mdformat = {
          enable = true;
          plugins = p:
            with p; [
              mdformat-gfm
              mdformat-footnote
            ];
          settings.wrap = 80;
        };
      };
    };
  };
}
