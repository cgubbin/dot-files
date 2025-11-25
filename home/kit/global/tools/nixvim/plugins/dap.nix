{pkgs, ...}: {
  programs.nixvim.plugins.dap= {
    enable = true;
  };
}
