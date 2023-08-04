" Plugin manager settings {{{
set nocompatible              " be iMproved, required
filetype off                  " required
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'kien/ctrlp.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hdima/python-syntax'
Plug 'junegunn/fzf.vim'
Plug '/usr/bin/fzf'
Plug 'metakirby5/codi.vim'
Plug 'tpope/vim-commentary'
Plug 'jkramer/vim-checkbox'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'brauner/vimtux'
Plug 'RyanMillerC/better-vim-tmux-resizer'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'christoomey/vim-tmux-runner'
Plug 'ap/vim-css-color'
Plug 'chase/vim-ansible-yaml'
" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}
" Key mappings {{{

" change the mapleader from \ to ,
let mapleader=','

" Run python code
autocmd FileType python map <buffer> <leader>r :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <leader>r <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=ru_ru,en_us<CR>

" save session
" nnoremap <leader>s :mksession<CR>

" copy paste
" "+ for CLIPBOARD X11 selection
" "* for PRIMARY X11 selection
" Source: https://reddit.com/r/vim/comments/e65ghj/how_do_you_paste_from_vim_to_other_places_browser/f9nybs8/
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>d "+d
nnoremap <leader>d "+d

" map NERDTree toggle key
" map <C-n> :NERDTreeToggle %<CR>
" Open nerd tree at the current file or close nerd tree if pressed again.
" Src: https://github.com/nickjj/dotfiles/blob/master/.vimrc
nnoremap <silent> <expr> <C-n> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>


" Close the current buffer but keep a window
" Src: https://stackoverflow.com/questions/1444322/how-can-i-close-a-buffer-without-closing-the-window
" map <leader>q :b#<bar>bd#<CR>
nnoremap <leader>q :<c-u>enew<bar>bd #<cr>
map <leader>Q :bp<bar>sp<bar>bn<bar>bd<CR>
" Comfy search and replace
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn

" resize panes in tmux
let g:tmux_resizer_no_mappings = 1

nnoremap <silent> <Left> :TmuxResizeLeft<CR>
nnoremap <silent> <Down> :TmuxResizeDown<CR>
nnoremap <silent> <Up> :TmuxResizeUp<CR>
nnoremap <silent> <Right> :TmuxResizeRight<CR>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C->> :TmuxNavigatePrevious<cr>

" Vimrunner
nnoremap <leader>p :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'ipython'}<cr>

" Insert current date
nnoremap <leader>td :put =strftime(\"%Y-%m-%d\")<CR>

" }}}
" Plugins settings {{{

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

" Vim tmux navigator settings
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" Nerdtree
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1

" Vimwiki
let g:vimwiki_list = [{'path': '~/work/notes/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_url_maxsave=0

" Vimrunner
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1
let g:vtr_filetype_runner_overrides = {
            \ 'ruby': 'load "{file}"',
            \ }
let g:VtrUseVtrMaps = 1
au BufRead, *.rb nmap <F5> :VtrSendFile<cr>
" }}}
" Visual settings {{{

" papercolor theme settings
set t_Co=256   " This is may or may not needed.

" change background color based on the time of day
" if strftime("%H") > 8 && strftime("%H") < 18
"     set background=light
" else
"     set background=dark
" endif
set background=dark
colorscheme PaperColor

" vim airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" disable keymap indication in left bottom
let g:airline#extensions#keymap#enabled = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
" }}}
" Editor settings {{{

" hide startup message
set shortmess+=I

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" configure editor with tabs and nice stuff...
set expandtab           " enter spaces when tab is pressed
" set textwidth=80        " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set modelines=1         " make the last line in this file be a file specific setting for folding
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerful
set backspace=indent,eol,start

" disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

syntax enable           " syntax highlighting
set showcmd             " shows the last command entered in the bottom right

" shows line numbers
set number relativenumber

set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" make vim working with cyrillic alphabet
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

set ignorecase          " ignore case when searching
set smartcase           " ignore case when pattern is all small case
                        " case-sensitive othervise
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on intend level
" }}}
" Backups {{{

" move backups to /tmp
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Custom functions {{{

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
" File encoding {{{

"set encoding=utf-8
"set termencoding=utf-8

set fileencodings=utf-8,cp1251,cp866,koi8-r

" <F7> File fileformat (dos - <CR> <NL>, unix - <NL>, mac - <CR>)
map <F7>	:execute RotateFileFormat()<CR>
vmap <F7>	<C-C><F7>
imap <F7>	<C-O><F7>
let b:fformatindex=0
function! RotateFileFormat()
  let y = -1
  while y == -1
    let encstring = "#unix#dos#mac#"
    let x = match(encstring,"#",b:fformatindex)
    let y = match(encstring,"#",x+1)
    let b:fformatindex = x+1
    if y == -1
      let b:fformatindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":set fileformat=".str
    endif
  endwhile
endfunction

" <F8> File encoding for open
" ucs-2le - MS Windows unicode encoding
map <F8>	:execute RotateEnc()<CR>
vmap <F8>	<C-C><F8>
imap <F8>	<C-O><F8>
let b:encindex=0
function! RotateEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1
    if y == -1
      let b:encindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":e ++enc=".str
    endif
  endwhile
endfunction

" <Shift+F8> Force file encoding for open (encoding = fileencoding)
map <S-F8>	:execute ForceRotateEnc()<CR>
vmap <S-F8>	<C-C><S-F8>
imap <S-F8>	<C-O><S-F8>
let b:encindex=0
function! ForceRotateEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:encindex)
    let y = match(encstring,"#",x+1)
    let b:encindex = x+1
    if y == -1
      let b:encindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      :execute "set encoding=".str
      return ":e ++enc=".str
    endif
  endwhile
endfunction

" <Ctrl+F8> File encoding for save (convert)
map <C-F8>	:execute RotateFEnc()<CR>
vmap <C-F8>	<C-C><C-F8>
imap <C-F8>	<C-O><C-F8>
let b:fencindex=0
function! RotateFEnc()
  let y = -1
  while y == -1
    let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
    let x = match(encstring,"#",b:fencindex)
    let y = match(encstring,"#",x+1)
    let b:fencindex = x+1
    if y == -1
      let b:fencindex = 0
    else
      let str = strpart(encstring,x+1,y-x-1)
      return ":set fenc=".str
    endif
  endwhile
endfunction

set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P
set laststatus=2
set wildmenu
set wcm=<Tab>

" add menu just because why not
menu Encoding.koi8-u :e ++enc=8bit-koi8-u<CR>
menu Encoding.windows-1251 :e ++enc=8bit-cp1251<CR>
menu Encoding.ibm-866 :e ++enc=8bit-ibm866<CR>
menu Encoding.utf-8 :e ++enc=2byte-utf-8 <CR>
map <F9> :emenu Encoding.<TAB>
" }}}
set clipboard^=unnamed,unnamedplus
set guifont=Terminus\ Medium\ 10
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set noswapfile
set undofile

vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars
nnoremap <leader>t I* [ ]<space><esc>
let g:insert_checkbox_prefix = '* '
let g:checkbox_states = [' ', 'X']
" vim:foldmethod=marker:foldlevel=0
