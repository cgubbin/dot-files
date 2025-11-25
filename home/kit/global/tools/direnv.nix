_:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableNushellIntegration = true;
    enableNixDirenvIntegration = true;
  };
}
