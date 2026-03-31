switch HOST:
    #!/usr/bin/env bash
    set -euo pipefail

    case "$(uname -s)" in
      Linux)
        sudo nixos-rebuild switch --flake ".#{{HOST}}" --impure -v -L --show-trace
        ;;
      Darwin)
        darwin-rebuild switch --flake ".#{{HOST}}" --impure -v -L --show-trace
        ;;
      *)
        echo "Unsupported OS: $(uname -s)" >&2
        exit 1
        ;;
    esac
