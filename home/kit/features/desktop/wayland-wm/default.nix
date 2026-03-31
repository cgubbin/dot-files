{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf;
  cfg = config.home-config.desktop;
  enabled = cfg.wayland.enable && pkgs.stdenv.isLinux;
in
{
  imports = [
    ./albert
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./mako.nix
    ./swaync.nix
    ./waybar
  ];

  config = mkIf enabled {
    home.packages = with pkgs; [
      meson
      wayland-protocols
      wayland-utils
      wlroots
      copyq
      wl-clipboard
    ];
    services.playerctld.enable = true;
  };
}
