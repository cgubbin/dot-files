switch HOST:
    sudo nixos-rebuild switch --flake .#{{HOST}} --impure -v
