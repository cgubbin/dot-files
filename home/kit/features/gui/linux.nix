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
  home.packages = mkIf (cfg.utils.enable && pkgs.stdenv.isLinux) (
    with pkgs;
    [
      _1password-gui
      drawio
      keymapp
      obsidian
      protonvpn-gui
      vlc
      zed-editor
      zotero
    ]
  );
}
