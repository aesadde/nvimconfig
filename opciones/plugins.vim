" ===[ Plugins ]=== {{{1
" ===[ Neomake ]=== {{{2
autocmd! BufWritePost *.md Neomake!
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 0
let g:neomake_list_height = 8
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
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_conceal_wide = 1
augroup haskell
    au!
    au FileType haskell set tabstop=8                   "A tab is 8 spaces
    au FileType haskell set expandtab                   "Always uses spaces instead of tabs
    au FileType haskell set softtabstop=4               "Insert 4 spaces when tab is pressed
    au FileType haskell set shiftwidth=4                "An indent is 4 spaces
    au FileType haskell set shiftround                  "Round indent to nearest shiftwidth multiple
    au FileType haskell let g:haskellmode_completion_ghc = 0
    au FileType haskell let g:necoghc_enable_detailed_browse = 1 " Show types
    autocmd FileType haskell nnoremap <buffer> <leader>tt :HdevtoolsType<CR>
    autocmd FileType haskell nnoremap <buffer> <silent> <leader>th :HdevtoolsClear<CR>
    autocmd FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
    au FileType haskell set tags=tags;/,codex.tags;/
    au FileType haskell set csprg=~/.local/bin/hscope
    au FileType haskell set csto=1 " search codex tags first
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
" ===[  Latex Box ]=== {{{2
let g:LatexBox_latexmk_async=1 "enable background latexmk
let g:LatexBox_latexmk_preview_continuously=1
let g:LatexBox_quickfix=0
let g:LatexBox_output_type="pdf"
let g:LatexBox_folding=1
"latexmk options to be able to run commands and get output on the file
let g:LatexBox_latexmk_options="-shell-escape -enable-write18 -pdf"
let g:LatexBox_viewer="/Applications/Skim.app" "Open files with Skim
let g:LatexBox_complete_inlineMath=1 "inline math completion
let g:LatexBox_fold_text=1
let g:LatexBox_fold_preamble=1
" use custom mappings instead those provided by default
let g:LatexBox_no_mappings=1


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
let g:deoplete#omni_patterns.java = '\k\.\k*'

" Uses lists from similar files
if !exists('g:deoplete_sources')
    let g:deoplete_sources = {}
endif
let g:deoplete_sources.c = 'cpp,d,cu' " In c buffers, completes from cpp and d buffers.
let g:deoplete_sources.cpp = 'c' " In cpp buffers, completes from c buffers.
let g:deoplete_sources.gitconfig = '_' " In gitconfig buffers, completes from all buffers.
let g:deoplete_sources.scala = 'java' "Complete Scala from Java
let g:deoplete_sources._ = '_' " In default, completes from all buffers.

autocmd FileType haskell set omnifunc=necoghc#omnifunc "enable onmincompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete

"2}}}
" ===[Rainbow Parentheses ]=== {{{2
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
let g:tagbar_width=26
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1

"haskell tags
if executable("hasktags")
    let g:tagbar_type_haskell = {
                \ 'ctagsbin'  : 'hasktags',
                \ 'ctagsargs' : '-x -c -o-',
                \ 'kinds'     : [
                \  'm:modules:0:1',
                \ 'e:exports:1',
                \ 'i:imports:1',
                \ 't:declarations:0',
                \ 'd:declarations:1',
                \ 'n:declarations:1',
                \ 'f:functions:0',
                \ 'c:constructors:0',
                \  'd:data: 0:1',
                \  'd_gadt: data gadt:0:1',
                \  't:type names:0:1',
                \  'nt:new types:0:1',
                \  'c:classes:0:1',
                \  'cons:constructors:1:1',
                \  'c_gadt:constructor gadt:1:1',
                \  'c_a:constructor accessors:1:1',
                \  'ft:function types:1:1',
                \  'fi:function implementations:0:1',
                \  'o:others:0:1'
                \ ],
                \ 'sro'        : '.',
                \ 'kind2scope' : {
                \ 'm' : 'module',
                \ 'c' : 'class',
                \ 'd' : 'data',
                \ 'n' : 'newtype',
                \ 't' : 'type'
                \ },
                \ 'scope2kind' : {
                \ 'module' : 'm',
                \ 'class'  : 'c',
                \ 'n' : 'newtype',
                \ 'data'   : 'd',
                \ 'type'   : 't'
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

let g:unite_source_rec_async_command=['ag --nocolor --nogroup -g ""']
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
            \   'start_insert': 1,
            \   'winheight': 10,
            \   'direction': 'botright',
            \ })


call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
            \ 'ignore_pattern', join([
            \ '\.git/',
            \ ], '\|'))
"2}}}
let g:markdown_fenced_languages = ['html', 'tex', 'bash=sh', 'haskell']
"1}}}
