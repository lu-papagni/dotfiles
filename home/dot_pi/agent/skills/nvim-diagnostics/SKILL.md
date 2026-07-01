---
name: nvim-diagnostics
description: |
    Reads JSON-formatted LSP diagnostics from a running Neovim instance.
    Use this skill when asked to check for errors or warnings in the currently open Neovim buffers.
---

# Prerequisites

Running inside a Neovim terminal or have the `$NVIM` environment variable set to a valid Neovim socket path.

# Usage

```bash
get_diagnostics [buffer_name]
```

retrieves a summary of diagnostics grouped by buffer.

This will output the diagnostic messages, their corresponding line numbers (1-indexed), and the source of
the diagnostic (e.g., the specific LSP server or linter).

> [!IMPORTANT]
> Neovim updates diagnostics only when the user focuses the edited buffer.
> Use `get_diagnostics` only **ONCE** per round.
