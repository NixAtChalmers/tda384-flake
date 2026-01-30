{
  fetchurl,
  stdenv,
  libxaw,
  libxt,
  libxmu,
  libx11,
  libxext,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "tsim";
  version = "0.84";

  src = fetchurl {
    url = "https://www.cse.chalmers.se/edu/course.2024/TDA384_LP1/files/labs/tsim-0.84.tgz";
    hash = "sha256-MzYsG8vZIVM/F9sOF4BbJp517RJN8hoHCFgIfpOFMjk=";
  };

  nativeBuildInputs = [
    libxaw
    libxt
    libxmu
    libx11
    libxext
  ];
})
