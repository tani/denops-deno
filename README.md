# Deno Installer for Denops

This plugin is only for **macOS/Linux**.

```
Plug 'denops-vim/denops.vim'
Plug 'tani/denops-deno', { 'do': { -> denops_deno#install()  } }
```

## Configuration

- `denops_deno#install()`:
  This function installs `deno` to `~/.local/share/denops_deno/<version>/deno`
- `g:denops_deno#version`:
  This variable specifies the version of `deno`. The default value is `'latest'`.

## License

This work is licensed under the MIT License. https://git.io/mit-license

Copyright (c) 2021 TANIGUCHI Masaya. All rights reserved.
