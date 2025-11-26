{
  config,
  lib,
  pkgs,
  ...
}:
let

  inherit (lib) mkIf;
  cfg = config.home-config.desktop;
in

{
  home = mkIf cfg.wayland.enable {
    # used by plugins
    sessionVariables."GOLDENDICT_FORCE_WAYLAND" = "1";
    packages = [
      pkgs.goldendict-ng
      pkgs.libnotify
      pkgs.master.albert
    ];
  };

  xdg.configFile =
    let
      dir = "/home/kit/.dotfiles/home/kit/features/desktop/wayland-wm/albert";
    in
    mkIf cfg.wayland.enable {
      # out of store while still in the learning phase
      "albert/config.toml".source = config.lib.file.mkOutOfStoreSymlink "${dir}/config.toml";
      "albert/websearch/engines.json".source =
        config.lib.file.mkOutOfStoreSymlink "${dir}/websearch-engines.json";
    };
}
