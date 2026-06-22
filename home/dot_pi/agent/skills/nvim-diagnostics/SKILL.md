---
name: nvim-diagnostics
description: Reads LSP diagnostics from the running Neovim instance via the $NVIM UNIX socket. Use this skill when asked to check for errors or warnings in the currently open Neovim buffers.
---

# Neovim LSP Diagnostics

This skill allows the agent to fetch a JSON-converted diagnostic summary from Neovim's LSP client using
Neovim's remote control capabilities via the `$NVIM` socket.

## Prerequisites

- You must be running inside a Neovim terminal or have the `$NVIM` environment variable set to a valid Neovim socket path.

## Usage

Run the `get_diagnostics.sh` script to retrieve a summary of diagnostics grouped by buffer.
This will output the diagnostic messages, their corresponding line numbers (1-indexed), and the source of
the diagnostic (e.g., the specific LSP server or linter).

> [!TIP]
> After using the `edit` tool on a file attached to an LSP, run `refresh.sh <bufnr>` to update the diagnostic status.

## Presentation

If the user specifies buffer name(s), only show those diagnostics.
Draw a table with three columns:

1. Line: line number
2. Issue: error ID
3. Details: error message

