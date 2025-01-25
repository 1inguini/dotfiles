#!/bin/sh

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

function GitUpdate () {
  git clone "$1" "$2" \
    || { cd "$2"; git pull; }
}

# # nvim
# GitUpdate https://github.com/1inguini/init.vim.git "$XDG_CONFIG_HOME"/nvim
