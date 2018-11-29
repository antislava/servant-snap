{ mkDerivation, aeson, async, attoparsec, base, bytestring, cereal
, clientsession, configurator, containers, deepseq, directory
, directory-tree, dlist, fail, fetchgit, filepath, hashable, heist
, http-streams, HUnit, lens, lifted-base, map-syntax, monad-control
, mtl, mwc-random, pwstore-fast, QuickCheck, smallcheck, snap-core
, snap-server, stdenv, stm, syb, test-framework
, test-framework-hunit, test-framework-quickcheck2
, test-framework-smallcheck, text, time, transformers
, transformers-base, unordered-containers, xmlhtml
}:
mkDerivation {
  pname = "snap";
  version = "1.1.1.0";
  src = fetchgit {
    url = "https://github.com/snapframework/snap/";
    sha256 = "1npcbhfshdql0h3j7vv79xvx892dlgp0qkflwhp93a6bjqig3qdb";
    rev = "30a7e57f499c2b99568d8cfd194c1ba333623d84";
    fetchSubmodules = true;
  };
  libraryHaskellDepends = [
    aeson attoparsec base bytestring cereal clientsession configurator
    containers directory directory-tree dlist fail filepath hashable
    heist lens lifted-base map-syntax monad-control mtl mwc-random
    pwstore-fast snap-core snap-server stm text time transformers
    transformers-base unordered-containers xmlhtml
  ];
  testHaskellDepends = [
    aeson async attoparsec base bytestring cereal clientsession
    configurator containers deepseq directory directory-tree dlist fail
    filepath hashable heist http-streams HUnit lens lifted-base
    map-syntax monad-control mtl mwc-random pwstore-fast QuickCheck
    smallcheck snap-core snap-server stm syb test-framework
    test-framework-hunit test-framework-quickcheck2
    test-framework-smallcheck text time transformers transformers-base
    unordered-containers xmlhtml
  ];
  homepage = "http://snapframework.com/";
  description = "Top-level package for the Snap Web Framework";
  license = stdenv.lib.licenses.bsd3;
}
