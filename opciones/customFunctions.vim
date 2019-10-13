" ==[ Toggles quickfix list ]== {{{1
let g:quickfix_is_open = 0
let g:error_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
nnoremap <leader>q :call QuickfixToggle()<cr>

let g:loclist_is_open = 0
let g:error_is_open = 0

function! LoclistToggle()
    if g:loclist_is_open
        lclose
        let g:loclist_is_open = 0
        execute g:loclist_return_to_window . "wincmd w"
    else
        let g:loclist_return_to_window = winnr()
        lopen
        let g:loclist_is_open = 1
    endif
endfunction
nnoremap <leader>lo :call LoclistToggle()<cr>
"1}}}
" ===[ Trailing whitespaces ]=== {{{
function! StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
"===[ Word Count] === {{{
let g:word_count="<unknown>"
function! WordCount()
  return g:word_count
endfunction
function! UpdateWordCount()
  let lnum = 1
  let n = 0
  while lnum <= line('$')
    let n = n + len(split(getline(lnum)))
    let lnum = lnum + 1
  endwhile
  let g:word_count = n
endfunction
" Update the count when cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).
set updatetime=1000
augroup WordCounter
  au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup END
"}}}
