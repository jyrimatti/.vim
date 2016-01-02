
"Based on:
" https://github.com/benmccormick/dotfiles/blob/master/vim/vimrc.symlink

" Plugins, with Vundle
" =============================================================================

" Vundle begins here, turn off filetype temporarily
filetype off
" Add vundle to our lookup path
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/vundle'

" theming
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'

" filetypes
Plugin 'otherwise/yajs.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'lepture/vim-jinja'
Plugin 'dag/vim-fish'
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leafgarland/typescript-vim'
Plugin 'tfnico/vim-gradle'

"javascript
Plugin 'marijnh/tern_for_vim'

Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'

" autocomplete
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'

" file tree browser
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" code commenter
Plugin 'scrooloose/nerdcommenter'

" file outline
Plugin 'majutsushi/tagbar'

" snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" git bindings
Plugin 'tpope/vim-fugitive'

" shell in buffer
Plugin 'jewes/Conque-Shell'

" haskell
Plugin 'neovimhaskell/haskell-vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimproc.vim' " dep of ghc-mod
Plugin 'bitc/vim-hdevtools'
Plugin 'eagletmt/neco-ghc'
Plugin 'Twinside/vim-hoogle'
Plugin 'jpalardy/vim-slime'
Plugin 'mpickering/hlint-refactor-vim'
Plugin 'Twinside/vim-haskellFold'
Plugin 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM'
Plugin 'enomsg/vim-haskellConcealPlus'

" TODO:
" Provides Sublime-Text like smart completion of braces, parens and such
"Plugin 'Raimondi/delimitMate'
" Surround is useful for adding surrounding tags to elements (especially html and quotes)
"Plugin 'tpope/vim-surround'
"Plugin 'terryma/vim-multiple-cursors'


"End Vundle
call vundle#end()
filetype plugin indent on
" "Pull in matchit.vim, which is already bundled with Vim
runtime! macros/matchit.vim





" =============================================================================
" Configuration
" =============================================================================



syntax on
syntax enable
set t_Co=256 " Syntax highlighting should be in 256 colors

colorscheme solarized
set background=dark
set guifont=Source\ Code\ Pro\ for\ Powerline

set nocompatible                " Use vim rather than vi settings
set encoding=utf-8              " standard encoding
set number                      " Its nice to see line numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set autoread                    " Reload files changed outside vim
set hidden                      " Buffers can exist in the background
set history=1000                " Store lots of :cmdline history (its not 1990)
set shellpipe=2>/dev/null>      " Don't dump distracting text to terminal during searches!
set whichwrap+=<,>,[,]          " left/right wrap lines
set clipboard=unnamed           " Use system clipboard

set showcmd                     " Show incomplete cmds down the bottom
set guicursor=a:block-Cursor-blinkon0
set guicursor=i:ver30-Cursor-blinkwait200-blinkon200-blinkoff200
set laststatus=2                " Always show status line
set splitright                  " Opens vertical split right of current window
set splitbelow                  " Opens horizontal split below current window
set shortmess=filnxtToOI        " add I
set shell=zsh
set mouse=a                     " Enable mouse use in all modes
set title                       " Set window title

" try to use select-mode instead of visual-mode everywhere
set selectmode=key,mouse,cmd
set keymodel=startsel,stopsel

" turn Off Swap Files
set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp



" General behavior
" =============================================================================

" detect filetype whenever a buffer is entered
au BufEnter * nested :filetype detect

" scroll windows with ctrl-left and ctrl-right
nnoremap <silent> <C-Left> :wincmd h<CR>
nnoremap <silent> <C-Right> :wincmd l<CR>

" scroll buffers with Tab, except in NERDTree/Tagbar window
nnoremap <silent> <Tab> :bnext<CR>
autocmd FileType nerdtree nnoremap <buffer> <Tab> <Nop>
autocmd FileType tagbar nnoremap <buffer> <Tab> <Nop>

" close help with ESC
autocmd FileType help noremap <buffer> <Esc> :q<CR>

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command! -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <silent> <C-S> <C-O>:<C-u>Update<CR>

" Keep undo history across sessions, by storing in file
" Only works in MacVim (gui) mode
if has('gui_running')
  set undodir=~/.vim/backups
  set undofile
endif



" Search Settings
" =============================================================================

set incsearch        " Find the next match as we type the search
set hlsearch         " Highlight searches by default
set ignorecase
set smartcase
set viminfo='100,f1  " Save up to 100 marks, enable capital marks

