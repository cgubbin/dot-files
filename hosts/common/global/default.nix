{pkgs, ...}:
{
	imports = [
		./locale.nix
		./nix.nix
	];

	nixpkgs = {
		overlays = [ ];
		config = {
			allowUnfree = true;
		};
	};

	system.stateVersion = "25.05";
}
