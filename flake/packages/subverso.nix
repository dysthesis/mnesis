{
  buildLakePackage,
  src,
  ...
}:
buildLakePackage {
  inherit src;
  version = src.revision;

  pname = "lean4-subverso";
  leanPackageName = "subverso";

  meta = {
    description = "Verso's Library for Subprocesses";
    homepage = "https://github.com/leanprover/subverso";
  };
}
