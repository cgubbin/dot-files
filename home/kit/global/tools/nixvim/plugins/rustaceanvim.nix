
{
	programs.nixvim.plugins.rustaceanvim = {
		enable = true;
		settings = {
  server = {
    cmd = [
      "rustup"
      "run"
      "nightly"
      "rust-analyzer"
    ];
    default_settings = {
      rust-analyzer = {
        check = {
          command = "clippy";
        };
        files = {
            excludeDirs = [
                ".cargo"
                ".direnv"
                ".git"
                "target"
            ];
        };
        checkOnSave = true;
        inlayHints = {
          lifetimeElisionHints = {
            enable = "always";
          };
        };
      };
    };
    standalone = false;
  };
            

		};
	};
}
