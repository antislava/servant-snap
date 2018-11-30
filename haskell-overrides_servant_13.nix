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
    snap        =      super.callPackage ./pkgs/snap.nix { };
    servant     = ncjb (super.callPackage ./pkgs/servant_13.nix { });
    servant-client-core = ncjb (super.callPackage ./pkgs/servant-client-core_13.nix { });
    servant-server = ncjb (super.callPackage ./pkgs/servant-server_13.nix { });
    servant-client = ncjb (super.callPackage ./pkgs/servant-client_13.nix { });
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

