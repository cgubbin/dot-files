{
	config,
	lib,
	pkgs,
	...
}:
let
	inherit (lib) mkIf;
	cfg = config.home-config.custom-fonts;
	dankMono = pkgs.callPackage ./dank-mono.nix { };
in
{
 #  home.packages = mkIf cfg.berkeleyMono.enable (
 #  	with pkgs;
	# [
	# 	pkgs.callPackage ./fonts/berkeley-mono.nix
	# ]
 #  );
	#
  home.packages = mkIf cfg.dankMono.enable (
  	with pkgs;
	[
		dankMono
	]
  );

 #  home.packages = mkIf cfg.etBembo.enable (
 #  	with pkgs;
	# [
	# 	pkgs.callPackage ./fonts/et-bembo.nix
	# ]
 #  );
	#
 #  home.packages = mkIf cfg.jetBrainsMono.enable (
 #  	with pkgs;
	# [
	# 	pkgs.callPackage ./fonts/jetBrainsMono.nix
	# ]
 #  );
	#
 #  home.packages = mkIf cfg.symbolsMono.enable (
 #  	with pkgs;
	# [
	# 	pkgs.callPackage ./fonts/symbolsMono.nix
	# ]
  # );
}
