{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib) mkIf;
  cfg = config.home-config.dev;
in
{
  home.packages = mkIf cfg.devTools.enable (
    with pkgs;
    [
      nix-tree
      tokei
      gh
      hub
      git-lfs
      git-open

      typst
      tinymist
    ]
  );

  programs.lazygit = {
    enable = true;
    settings.git = {
      overrideGpg = true;
    };
  };

  programs.tmux = mkIf cfg.devTools.enable {
    enable = true;
    clock24 = true;
    prefix = "C-a";
    baseIndex = 1;
    mouse = true;
    disableConfirmationPrompt = true;
    escapeTime = 0;
    historyLimit = 5000;
    # plugins =
    #   # let
    #   #   inherit (pkgs.tmuxPlugins) resurrect continuum;
    #   # in
    #   # [
    #   #   {
    #   #     plugin = resurrect;
    #   #     extraConfig = "set -g @resurrect-processes '\"~hx->hx *\" lazygit vault-tasks spotify-player'";
    #   #   }
    #   #   {
    #   #     plugin = continuum;
    #   #     extraConfig = ''
    #   #       set -g @continuum-restore 'on'
    #   #       set -g @continuum-save-interval '5' # minutes
    #   #     '';
    #   #   }
    #   # ];
  };

  programs.zellij = mkIf cfg.devTools.enable {
  	enable = true;
	enableFishIntegration = true;
  };

 # NOTE: the module only supports YAML config which is deprecated
  home.file.zellij = mkIf cfg.devTools.enable {
    target = ".config/zellij/config.kdl";
    text = ''
      keybinds {
          normal clear-defaults=true {
              // tmux
              bind "Ctrl b" { SwitchToMode "Tmux"; }
          }

          tmux clear-defaults=true {
              bind "Ctrl b" { Write 2; SwitchToMode "Normal"; }
              bind "Esc" { SwitchToMode "Normal"; }
              bind "g" { SwitchToMode "Locked"; }
              bind "p" { SwitchToMode "Pane"; }
              bind "t" { SwitchToMode "Tab"; }
              bind "n" { SwitchToMode "Resize"; }
              bind "h" { SwitchToMode "Move"; }
              bind "s" { SwitchToMode "Scroll"; }
              bind "o" { SwitchToMode "Session"; }
              bind "q" { Quit; }
          }
      }

      theme "tokyo-night-dark"

      themes {
        tokyo-night-dark {
            fg 169 177 214
            bg 26 27 38
            black 56 62 90
            red 249 51 87
            green 158 206 106
            yellow 224 175 104
            blue 122 162 247
            magenta 187 154 247
            cyan 42 195 222
            white 192 202 245
            orange 255 158 100
        }

        catppuccin-mocha {
            bg "#585b70" // Surface2
            fg "#cdd6f4" // Text
            red "#f38ba8"
            green "#a6e3a1"
            blue "#89b4fa"
            yellow "#f9e2af"
            magenta "#f5c2e7" // Pink
            orange "#fab387" // Peach
            cyan "#89dceb" // Sky
            black "#181825" // Mantle
            white "#cdd6f4" // Text
        }
      }
    '';
  };

}
