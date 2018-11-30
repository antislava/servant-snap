{ mkDerivation, base, base-compat, base64-bytestring, bytestring
, containers, deepseq, exceptions, fetchgit, generics-sop, hspec
, hspec-discover, http-api-data, http-media, http-types, mtl
, network-uri, QuickCheck, safe, servant, stdenv, text
}:
mkDerivation {
  pname = "servant-client-core";
  version = "0.13.0.1";
  src = fetchgit {
    url = "https://github.com/haskell-servant/servant";
    sha256 = "19pivi2a943cjzmvi8ipbj3i42vs382g2fq1y08xa64j4w86sxni";
    rev = "0f0c8f7f900670a64336d7ec1cb98c45cea90c52";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/servant-client-core; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    base base-compat base64-bytestring bytestring containers exceptions
    generics-sop http-api-data http-media http-types mtl network-uri
    safe servant text
  ];
  testHaskellDepends = [ base base-compat deepseq hspec QuickCheck ];
  testToolDepends = [ hspec-discover ];
  homepage = "http://haskell-servant.readthedocs.org/";
  description = "Core functionality and class for client function generation for servant APIs";
  license = stdenv.lib.licenses.bsd3;
}
