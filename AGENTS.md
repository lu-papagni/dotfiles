# General Instructions

This is the source-of-truth state of a user configuration managed with `chezmoi`.

- Files are located in inside the relative directory specified in `.chezmoiroot`
- Supports templates (`*.tmpl` files) using Go Template syntax
- Strives to be cross platform: Linux, MacOS, Windows 10/11

# Useful Commands

- `apply` - applies source state on system; append `--init` to rebuild chezmoi's config file
- `status` - summary of changes between src and dest states
- `diff` - read per-file diffs
- `execute-template` - returns processed templates without applying, useful for testing

# Manual Reference

If more guidance is needed check these resources:

- Fetch [](https://www.chezmoi.io/reference) from element `.md-nav` for the full reference index.
- Fetch relevant URLs from element `.md-content` to read page contents.
