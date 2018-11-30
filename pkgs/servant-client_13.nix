{ mkDerivation, aeson, attoparsec, base, base-compat, bytestring
, containers, deepseq, exceptions, fetchgit, generics-sop, hspec
, hspec-discover, http-api-data, http-client, http-client-tls
, http-media, http-types, HUnit, monad-control, mtl, network
, QuickCheck, semigroupoids, servant, servant-client-core
, servant-server, stdenv, stm, text, time, transformers
, transformers-base, transformers-compat, wai, warp
}:
mkDerivation {
  pname = "servant-client";
  version = "0.13.0.1";
  src = fetchgit {
    url = "https://github.com/haskell-servant/servant";
    sha256 = "19pivi2a943cjzmvi8ipbj3i42vs382g2fq1y08xa64j4w86sxni";
    rev = "0f0c8f7f900670a64336d7ec1cb98c45cea90c52";
    fetchSubmodules = true;
  };
  postUnpack = "sourceRoot+=/servant-client; echo source root reset to $sourceRoot";
  libraryHaskellDepends = [
    aeson attoparsec base base-compat bytestring containers exceptions
    http-client http-client-tls http-media http-types monad-control mtl
    semigroupoids servant-client-core stm text time transformers
    transformers-base transformers-compat
  ];
  testHaskellDepends = [
    aeson base base-compat bytestring containers deepseq generics-sop
    hspec http-api-data http-client http-media http-types HUnit mtl
    network QuickCheck servant servant-client-core servant-server text
    transformers transformers-compat wai warp
  ];
  testToolDepends = [ hspec-discover ];
  homepage = "http://haskell-servant.readthedocs.org/";
  description = "automatical derivation of querying functions for servant webservices";
  license = stdenv.lib.licenses.bsd3;
}
