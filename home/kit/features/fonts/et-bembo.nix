# make a  derivation for berkeley-mono font installation
{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "et-bembo-typeface";
  version = "1.009";

  src = ./../../assets/et-bembo.zip;

  unpackPhase = ''
    runHook preUnpack
    ${pkgs.unzip}/bin/unzip $src

    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    install -Dm644 ET_Bembo-master/*.otf -t $out/share/fonts/opentype

    runHook postInstall
  '';
}
