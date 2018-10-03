" ===[ Plugins ]=== {{{1
"===[ NerdTree]=== {{{2
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=30
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1
let NERDTreeQuitOnOpen=1
let NERDTreeRespectWildIgnore=1
"2}}}
" ===[ Neomake ]=== {{{2
autocmd! BufWritePost *  Neomake
let g:neomake_open_list = 0 "always open error
let g:neomake_verbose = 0
let g:neomake_list_height = 5
let g:make_place_signs= 1 "place error signs always

" Python neomake settings
let g:neomake_python_enabled_makers = ['flake8', 'pep8', 'vulture']
let g:neomake_python_flake8_maker = { 'args': ['--ignore=E115,E266,E501'], }
let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=119', '--ignore=E115,E266'], }

" Use only intero
let g:neomake_haskell_enabled_makers = []

" " 2}}}
" ===[ golden-view ]=== {{{2
let g:goldenview__enable_default_mapping = 0
let g:goldenview_ignore_rule = ['nerdtree', 'tagbar']
"2}}}
" ===[ airline ]=== {{{2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 's'
let g:airline#extensions#whitespace#enabled = 1
let g:airline_symbols.branch = '⎇' "beautifiers

" Display full path to file
let g:airline_section_c = '%-{getcwd()}/%t'
"2}}}
" ===[ haskell ]=== {{{2
" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" neovim-intero
" Automatically reload on save
au BufWritePost *.hs InteroReload
" Lookup the type of expression under the cursor
au FileType haskell nmap <silent> <leader>t <Plug>InteroGenericType
au FileType haskell nmap <silent> <leader>T <Plug>InteroType
" Insert type declaration
au FileType haskell nnoremap <silent> <leader>ni :InteroTypeInsert<CR>
" Show info about expression or type under the cursor
au FileType haskell nnoremap <silent> <leader>i :InteroInfo<CR>
" Open/Close the Intero terminal window
au FileType haskell nnoremap <silent> <leader>nn :InteroOpen<CR>
au FileType haskell nnoremap <silent> <leader>nh :InteroHide<CR>
" Reload the current file into REPL
au FileType haskell nnoremap <silent> <leader>nf :InteroLoadCurrentFile<CR>
" Jump to the definition of an identifier
au FileType haskell nnoremap <silent> <leader>ng :InteroGoToDef<CR>
" Evaluate an expression in REPL
au FileType haskell nnoremap <silent> <leader>ne :InteroEval<CR>
" Start/Stop Intero
au FileType haskell nnoremap <silent> <leader>ns :InteroStart<CR>
au FileType haskell nnoremap <silent> <leader>nk :InteroKill<CR>
" Reboot Intero, for when dependencies are added
au FileType haskell nnoremap <silent> <leader>nr :InteroKill<CR> :InteroOpen<CR>
" Managing targets
" Prompts you to enter targets (no silent):
au FileType haskell nnoremap <leader>nt :InteroSetTargets<CR>

augroup haskell
  au!
  au FileType haskell setlocal makeprg=stack
  au BufWritePost *.hs silent !fast-tags %
  au BufWritePost *.hsc silent !fast-tags %
  au FileType haskell setlocal omnifunc=necoghc#omnifunc "enable onmincompletion
  au FileType haskell let g:haskellmode_completion_ghc = 0
  au FileType haskell let g:necoghc_enable_detailed_browse = 1 " Show types
  au FileType haskell set tags=tags;/,codex.tags;/
  au FileType haskell set cst
  au FileType haskell set csverb
  au FileType haskell set completeopt+=longest

  " haskell key bindings
  au FileType haskell nmap <silent><buffer> g<space> vii<ESC>:silent!'<,'> EasyAlign /->/<CR>

  " haskell abbreviations
  au FileType haskell inoreab <buffer> int Int
  au FileType haskell inoreab <buffer> integer Integer
  au FileType haskell inoreab <buffer> string String
  au FileType haskell inoreab <buffer> double Double
  au FileType haskell inoreab <buffer> float Float
  au FileType haskell inoreab <buffer> true True
  au FileType haskell inoreab <buffer> false False
  au FileType haskell inoreab <buffer> maybe Maybe
  au FileType haskell inoreab <buffer> just Just
  au FileType haskell inoreab <buffer> nothing Nothing
  au FileType haskell inoreab <buffer> io IO ()
