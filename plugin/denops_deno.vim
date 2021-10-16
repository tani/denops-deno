if !exists('g:denops_deno#version')
  let g:denops_deno#version = 'latest'
endif

function! denops_deno#install()
  if has('win23') || has('win64')
    echo 'please install deno manually'
    return
  endif
  let l:script = expand(expand('%:p:h') .. '/../bin/install.sh')
  call system(l:script .. ' ' .. g:denops_deno#version)
endfunction

function! denops_deno#enable()
  if has('win23') || has('win64')
    return
  endif
  let g:denops#deno =
    \ expand('~')
    \ .. '/.local/share/denops_deno/' 
    \ .. g:denops_deno#version 
    \ .. '/deno'
endfunction
