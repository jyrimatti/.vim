"                   \ eBen McCormick's vimrc

" Plugins
" =============

"Setup Vundle For Package Management

"Vundle begins here, turn off filetype temporarily
filetype off
"Add vundle and any other packages not installed through vundle to our lookup
"path
set rtp+=~/.vim/bundle/Vundle.vim/,/usr/local/lib/node_modules/typescript-tools
call vundle#begin()
Plugin 'gmarik/vundle'

" # Themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'

" # Enhanced Syntax
Plugin 'otherwise/yajs.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'elzr/vim-json'

" # Extra Syntax
Plugin 'groenewege/vim-less'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'lepture/vim-jinja'
Plugin 'dag/vim-fish'
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leafgarland/typescript-vim'
Plugin 'tfnico/vim-gradle'

" Functionality

" ### Indispensable

" ctrlp is file fuzzy search
Plugin 'kien/ctrlp.vim'
" Ack.vim uses ack to search within files
Plugin 'mileszs/ack.vim'
"Airline provides a stylish appearance for the styleline
Plugin 'bling/vim-airline'
" Syntastic provides syntax info
Plugin 'scrooloose/syntastic'
"Show git info in the gutter, sad that it and syntastic fight for space though
Plugin 'airblade/vim-gitgutter'
"Integrate with tmux
Plugin 'christoomey/vim-tmux-navigator'
"Provides Sublime-Text like smart completion of braces, parens and such
Plugin 'Raimondi/delimitMate'
" Great helpful autocompletion (requires a separate compile step)
Plugin 'Valloric/YouCompleteMe'
"Easy commenting in Vim
Plugin 'tpope/vim-commentary'

" ### Use sometimes

"Nerdtree provides a file explorer, which is sometimes useful. Mostly ctrlp handles file finding though
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" fugitive provides git bindings in Vim.  Don't use too much, but useful for blame
Plugin 'tpope/vim-fugitive'
" Surround is useful for adding surrounding tags to elements (especially html and quotes)
Plugin 'tpope/vim-surround'
" Allows vim-surround to be used with . command
Plugin 'tpope/vim-repeat'
"Adds convenience stuff for writers
Plugin 'reedes/vim-pencil'
"Provide snippets functionality in Vim
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Standardize whitespace
"Plugin 'editorconfig/editorconfig-vim'
"Gives smart completions for Javascript
Plugin 'marijnh/tern_for_vim'


" Experimenting with these

Plugin 'tpope/vim-unimpaired'
Plugin 'itspriddle/vim-marked'

" Not Using anymore/right now
" Provides an alternative way to move quickly through files
"Plugin 'Lokaltog/vim-easymotion'
" Provides integration with dash.app.  I mostly query dash directly
"Plugin 'rizzatti/dash.vim'
"Tries to handle ctrlp/ack.vim/buffer switching tasks, but lacks the attention
"to detail and documentation of those plugins
"Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
" Cool way of setting up projects
"Plugin 'tpope/vim-projectionist'
"Plugin 'merlinrebrovic/focus.vim'
"Plugin 'tpope/vim-eunuch'
"Plugin 'terryma/vim-multiple-cursors'

Plugin 'jewes/Conque-Shell'
Plugin 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM'

" Haskell
Plugin 'neovimhaskell/haskell-vim'
"Plugin 'enomsg/vim-haskellConcealPlus'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'bitc/vim-hdevtools'
Plugin 'eagletmt/neco-ghc'
Plugin 'Twinside/vim-hoogle'
Plugin 'jpalardy/vim-slime'
"Plugin 'Shougo/neocomplete'
Plugin 'majutsushi/tagbar'
Plugin 'mpickering/hlint-refactor-vim'
Plugin 'Twinside/vim-haskellFold'

"End Vundle
call vundle#end()
" "Vundle ended so reenable filetypes
filetype plugin indent on
" "Pull in matchit.vim, which is already bundled with Vim
runtime! macros/matchit.vim

" Appearance
" ==========

" "Syntax highlighting should be in 256 colors
syntax on
syntax enable
set t_Co=256

colorscheme solarized
set background=dark
set guifont=Source\ Code\ Pro\ for\ Powerline

" Sanity Config (Don't edit text like an animal)
" ==============================================

set nocompatible                " Use vim rather than vi settings
set encoding=utf-8              " standard encoding
"set relativenumber             " prefer absolute #
set number                      " Its nice to see line numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set autoread                    " Reload files changed outside vim
set hidden                      " Buffers can exist in the background
set history=1000                " Store lots of :cmdline history (its not 1990)
"Don't dump distracting text to terminal during searches!
set shellpipe=2>/dev/null>
"set re=1                        "Use a non-broken regex engine for syntax highlighting

" General Config
" ==============

