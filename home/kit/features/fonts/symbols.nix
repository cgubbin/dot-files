# make a  derivation for berkeley-mono font installation
{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "symbols-typeface";
  version = "1.009";

  src = ./../../assets/symbols.zip;

  unpackPhase = ''
    runHook preUnpack
    ${pkgs.unzip}/bin/unzip $src

    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    install -Dm644 symbols/*.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
