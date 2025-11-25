{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./keymappings.nix
    ./options.nix
    ./plugins
    ./themes.nix
    # ./opts.nix
    # ./keymappings.nix
    # ./options.nix
    # ./plugins
    # ./themes.nix
    # {
    	# programs.nixvim.enable = true;
	# programs.nixvim.vimdiffAlias = true;
	# programs.nixvim.nixpkgs.pkgs = pkgs;
    # }
    # ./themes.nix
    # ./plugins
    #./completion.nix
    #./keymappings.nix
  ];

  programs.nixvim = {
  	enable = true;
  	vimdiffAlias = true;
 };

  # config.programs.nixvim = ./module.nix;
  # config.home.packages = with pkgs; [alejandra nil nixd];
}
