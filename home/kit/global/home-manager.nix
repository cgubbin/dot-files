{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "kit";
    homeDirectory = "/home/kit";
    sessionVariables = {
      TERMINAL = "kitty";
      BROWSER = "firefox";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };
  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}
