nixpgks: compiler: pkgs:
let
  composeExtensionsList =
         pkgs.lib.fold pkgs.lib.composeExtensions (_: _: {});
  nc   = pkgs.haskell.lib.dontCheck;
    jb = pkgs.haskell.lib.doJailbreak;
  ncjb = p: nc (jb p);
  overridesCommon = self: super: {
    hspec-snap  =   jb super.hspec-snap;
    lens        = nc   super.lens;
    heist       = nc   super.heist;
    snap        = super.callPackage ./pkgs/snap.nix { };
  };
  overridesGhc86 = self: super: {
    map-syntax  = ncjb super.map-syntax;
    # servant     = ncjb super.servant;
    servant = super.callPackage ./pkgs/servant.nix { };
    servant-client-core = super.callPackage ./pkgs/servant-client-core.nix { };
    snap        = super.callPackage ./pkgs/snap.nix { };
  };
in
  composeExtensionsList [
    overridesCommon
    (if "${compiler}" >= "ghc861" then overridesGhc86  else (_: _: {}))
  ]