let mapleader=','
set showcmd                     " Show incomplete cmds down the bottom
set guicursor=a:block-Cursor-blinkon0
set guicursor=i:ver30-Cursor-blinkwait200-blinkon200-blinkoff200
set laststatus=2                " Always show status line
set splitright                  " Opens vertical split right of current window
set splitbelow                  " Opens horizontal split below current window
set shortmess=filnxtToOI        " see :help shortmess
"set t_ti= t_te=                 "Use a different terminal to run external commands
" Set shell to bash (fish and VIM don't play well together)
set shell=zsh

" Mouse
" ======

" Send more characters for redraws
set ttyfast
" Enable mouse use in all modes
set mouse=a
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2


" Search Settings
" ===============

set incsearch        " Find the next match as we type the search
set hlsearch         " Highlight searches by default
set ignorecase
set smartcase
set viminfo='100,f1  " Save up to 100 marks, enable capital marks
nnoremap <F8> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nnoremap <2-LeftMouse> *
inoremap <2-LeftMouse> <c-o>*

" Turn Off Swap Files
" ===================

set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Persistent Undo
" ===============

" Keep undo history across sessions, by storing in file
" Only works in MacVim (gui) mode
if has('gui_running')
  set undodir=~/.vim/backups
  set undofile
endif

" Indentation and Display
" =======================

" We want to replace tabs with spaces and have 4 space width indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Indent both ways with Tab/Shift-Tab
vnoremap <Tab> >
vnoremap <S-Tab> <

set list listchars=tab:\ \ ,trail:·   " Display tabs and trailing spaces visually
set nowrap                            " Don't wrap lines

" Folds
" =====
set foldmethod=indent   " Fold based on indent
set foldnestmax=5       " Deepest fold is 5 levels
set nofoldenable        " Don't fold by default
nnoremap <space> za
"vnoremap <space> zf

" Completion
" ==========

