with builtins.fromJSON (builtins.readFile ./nixpkgs.git.json);
builtins.fetchGit { inherit url rev; }