augroup END
"2}}}
" ===[ delimitMate ]=== {{{2
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_excluded_regions = "Comment,String"
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let delimitMate_apostrophes = ''
let delimitMate_autoclose = 1
let delimitMate_balance_matchpairs = 1
let delimitMate_eol_marker = ''
let delimitMate_excluded_ft = ''
let delimitMate_jump_expansion = 1
let delimitMate_nesting_quotes = []
let delimitMate_quotes = '" '' `'
let delimitMate_smart_matchpairs = '^\%(\w\|\!\|£\|\$\|_\|["'']\s*\S\)'
let delimitMate_smart_quotes = 1
"2}}}
" ===[  deoplete ]=== {{{2
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 2
let g:deoplete#max_list = 15

 if !exists('g:deoplete#omni_patterns')
   let g:deoplete#omni_patterns = {}
 endif
 if !exists('g:deoplete#ignore_sources')
   let g:deoplete#ignore_sources = {}
 endif

autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:deoplete#sources#jedi#show_docstring = 1
let g:jedi#completions_enabled = 0


"2}}}
" ===[ Rainbow Parentheses ]=== {{{2
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['black',       'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['darkred',     'DarkOrchid3'],
      \ ['red',         'firebrick3'],
      \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
" 2}}}
" ===[ Easyalign ]=== {{{2
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"2}}}
"===[ TagBar]=== {{{2
let g:tagbar_width=50
" let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_autofocus=1
let g:tagbar_autoclose=0

"haskell tags
if executable('lushtags')
  let g:tagbar_type_haskell = {
        \ 'ctagsbin' : 'lushtags',
        \ 'ctagsargs' : '--ignore-parse-error --',
        \ 'kinds' : [
        \ 'm:module:0',
        \ 'e:exports:1',
        \ 'i:imports:1',
        \ 't:declarations:0',
        \ 'd:declarations:1',
        \ 'n:declarations:1',
        \ 'f:functions:0',
        \ 'c:constructors:0'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
        \ 'd' : 'data',
        \ 'n' : 'newtype',
        \ 'c' : 'constructor',
        \ 't' : 'type'
        \ },
        \ 'scope2kind' : {
        \ 'data' : 'd',
        \ 'newtype' : 'n',
        \ 'constructor' : 'c',
        \ 'type' : 't'
        \ }
        \ }
endif

"Latex tags
let g:tagbar_type_tex = {
      \ 'ctagstype' : 'latex',
      \ 'kinds'     : [
      \ 's:sections',
      \ 'g:graphics:0:0',
      \ 'l:labels',
      \ 'r:refs:1:0',
      \ 'p:pagerefs:1:0'
      \ ],
      \ 'sort'    : 0,
      \ }
"2}}}
"===[ UltiSnips ]=== {{{2
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:snips_author='Alberto Sadde (@aesadde)'
let g:snips_email='alberto@aifi.io'
"2}}}
"===[ Pandoc ]=== {{{
augroup pandoc
  autocmd!
  au FileType pandoc UltiSnipsAddFiletypes tex.markdown
  au FileType pandoc let localleader="\\"
  au FileType pandoc silent! cd ..
  au FileType pandoc call lexical#init()
  au FileType pandoc set conceallevel=0
augroup END
"}}}
"===[ Lexical ]=== {{{
let g:lexical#spelllang = ['en_us','en_gb', 'it', 'es']
"}}}
"===[ VimTex ]=== {{{
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = '\\(?:'
      \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
      \ . '|hyperref\s*\[[^]]*'
      \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
      \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
      \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
      \ .')'
let g:vimtex_complete_close_braces = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_comments = 1

let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
" This adds a callback hook that updates Skim after compilation
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction
"}}}
"===[ Python plugins]=== {{{2
let g:python_host_prog = $HOME.'/miniconda3/envs/neovim/bin/python'
let g:python3_host_prog = $HOME.'/miniconda3/envs/neovim3/bin/python'
let g:SimpylFold_docstring_preview=1 "see docstrings folded code

let g:jedi#completions_enabled = 0

augroup python
au!
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=119
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
augroup END
"2}}}
" === [ fzf ]=== {{{2
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
" 2}}}
"1}}}
