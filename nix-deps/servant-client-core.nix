{ mkDerivation, aeson, base, base-compat, base64-bytestring
, bytestring, containers, deepseq, exceptions, fetchgit, free
, generics-sop, hspec, hspec-discover, http-media, http-types
, network-uri, QuickCheck, safe, servant, stdenv, template-haskell
, text, transformers
}:
mkDerivation {
  pname = "servant-client-core";
  version = "0.15";
  src = fetchgit {
    url = "https://github.com/haskell-servant/servant";
    sha256 = "1lnyj7p60w0j6y1ijj079n3pakc0jzjk6vjnv815009pb09nnd7m";
    rev = "7bbcfb21e7299245e0312cc880f044c54e5aa66f";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/servant-client-core; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    aeson base base-compat base64-bytestring bytestring containers
    deepseq exceptions free generics-sop http-media http-types
    network-uri safe servant template-haskell text transformers
  ];
  testHaskellDepends = [ base base-compat deepseq hspec QuickCheck ];
  testToolDepends = [ hspec-discover ];
  homepage = "http://haskell-servant.readthedocs.org/";
  description = "Core functionality and class for client function generation for servant APIs";
  license = stdenv.lib.licenses.bsd3;
}
