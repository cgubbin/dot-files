{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf;
  cfg = config.home-config.desktop;
  enabled = pkgs.stdenv.isLinux && cfg.wayland.enable;
  dir = ./.;
in
{
  config = mkIf enabled {
    home = {
      sessionVariables.GOLDENDICT_FORCE_WAYLAND = "1";
      packages = [
        pkgs.goldendict-ng
        pkgs.libnotify
        pkgs.master.albert
      ];
    };

    xdg.configFile."albert/config".source = ./config.toml;
    xdg.configFile."albert/websearch/engines.json".source = ./websearch-engines.json;
    # xdg.configFile = {
    #   "albert/config".source = config.lib.file.mkOutOfStoreSymlink "${toString dir}/config.toml";
    #   "albert/websearch/engines.json".source =
    #     config.lib.file.mkOutOfStoreSymlink "${toString dir}/websearch-engines.json";
    # };
  };
}