"set wildmode=list:longest
set wildmenu                    " Enable ctrl-n and ctrl-p to scroll thru matches
set wildmode=longest,list,full
set wildignore=*.o,*.obj,*~,*.pkg,*.dmg,*.pdf,*.wav,*.mov,*.mp3,*.mp4,*.ogg,*.tar,*.gz,*.tgz,*.zip,*.m4v,*.jar,*.doc,*.ppt,*.xls,*.docx,*.pptx,*.xlsx,*.class,.DS_Store,*.svg,*.ttf,*.woff,*.bin,*.dll,*.pyc     " Stuff to ignore when tab completing
set wildignore+=*vim/backups*,*/.hg/*,*/.git/*,*/.svn/*,*/Applications/*,*/Library/*,*/System/*,*/Volumes/*,*/nix/*,*/.emacs/*,*/.emacs.d/*,*/.vim/*,*/.npm/*,*/.m2/repository/*,*/.vagrant.d/*,*/target/*,*/build/*,*/node_modules/*,*/bower_components/*,*/.gradle/daemon/*,*/.gradle/wrapper/*,*/.gradle/caches/*,*/.Trash/*,*/.cache/*,*/.metadata/*,*/.dist-buildwrapper/*,*/dist/*,*/bin/*,*/.node-gyp/*,*/.qgis2/*,*/hoogledb/*,*/.sqldeveloper/*,*/Microsoft\ User\ Data/*

" Scrolling
" =========

" Start scrolling when we're getting close to margins
set scrolloff=10
set sidescrolloff=15
set sidescroll=1



" Plugin Options
" ==============


" Airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set noshowmode " Let airline handle the mode display

"Syntastic Options
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_javascript_checkers = ["#eslint"]
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_balloons = 0


"NerdTree Options

nnoremap <expr> <C-Tab> g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : ':NERDTreeFind<CR>'
let NERDTreeShowHidden=1
let NERDTreeSortHiddenFirst=1
let NERDTreeRespectWildIgnore=1
let NERDTreeMouseMode=2
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=1

autocmd FileType nerdtree nmap <buffer> <Right> o
autocmd FileType nerdtree nmap <buffer> <Left> o

" open automatically if no files specifies
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close when last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0


"YouCompleteMe options
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




"let g:acp_enableAtStartup = 0
" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 1
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

"inoremap <expr><Esc> pumvisible() ? "\<C-y>" : "\<Esc>"
"inoremap <expr><C-Space> neocomplete#start_manual_complete()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType Haskell setlocal omnifunc=necoghc#omnifunc



let g:necoghc_enable_detailed_browse = 1
let g:necoghc_debug = 1




let g:shim_ghciInterp = 'cabal repl'
let g:shim_defaultWindowSize = 7

let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1

"jinja config
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

"Ultisnips config

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

"Markdown options
let g:vim_markdown_folding_disabled=1
let g:pencil#wrapModeDefault = 'hard'   " or 'soft'

" Pencil Options
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
  autocmd FileType text call pencil#init({'wrap': 'hard'})
augroup END

nnoremap <silent> <leader>ps :SoftPencil<cr>
nnoremap <silent> <leader>ph :HardPencil<cr>
nnoremap <silent> <leader>pn :NoPencil<cr>
nnoremap <silent> <leader>pt :TogglePencil<cr>


au BufEnter * nested :filetype detect

" Code formatting
au FileType haskell nnoremap <buffer> <F2> :%!stylish-haskell<CR>
au FileType xml     nnoremap <buffer> <F2> :%!xmllint --format -<CR>


" Haskell

let g:hoogle_search_count = '10 -d $NIX_SHELL_ROOT/hoogledb'
let g:syntastic_haskell_hdevtools_args = '-g-Wall'

au FileType haskell nnoremap <buffer> <silent> <F4> :GhcModExpand<CR>
au FileType haskell nnoremap <buffer> <F5> :Hoogle
au FileType haskell nnoremap <buffer> <F6> :HoogleInfo

" Close Hoogle and then Errors with ESC
autocmd FileType haskell nnoremap <buffer> <expr> <Esc> bufnr(g:hoogle_search_buf_name) >= 0 ? "\:nohlsearch<CR>:HoogleClose<CR>" : "\:nohlsearch<CR>:lclose<CR><Esc>"
" Close Autocomplete and then Hoogle and then Errors with ESC
autocmd FileType haskell inoremap <buffer> <expr> <Esc> pumvisible() ? "\<C-e>" : bufnr(g:hoogle_search_buf_name) >= 0 ? "\<C-o>:nohlsearch<CR><C-o>:HoogleClose<CR>" : "\<C-o>:nohlsearch<CR><C-o>:lclose<CR><Esc>"

autocmd FileType haskell nnoremap <buffer> <C-x><C-x> :GhciRange<CR>
autocmd FileType haskell snoremap <buffer> <C-x><C-x> :GhciRange<CR>
autocmd FileType haskell vnoremap <buffer> <C-x><C-x> :GhciRange<CR>
autocmd FileType haskell nnoremap <buffer> <C-x><C-f> :GhciFile<CR>
autocmd FileType haskell nnoremap <buffer> <C-x><C-r> :GhciReload<CR>

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


autocmd BufEnter * nested :call tagbar#autoopen(0)
let g:tagbar_width = 30
let g:tagbar_singleclick = 1
if exists("g:tagbar_map_openfold")
  unlet g:tagbar_map_openfold
  unlet g:tagbar_map_closefold
endif
let g:tagbar_map_openfold = "<Right>"
let g:tagbar_map_closefold = "<Left>"
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

nnoremap <silent> <C-Left> :wincmd h<CR>
nnoremap <silent> <C-Right> :wincmd l<CR>

" Scroll buffers with Tab, except in NERDTree/Tagbar window
nnoremap <silent> <Tab> :bnext<CR>
autocmd FileType nerdtree noremap <buffer> <Tab> <Nop>
autocmd FileType Tagbar noremap <buffer> <Tab> <Nop>

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

let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window = 'results:20'
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_max_files = 100000

set title
set clipboard=unnamed
set selectmode=key,mouse,cmd
set keymodel=startsel,stopsel
set whichwrap+=<,>,[,]

" CTRL-A is Select all
noremap  <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" one word forward / back
nnoremap <A-left> b
nnoremap <A-right> w
inoremap <A-left> <C-O>b
inoremap <A-right> <C-O>w
vnoremap <A-left> b
vnoremap <A-right> w
snoremap <A-left> <C-O>b
snoremap <A-right> <C-O>w

" start selectionmode with empty selection
inoremap <S-left> <Left><C-o>v
inoremap <S-right> <C-o>v

nnoremap <S-A-left> <S-left>b<C-g>
nnoremap <S-A-right> <S-right>e<C-g>
inoremap <S-A-left> <left><S-left>b<C-g>
inoremap <S-A-right> <S-right>e<C-g>
snoremap <S-A-left> <C-O>b
snoremap <S-A-right> <C-O>e
vnoremap <S-A-left> b
vnoremap <S-A-right> e

" smart home key for indented lines: go to first non-blank character (not
" start of line) of display line (not numbered line)
nnoremap <D-left> g^
nnoremap <D-right> g$
inoremap <D-left> <C-O>g^
inoremap <D-right> <C-O>g$
"alternatively: vg^ to automatically enter visual mode first
nnoremap <S-D-left> vg^ <S-left><C-g>
nnoremap <S-D-right> vg$<S-left><C-g>
inoremap <S-D-left> <left><C-O>vg^ <S-left><C-g>
inoremap <S-D-right> <C-O>vg$<S-left><C-g>
vnoremap <S-D-left> g^ <S-left>
vnoremap <S-D-right> g$
" best solution I could find. adding shift to the shortcut ends visual mode =(
vnoremap <D-left> g^
vnoremap <D-right> g$

" start/end of file
vnoremap <D-up> 1G
vnoremap <D-down> Gg$

