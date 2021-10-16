if !exists('g:denops_deno#version')
  let g:denops_deno#version = 'latest'
endif

let g:denops#deno = expand('~/.local/share/denops-deno/' .. g:denops_deno#version .. '/deno')
