{
  python3Packages,
  fetchFromGitHub,
}:
python3Packages.buildPythonPackage {
  pname = "tsim_extractor";
  version = "0-unstable-2026-01-30";

  src = fetchFromGitHub {
    owner = "Toireosu";
    repo = "tsim_extractor";
    rev = "8476ef2bd8207361c581d39947ae023cf6918fcc";
    hash = "sha256-lr5zdypb6FKtWCxI13l1ZkrVwsf5XrCyRwxSCf06ITY=";
  };

  format = "setuptools";

  preBuild = ''
    cat > setup.py << EOF
    from setuptools import setup

    setup(
      name='tsim_extractor',
      entry_points={
        'console_scripts': [
          'tsim_extractor = tsim_extractor:main',
        ]
      }
    )
    EOF
  '';
}