" serch word on doubleclick
nnoremap <2-LeftMouse> *
inoremap <2-LeftMouse> <c-o>*

" use ESC to remove search highlight
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>



" Indentation and Display
" =============================================================================

" we want to replace tabs with spaces and have 4 space width indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" don't wrap lines
set nowrap

" indent both ways with Tab/Shift-Tab
vnoremap <Tab> >
vnoremap <S-Tab> <

" display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" scroll sideways
set sidescroll=1



" Folds
" =============================================================================

set foldmethod=indent   " Fold based on indent
set foldnestmax=5       " Deepest fold is 5 levels
" Toggle folds with space, unless on outermost level
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" Open all folds when opening file
autocmd Syntax * normal zR



" Completion
" =============================================================================

set wildmenu " Enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=longest,list,full
set wildignore=*.o,*.obj,*~,*.pkg,*.dmg,*.pdf,*.wav,*.mov,*.mp3,*.mp4,*.ogg,*.tar,*.gz,*.tgz,*.zip,*.m4v,*.jar,*.doc,*.ppt,*.xls,*.docx,*.pptx,*.xlsx,*.class,.DS_Store,*.svg,*.ttf,*.woff,*.bin,*.dll,*.pyc     " Stuff to ignore when tab completing
set wildignore+=*vim/backups*,*/.hg/*,*/.git/*,*/.svn/*,*/Applications/*,*/Library/*,*/System/*,*/Volumes/*,*/nix/*,*/.emacs/*,*/.emacs.d/*,*/.vim/*,*/.npm/*,*/.m2/repository/*,*/.vagrant.d/*,*/target/*,*/build/*,*/node_modules/*,*/bower_components/*,*/.gradle/daemon/*,*/.gradle/wrapper/*,*/.gradle/caches/*,*/.Trash/*,*/.cache/*,*/.metadata/*,*/.dist-buildwrapper/*,*/dist/*,*/bin/*,*/.node-gyp/*,*/.qgis2/*,*/hoogledb/*,*/.sqldeveloper/*,*/Microsoft\ User\ Data/*



" Cursor movement mappings
" =============================================================================

" ALT-: one word forward / back
nnoremap <A-left> b
nnoremap <A-right> w
inoremap <A-left> <C-O>b
inoremap <A-right> <C-O>w
vnoremap <A-left> b
vnoremap <A-right> w
snoremap <A-left> <C-O>b
snoremap <A-right> <C-O>w

" CMD-: smart home key for indented lines: go to first non-blank character (not
" start of line) of display line (not numbered line)
nnoremap <D-left> g^
nnoremap <D-right> g$
inoremap <D-left> <C-O>g^
inoremap <D-right> <C-O>g$



" Text selection mappings
" =============================================================================

" CTRL-A: Select all
noremap  <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" SHIFT-ALT-: select one word forward / back
nnoremap <S-A-left> <S-left>b<C-g>
nnoremap <S-A-right> <S-right>e<C-g>
inoremap <S-A-left> <left><S-left>b<C-g>
inoremap <S-A-right> <S-right>e<C-g>
snoremap <S-A-left> <C-O>b
snoremap <S-A-right> <C-O>e
vnoremap <S-A-left> b
vnoremap <S-A-right> e

" SHIFT-CMD-: select whole line
nnoremap <S-D-left> vg^ <S-left><C-g>
nnoremap <S-D-right> vg$<S-left><C-g>
inoremap <S-D-left> <left><C-O>vg^ <S-left><C-g>
inoremap <S-D-right> <C-O>vg$<S-left><C-g>
vnoremap <S-D-left> g^ <S-left>
vnoremap <S-D-right> g$

" adjust selection in insert-mode to using bar-cursor instead of a box
" since otherwise it selects too many/few characters
inoremap <S-left> <Left><C-o>v
inoremap <S-right> <C-o>v
inoremap <expr> <S-up> col('.') == 1 ? "<left><S-Left>g^<C-g>" : "<left><S-Up><S-right><C-g>"
inoremap <S-down> <S-down><S-left><C-g>





" =============================================================================
" Plugin Options
" =============================================================================



" Airline
" =============================================================================

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set noshowmode " Let airline handle the mode display



" Syntastic
" =============================================================================

let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_javascript_checkers = ["#eslint"]
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_balloons = 0



" NerdTree
" =============================================================================

let NERDTreeShowHidden=1
let NERDTreeSortHiddenFirst=1
let NERDTreeRespectWildIgnore=1
let NERDTreeMouseMode=2
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=1

" toggle with ctrl-tab and zoom to current file while opening
nnoremap <expr> <C-Tab> g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : ':NERDTreeFind<CR>'

" open/close hierarchy with left/right
autocmd FileType nerdtree nmap <buffer> <Right> o
autocmd FileType nerdtree nmap <buffer> <Left> o

" open automatically if no files specifies
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close when last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" YouCompleteMe
" =============================================================================

let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_allow_changing_updatetime = 0
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_cache_omnifunc = 0



" NecoGHC
" =============================================================================

let g:necoghc_enable_detailed_browse = 1
let g:necoghc_debug = 1



" Superior-Haskell-Interaction-Mode-SHIM
" =============================================================================

let g:shim_ghciInterp = 'cabal repl'
let g:shim_defaultWindowSize = 7



" Haskell-vim
" =============================================================================

let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1



" Ultisnips
" =============================================================================

let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function! ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"



" GitGutter
" =============================================================================

let g:gitgutter_sign_column_always = 1



" CtrlP
" =============================================================================

let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window = 'results:20'
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_max_files = 100000



" Tagbar
" =============================================================================

let g:tagbar_width = 30
let g:tagbar_singleclick = 1

autocmd BufEnter * nested :call tagbar#autoopen(0)

" remap open/closefold to right/left keys
if exists("g:tagbar_map_openfold")
  unlet g:tagbar_map_openfold
  unlet g:tagbar_map_closefold
endif
let g:tagbar_map_openfold = "<Right>"
let g:tagbar_map_closefold = "<Left>"



" Omnifuncs by filetype
" =============================================================================

autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType markdown   setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete





" =============================================================================
" FileTypes
" =============================================================================



" XML
" =============================================================================

" fold by syntax
let g:xml_syntax_folding=1
autocmd FileType xml setlocal foldmethod=syntax

autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType xml nnoremap <buffer> <F2> :%!xmllint --format -<CR>



" Haskell
" =============================================================================

autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" disable conceal by default
let g:no_haskell_conceal = 1

let g:hoogle_search_count = '10 -d $NIX_SHELL_ROOT/hoogledb'
let g:syntastic_haskell_hdevtools_args = '-g-Wall'

let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
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
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }

" Close Autocomplete and then Hoogle with ESC
autocmd FileType haskell nnoremap <buffer> <expr> <Esc>                           bufnr(g:hoogle_search_buf_name) >= 0 ? "\<C-o>:HoogleClose<CR>" : "\<Esc>"
autocmd FileType haskell inoremap <buffer> <expr> <Esc> pumvisible() ? "\<C-e>" : bufnr(g:hoogle_search_buf_name) >= 0 ? "\<C-o>:HoogleClose<CR>" : "\<Esc>"

" TODO: this some easier way
autocmd FileType haskell nnoremap <buffer> <F2> :%!stylish-haskell<CR>

" TODO: this some easier way
autocmd FileType haskell nnoremap <buffer> <silent> <F4> :GhcModExpand<CR>
autocmd FileType haskell nnoremap <buffer> <F5> :Hoogle
autocmd FileType haskell nnoremap <buffer> <F6> :HoogleInfo

" TODO: this some easier way
autocmd FileType haskell nnoremap <buffer> <C-x><C-x> :GhciRange<CR>
autocmd FileType haskell snoremap <buffer> <C-x><C-x> :GhciRange<CR>
autocmd FileType haskell vnoremap <buffer> <C-x><C-x> :GhciRange<CR>
autocmd FileType haskell nnoremap <buffer> <C-x><C-f> :GhciFile<CR>
autocmd FileType haskell nnoremap <buffer> <C-x><C-r> :GhciReload<CR>

" show some type info on balloon tip
function! HaskellBalloonExpr()
    redir => output1
    silent execute '!hdevtools type % '.v:beval_lnum.' '.v:beval_col
    redir END

    redir => output2
    silent execute '!hdevtools info % '.v:beval_text
    redir END

    let o1 = split(join(split(output1, "\n")[1:1], ""), "\"")
    let o2 = split(output2, "\n")
	return v:beval_text." :: ".join(o1[1:], "")."\n\n".join(o2[1:],"\n")
endfunction
autocmd FileType haskell setlocal balloonexpr=HaskellBalloonExpr()
autocmd FileType haskell setlocal ballooneval

