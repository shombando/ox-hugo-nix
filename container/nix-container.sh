#!/usr/bin/env bash
set -euo pipefail

podman run -it \
--env 'NIX_CONFIG=experimental-features = nix-command flakes' \
-v ./:/site \
--rm --interactive --tty \
--entrypoint "/site/container/nix-develop.sh" \
nixos/nix
