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

let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_time_format = '%m-%d-%y %H:%M:%S'
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = '\.git\|\.DS_Store\|\.pyc'
"2}}}
" ===[ Neomake ]=== {{{2
autocmd! BufWritePost *  Neomake
let g:neomake_open_list = 2 "always open error
let g:neomake_verbose = 1
let g:neomake_list_height = 5
let g:make_place_signs= 1 "place error signs always
" let g:neomake_haskell_ghc_mod_args = '-g-Wall'
" let g:neomake_haskell_hlint_args = ['--hint=Dollar','--hint=Default','--ignore= Use camelCase']
" let g:neomake_haskell_enabled_makers = ['ghcmod']
" " 2}}}
" ===[ golden-view ]=== {{{2
let g:goldenview__enable_default_mapping = 0
let g:goldenview_ignore_rule = ['nerdtree', 'tagbar', 'unite']
"2}}}
" ===[ airline ]=== {{{2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇' "beautifiers
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 's'
let g:airline#extensions#whitespace#enabled = 1
"2}}}
" ===[ haskell ]=== {{{2
let g:haskell_enable_quantification           = 1
let g:haskell_enable_recursivedo              = 1
let g:haskell_enable_arrowsyntax              = 1
let g:haskell_enable_pattern_synonyms         = 1
let g:haskell_enable_typeroles                = 1
let g:haskell_enable_static_pointers          = 1
let g:haskell_conceal_wide                    = 0
let g:haskell_conceal                         = 0
let g:haskell_conceal_enumerations            = 0
let g:haskell_hsp                             = 0
let g:hlintRefactor#disableDefaultKeybindings = 1
let g:ghcmod_hlint_options = ['--hint=Dollar','--hint=Default','--ignore=Use camelCase']

let g:hindent_on_save = 1
let g:hindent_line_length = 80
let g:hindent_indent_size = 2

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
  au FileType haskell nnoremap <silent><buffer> tw :GhcModTypeInsert<CR>
  au FileType haskell nnoremap <silent><buffer> tq :GhcModType<CR>
  au FileType haskell nnoremap <silent><buffer> te :GhcModTypeClear<CR>
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

"Enable heavy omni completion.
if !exists('g:deoplete#omni_patterns')
  let g:deoplete#omni_patterns = {}
endif
let g:deoplete#omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:deoplete#omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
let g:deoplete#omni#input_patterns.java = [
      \'[^. \t0-9]\.\w*',
      \'[^. \t0-9]\->\w*',
      \'[^. \t0-9]\::\w*',
      \'\s[A-Z][a-z]',
      \'^\s*@[A-Z][a-z]'
      \]

" Uses lists from similar files
if !exists('g:deoplete#sources')
  let g:deoplete#sources = {}
endif
let g:deoplete#sources.c = ['cpp','d','cu'] " In c buffers, completes from cpp and d buffers.
let g:deoplete#sources.cpp = ['c'] " In cpp buffers, completes from c buffers.
let g:deoplete#sources.scala = ['java'] "Complete Scala from Java
let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.tex = ['ultisnips', 'omni']
let g:deoplete#sources._    = ['buffer', 'file', 'omni', 'ultisnips']

if !exists('g:deoplete#ignore_sources')
  let g:deoplete#ignore_sources = {}
endif
let g:deoplete#ignore_sources.tex = ['buffer']
let g:deoplete#ignore_sources.md = ['buffer']

autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete

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
"===[ Unite ]=== {{{2
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#filters#matcher_default#use(['matcher_fuzzy'])

if executable('ag')
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  " ag is quite fast, so we increase this number
  let g:unite_source_rec_min_cache_files = 1200
  let g:unite_source_grep_recursive_opt=''
endif
let g:unite_prompt = "➤ "
let g:unite_enable_ignore_case = 1
let g:unite_source_history_yank_enable = 1
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_source_rec_max_cache_files=10000
let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 1
let g:unite_winheight = 10
let g:unite_start_instert = 0

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ ], '\|'))
"2}}}
"===[ UltiSnips ]=== {{{2
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"2}}}
"===[ Goyo ]=== {{{
let g:goyo_width         = 82
let g:goyo_margin_top    = 2
let g:goyo_margin_bottom = 2
let g:goyo_linenr        = 1
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
"}}}
"===[ RedPen ]=== {{{
let g:unite_redpen_use_legacy_config_detection=1
"}}}
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
"===[ Skeletons ]=== {{{
let skeletons#autoRegister = 1
let skeletons#skeletonsDir = "~/dotfiles/nvim/skeletons"
"1}}}
"===[ Lexical ]=== {{{
let g:lexical#spelllang = ['en_us','en_gb', 'it', 'es']
let g:lexical#dictionary_key = '<leader>k'
let g:lexical#spell_key = '<leader>s'
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
let g:python_host_prog = $HOME.'/anaconda3/envs/neovim/bin/python'
let g:python3_host_prog = $HOME.'/anaconda3/envs/neovim3/bin/python'
let g:SimpylFold_docstring_preview=1 "see docstrings folded code
let g:deoplete#sources#jedi#show_docstring = 1


augroup python
au!
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=79
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix
augroup END

"2}}}
"1}}}
