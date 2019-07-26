" minimal vim wiki
" save this to .vim/plugin/viki.vim
" add `export VIM_VIKI_HOME=$HOME/Dropbox/example` to .bashrc

" features:
"   - open index with <space>ww
"   - type a word (foo) and press return on it to create foo.md
"   - backspace takes you back a file
"   - Insert checkbox

nnoremap <leader>ww :edit $VIM_VIKI_HOME/index.md<cr>

augroup Viki " {{{1
  autocmd!
  autocmd BufNewFile,BufRead *.md call viki#init()
augroup END
"1}}}
function! viki#init() "{{{1
  setlocal ft=pandoc
  setlocal textwidth=80
  set spell
  set spelllang=en_us,es
  set formatoptions+=t

  nnoremap <buffer><bs> :b#<cr>
  nnoremap <buffer><leader>t :call viki#insert_cb()<cr>
  nnoremap <buffer><leader>al :call viki#insert_link()<cr>
endfunction
"1}}}
function! viki#insert_cb() "{{{1
  let l:lnum=line('.')
  let l:line=getline(l:lnum)
  let l:new_line="- [ ] " . l:line
  call setline(l:lnum, l:new_line)
endfunction
"1}}}
function! viki#insert_link() abort " {{{1
  let l:lnum=line('.')
  let l:url=getline(l:lnum)
  let l:text = input('Link text: ')
  let l:new_line='[' . l:text . '](' . l:url . ')'
  call setline(l:lnum, l:new_line)
endfunction
"1}}}
