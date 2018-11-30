{ mkDerivation, aeson, aeson-compat, attoparsec, base, base-compat
, bytestring, Cabal, cabal-doctest, case-insensitive, doctest
, fetchgit, hspec, hspec-discover, http-api-data, http-media
, http-types, mmorph, mtl, natural-transformation, network-uri
, QuickCheck, quickcheck-instances, singleton-bool, stdenv
, string-conversions, tagged, text, vault
}:
mkDerivation {
  pname = "servant";
  version = "0.13.0.1";
  src = fetchgit {
    url = "https://github.com/haskell-servant/servant";
    sha256 = "19pivi2a943cjzmvi8ipbj3i42vs382g2fq1y08xa64j4w86sxni";
    rev = "0f0c8f7f900670a64336d7ec1cb98c45cea90c52";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/servant; echo source root reset to $sourceRoot";
  setupHaskellDepends = [ base Cabal cabal-doctest ];
  libraryHaskellDepends = [
    aeson attoparsec base base-compat bytestring case-insensitive
    http-api-data http-media http-types mmorph mtl
    natural-transformation network-uri singleton-bool
    string-conversions tagged text vault
  ];
  testHaskellDepends = [
    aeson aeson-compat attoparsec base base-compat bytestring doctest
    hspec QuickCheck quickcheck-instances string-conversions text
  ];
  testToolDepends = [ hspec-discover ];
  homepage = "http://haskell-servant.readthedocs.org/";
  description = "A family of combinators for defining webservices APIs";
  license = stdenv.lib.licenses.bsd3;
}
