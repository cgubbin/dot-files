{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) mkIf;
  cfg = config.home-config.gui;
in
{
  config = mkIf (pkgs.stdenv.isDarwin && cfg.utils.enable) {
    home.packages = with pkgs; [
      # caffeine
      karabiner-elements
    ];
  };
}
