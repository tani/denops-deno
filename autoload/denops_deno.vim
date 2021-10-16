function! denops_deno#install()
  if has('win23') || has('win64')
    echo 'please install deno manually'
    return
  endif
  let l:script = expand(expand('%:p:h') .. '/../bin/install.sh')
  call system(l:script .. ' ' .. g:denops_deno#version)
endfunction
