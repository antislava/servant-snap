{ compiler ? "default" , haskell-overrides ? ./haskell-overrides.nix }:
# USAGE: nix-shell ./release.nix --argstr compiler ghc844 --arg haskell-overrides ./haskell-overrides_servant_13.nix -A servant-snap-ex-no-check.env
let
  # NIXPKGS
  nixpkgs = import ./nix/nixpkgs.nix;

  # CONFIG
  config = {
    allowBroken = true;
    packageOverrides = pkgs:
    { haskell = pkgs.haskell // {
        packages = pkgs.haskell.packages // {
          "${compiler}" = pkgs.haskell.packages."${compiler}".override {
            overrides =
              import haskell-overrides nixpkgs compiler pkgs;
              # import ./haskell-overrides.nix nixpkgs compiler pkgs;
          };
        };
      };
    };
  };

  pkgs = import nixpkgs { inherit config; };
  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};
in with pkgs.haskell.lib;
rec {
  servant-snap = haskellPackages.callPackage ./default.nix {};
  servant-snap-no-check = dontCheck servant-snap;
  servant-snap-ex = haskellPackages.callPackage ./default-examples.nix {};
  servant-snap-ex-no-check = dontCheck servant-snap-ex;
}
