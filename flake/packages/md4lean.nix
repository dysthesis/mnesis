{
  buildLakePackage,
  src,
  ...
}:
buildLakePackage {
  inherit src;
  version = src.revision;

  pname = "lean4-md4lean";
  leanPackageName = "MD4Lean";

  # Verso executables need MD4Lean's native object export available from the
  # dependency itself, otherwise Lake tries to compile it inside /nix/store.
  buildTargets = ["+MD4Lean:c.o" "MD4Lean:shared"];

  meta = {
    description = "a Lean wrapper for the MD4C Markdown parser";
    homepage = "https://github.com/acmepjz/md4lean";
  };
}
