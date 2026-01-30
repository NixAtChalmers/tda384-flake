{
  description = "Flake for TDA384 Principles of Concurrent Programming";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    inherit (pkgs) lib stdenv;

  in {
    packages.${system} = {
      tsim = pkgs.callPackage ./packages/tsim.nix {};
      tsim_extractor = pkgs.callPackage ./packages/tsim_extractor.nix {};
    };

    nixosModules.default = {
      environment.systemPackages = with pkgs; [
        erlang
        jdk25
        self.packages.${system}.tsim
        self.packages.${system}.tsim_extractor
      ];
    };
  };
}
