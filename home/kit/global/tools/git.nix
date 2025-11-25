{
    config,
    pkgs,
    ...
}:
{
    services.ssh-agent = {
        enable = true;
    };
    programs.git = {
        enable = true;
        settings = {
            user = {
	        name = "cgubbin";
                email = "chris.gubbin@gmail.com";
	    };
	    aliases = {
                cleanup = "!git branch --merged | grep -v '\\*\\|master\\|develop' | xargs -n 1 -r git branch -d";
                prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' -abbrev-commit -date=relative";
                root = "rev-parse --show-toplevel";
            };
            branch.autosetuprebase = "always";
            color.ui = true;
            core.askPass = "";
            github.user = "cgubbin";
            push.default = "tracking";
            init.defaultBranch = "main";
        };
    };
}
