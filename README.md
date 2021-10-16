# Deno Installer for Denops

This plugin is only for **macOS/Linux**.

```
Plug 'denops-vim/denops.vim'
Plug 'tani/denops-deno', { 'do': { -> denops_deno#install()  } }

let g:denops_deno#version = 'v1.15.1'
call denops_deno#enable()
```

## Configuration

- `denops_deno#install()`:
  This function installs `deno` to `~/.local/share/denops_deno/<version>/deno`
- `g:denops_deno#version`:
  This variable specifies the version of `deno`. The default value is `'latest'`.
- `denops_deno#enable()`:
  This function sets the path to `g:denops#deno`

## How to Update Deno

### Latest version

1. Set the default value `'latest'` to `g:denops_deno#version`
2. Run `:call denops_deno#install()`

### Other versions

1. Set the version (`vX.Y.Z`) to `g:denops_deno#version`
2. Run `:call denops_deno#install()`

## License

This work is licensed under the MIT License. https://git.io/mit-license

Copyright (c) 2021 TANIGUCHI Masaya. All rights reserved.
