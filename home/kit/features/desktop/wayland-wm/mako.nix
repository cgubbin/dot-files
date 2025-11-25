{
  config,
  lib,
  ...
}:
let
  # inherit (config.colorScheme) palette kind;

  inherit (lib) mkIf;
  cfg = config.home-config.desktop.wayland;
in
{
  services.mako = mkIf cfg.hyprland.enable {
    enable = true;

    # iconPath =
    #   if kind == "dark" then
    #     "${config.gtk.iconTheme.package}/share/icons/Papirus-Dark"
    #   else
    #     "${config.gtk.iconTheme.package}/share/icons/Papirus-Light";
    # font = "${config.fontProfiles.regular.family} 12";
    settings = {
    	padding = "10,20";
    	anchor = "top-center";
    	width = 400;
    	height = 150;
    	border-size = 2;
    	default-timeout = 12000;
    # backgroundColor = "#${palette.base00}dd";
    # borderColor = "#${palette.palettebase03}dd";
    # textColor = "#${palette.base05}dd";
    	layer = "overlay";
    };
  };
}
