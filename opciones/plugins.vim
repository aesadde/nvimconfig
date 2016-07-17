" ===[ Plugins ]=== {{{1
" ===[ Neomake ]=== {{{2
autocmd! BufWritePost * Neomake
autocmd! BufWritePost *.md Neomake!
let g:neomake_open_list = 2 "always open error
let g:neomake_list_height = 5
let g:make_place_signs=2 "place error signs always
let g:neomake_haskell_ghc_mod_args = '-g-Wall'
let g:neomake_haskell_hlint_args = ['--hint=Dollar']
let g:neomake_haskell_enabled_makers = ['ghcmod', 'hlint']
" 2}}}
" ===[ golden-view ]=== {{{2
let g:goldenview__enable_default_mapping = 0
"2}}}
" ===[ airline ]=== {{{2
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇' "beautifiers
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 's'
let g:airline#extensions#whitespace#enabled = 1
"show line count of file
call airline#parts#define_raw('linec', '%L')
let g:airline_section_z = airline#section#create(['%3p%%', 'linenr', '/', 'linec', ':%3c '])
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
let g:ghcmod_hlint_options                    = ['--ignore=Redundant $']

augroup haskell
  au!
  au BufWritePost *.hs            silent !init-tags %
  au FileType haskell let g:haskellmode_completion_ghc = 0
  au FileType haskell let g:necoghc_enable_detailed_browse = 1 " Show types
  au FileType haskell set tags=tags;/,codex.tags;/
  au FileType haskell set cst
  au FileType haskell set csverb
  au FileType haskell set completeopt+=longest
augroup END
"2}}}
" ===[ delimitMate ]=== {{{2
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_excluded_regions = "Comment,String"
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let delimitMate_apostrophes = ''
let delimitMate_autoclose = 1
let delimitMate_balance_matchpairs = 0
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
let g:deoplete#auto_completion_start_length = 3
let g:deoplete#max_list = 10

" Enable heavy omni completion.
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
if !exists('g:deoplete_sources')
    let g:deoplete_sources = {}
endif
let g:deoplete_sources.c = 'cpp,d,cu' " In c buffers, completes from cpp and d buffers.
let g:deoplete_sources.cpp = 'c' " In cpp buffers, completes from c buffers.
let g:deoplete_sources.gitconfig = '_' " In gitconfig buffers, completes from all buffers.
let g:deoplete_sources.scala = 'java' "Complete Scala from Java
let g:deoplete_sources._ = '_' " In default, completes from all buffers.

autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc "enable onmincompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
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
  let g:unite_source_rec_async_command =
    \ ['ag', '--nocolor', '--nogroup',
    \  '--depth', '10', '-g', '']
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
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10

" Like ctrlp.vim settings.
call unite#custom#profile('default', 'context', {
            \   'start_insert': 0,
            \   'winheight': 10,
            \   'direction': 'botright',
            \ })


call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'ignore_pattern', join([
            \ '\.git/',
            \ ], '\|'))
"2}}}
"===[ UltiSnips ]=== {{{2
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsEditSplit='vertical'
"2}}}
"===[ Goyo ]=== {{{
let g:goyo_width         = 82
let g:goyo_margin_top    = 2
let g:goyo_margin_bottom = 2
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
"}}}
"===[ Pandoc ]=== {{{
"}}}
"===[ Skeletons ]=== {{{
let skeletons#autoRegister = 1
let skeletons#skeletonsDir = "~/dotfiles/nvim/skeletons"
"1}}}
