{
	config,
	pkgs,
	lib,
	...
}:
let
	inherit (lib) mkIf;
	cfg = config.home-config.gui;
in
{
	home.packages = mkIf cfg.utils.enable (
		with pkgs;
		[
			protonvpn-gui
			vlc
			obsidian
			zed-editor
			zotero
		]
	);
}
