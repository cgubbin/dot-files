{
    inputs,
    config,
    ...
}:
{
    imports = [inputs.sops-nix.nixosModules.sops];
    sops = {
        defaultSopsFile = ../common/secrets.yaml;
        age.keyFile = "${config.users.users.kit.home}/.config/sops/age/keys.txt";
        secrets."sys-passphrase" = {
            neededForUsers = true;
        };
    };
}
