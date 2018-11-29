{ mkDerivation, aeson, attoparsec, base, base-compat, bifunctors
, bytestring, Cabal, cabal-doctest, case-insensitive, deepseq
, doctest, fetchgit, hspec, hspec-discover, http-api-data
, http-media, http-types, mmorph, mtl, network-uri, QuickCheck
, quickcheck-instances, singleton-bool, stdenv, string-conversions
, tagged, text, transformers, vault
}:
mkDerivation {
  pname = "servant";
  version = "0.15";
  src = fetchgit {
    url = "https://github.com/haskell-servant/servant";
    sha256 = "1lnyj7p60w0j6y1ijj079n3pakc0jzjk6vjnv815009pb09nnd7m";
    rev = "7bbcfb21e7299245e0312cc880f044c54e5aa66f";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/servant; echo source root reset to $sourceRoot";
  setupHaskellDepends = [ base Cabal cabal-doctest ];
  libraryHaskellDepends = [
    aeson attoparsec base base-compat bifunctors bytestring
    case-insensitive deepseq http-api-data http-media http-types mmorph
    mtl network-uri QuickCheck singleton-bool string-conversions tagged
    text transformers vault
  ];
  testHaskellDepends = [
    aeson base base-compat bytestring doctest hspec mtl QuickCheck
    quickcheck-instances string-conversions text transformers
  ];
  testToolDepends = [ hspec-discover ];
  homepage = "http://haskell-servant.readthedocs.org/";
  description = "A family of combinators for defining webservices APIs";
  license = stdenv.lib.licenses.bsd3;
}
