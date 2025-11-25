{ lib, stdenvNoCC, fetchzip  }:

stdenvNoCC.mkDerivation {
  name = "JetBrainsMono";
  dontConfigue = true;
  src = fetchzip {
    url = "https://github.com/caheredia/fonts/raw/main/JetBrainsMono.zip";
    sha256 = "sha256-fl8YfPmDYT/rjnUrUYA4NaHwtocU64F/Cglb4hXMUZI=";
  };

  installPhase = ''
    mkdir -p $out/share/fonts
    cp -R $src $out/share/fonts/truetype/
    '';

  meta =  {
    description = "JetBrains Mono with Nerd Font patch";
    homepage = "https://github.com/caheredia/fonts";
  };

}
