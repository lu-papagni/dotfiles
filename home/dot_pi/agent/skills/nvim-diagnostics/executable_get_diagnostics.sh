#!/bin/bash

if [ -z "$NVIM" ]; then
  echo "Error: \$NVIM environment variable is not set. Are you running this from inside Neovim?" >&2
  exit 1
fi

# Fetch diagnostics via remote expression
# We use luaeval to execute lua and json_encode to output a parsable JSON string
RES=$(nvim --server "$NVIM" --remote-expr "luaeval('vim.fn.json_encode(vim.diagnostic.get())')")

printf '%s\n' "$RES"

