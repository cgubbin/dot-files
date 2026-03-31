{
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) mkIf;
in
{
  config = mkIf pkgs.stdenv.isLinux {
    home = {
      sessionVariables = {
        MOZ_ENABLE_WAYLAND = "1";
      };
    };
  };
}
