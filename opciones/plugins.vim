" ===[ Plugins ]=== {{{1
"===[ NerdTree]=== {{{2
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=30
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let NERDTreeQuitOnOpen=1
let NERDTreeRespectWildIgnore=1
let NERDTreeDirArrows = 1
let NERDTreeHijackNetrw=1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1

" Close Vim if NerdTree is last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
silent! nmap <leader>nt :NERDTreeToggle<cr>
"2}}}
" ===[ golden-view ]=== {{{2
let g:goldenview__enable_default_mapping = 0
let g:goldenview_ignore_rule = ['nerdtree']
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
  au FileType haskell nmap <silent><buffer> g<space> vii<ESC>:silent!'<,'> EasyAlign /->/<cr>

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
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"2}}}
"===[ UltiSnips ]=== {{{2
let g:UltiSnipsSnippetsDir='~/.config/nvim/UltiSnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<c-j>"
let g:snips_author='Alberto Sadde (@aesadde)'
let g:snips_email='albertosadde@gmail.com'
"2}}}
"===[ Python plugins]=== {{{2
let g:python_host_prog = $HOME.'/miniconda3/envs/neovim/bin/python'
let g:python3_host_prog = $HOME.'/miniconda3/envs/neovim3/bin/python'
augroup python
au!
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set textwidth=80
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

"FZF Completion
nmap ; :Buffers<cr>
map <silent><leader>o :Files<cr>
nmap <silent><leader>fo :Files<space>
nmap <silent><leader>l :Lines<cr>
nmap <leader>fg :GFiles<cr>
nmap <leader>fm :Maps<cr>
nmap <leader>fs :Snippets<cr>
nmap <leader>fc :History:<cr>
" Search content in the current file and in files under the current directory
nmap <leader>g :Rg<cr>


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
"2}}}
" === [ pandoc ]=== {{{2
let g:pandoc#syntax#conceal#use = 0
nnoremap <buffer><cr> :call pandoc#hypertext#OpenLink( g:pandoc#hypertext#edit_open_cmd )<CR>
" 2}}}
" === [ skeletons ]=== {{{2
let skeletons#autoRegister = 1
let skeletons#skeletonsDir = "~/dotfiles/nvim/UltiSnips"
" 2}}}
" === [ ale ]=== {{{2
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 0
let g:ale_linters = {
      \ 'python': ['flake8', 'vulture'],
      \ }
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'python': ['black', 'isort', 'add_blank_lines_for_python_control_statements'],
      \ }
"2}}}
" === [ golang ]=== {{{2
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 0
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_play_browser_command = 'open %URL% &'
"2}}}
" === [ IndentLine ]=== {{{2
let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_setColors = 0
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileTypeExclude = ['markdown', 'vimwiki', 'pandoc']
"2}}}
" === [ Java ]=== {{{2
augroup java
  au!
  au FileType java set tabstop=4
  au FileType java set softtabstop=4
  au FileType java set shiftwidth=4
  au FileType java set textwidth=80
  au FileType java set expandtab
  au FileType java set autoindent
augroup END
"2}}}
" === [ Markdown ] === {{{2
" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0
" 2}}}
"===[ dashboard ]=== {{{2
let g:dashboard_default_executive ='fzf'
"2}}}
"1}}}
