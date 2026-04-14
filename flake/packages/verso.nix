{
  buildLakePackage,
  src,
  plausible,
  subverso,
  md4lean,
  ...
}:
buildLakePackage {
  inherit src;
  version = src.revision;

  pname = "lean4-verso";
  leanPackageName = "verso";

  # Upstream default targets include demo and test projects that shell out to
  # `elan` to build cross-version example projects. Package the core libraries
  # and CLI tools only.
  buildTargets = [
    # Downstream executables need Verso's native artifacts prebuilt, otherwise
    # Lake tries to write them into the read-only Nix store.
    "VersoUtil:static"
    "Verso:static"
    "MultiVerso:static"
    "VersoSearch:static"
    "VersoBlog:static"
    "VersoManual:static"
    "VersoTutorial:static"
    "VersoLiterate:static"
    "VersoLiterateCode:static"
    "+Verso.Output.Html.CssVars:o"
    "+Verso.Output.Html.KaTeX:o"
    "verso"
    "verso-literate"
    "verso-html"
    "verso-literate-html"
    "verso-literate-plan"
  ];

  leanDeps = [
    plausible
    subverso
    md4lean
  ];

  meta = {
    description = "Lean documentation authoring tool";
    homepage = "https://github.com/leanprover/verso";
  };
}
