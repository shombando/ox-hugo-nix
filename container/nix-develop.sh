#!/usr/bin/env bash
set -euo pipefail

cd /site
nix develop --command /site/build.sh --gc
