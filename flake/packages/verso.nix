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
    "VersoUtil"
    "Verso"
    "MultiVerso"
    "VersoSearch"
    "VersoBlog"
    "VersoManual"
    "VersoTutorial"
    "VersoLiterate"
    "VersoLiterateCode"
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
