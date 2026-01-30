{
  description = "Flake for TDA384 Principles of Concurrent Programming";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    inherit (nixpkgs) lib;
    forAllSystems = lib.genAttrs lib.systems.flakeExposed;
  in {
    packages = forAllSystems (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      tsim = pkgs.callPackage ./packages/tsim.nix {};
      tsim_extractor = pkgs.callPackage ./packages/tsim_extractor.nix {};
    });

    nixosModules.default = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        erlang
        jdk25
        self.packages.${pkgs.stdenv.hostPlatform.system}.tsim
        self.packages.${pkgs.stdenv.hostPlatform.system}.tsim_extractor
      ];
    };
  };
}
