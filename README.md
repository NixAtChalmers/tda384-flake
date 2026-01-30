# TDA384 Flake

Nix flake for TDA384 Principles of Concurrent Programming course.

Includes Java, Erlang, tsim and [tsim_extractor](https://github.com/Toireosu/tsim_extractor). Will be updated with other packages later in the course.

## Installation

Add the flake input to your `flake.nix`:

```nix
{
  inputs.tda384 = {
    url = "github:NixAtChalmers/tda384-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };
}
```

Add the system module to `configuration.nix` which will install the packages:

```nix
{ pkgs, inputs, ... }:
{
  imports = [
    inputs.tda384.nixosModules.default
  ];
}
```

Rebuild your system, you can now start Visual Studio Code and everything should
be set up for you.
