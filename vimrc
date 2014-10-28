"""""  NeoBundle Config 
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
"call neobundle#rc(expand('~/.vim/bundle/'))
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" My bundles here:
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'roman/golden-ratio'
NeoBundle 'godlygeek/tabular'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'sjl/vitality.vim'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-obsession'             "session management
NeoBundle 'vim-scripts/Auto-Pairs'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'bling/vim-airline'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'ervandew/supertab'
" Check for uninstalled bundles
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

set nocompatible                  " Must come first because it changes other options.

syntax on                         " Turn on syntax highlighting.
syntax spell toplevel             " check syntaxe correctly on latex files
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

set nofoldenable
set foldmethod=indent

set virtualedit=all             " because blocks rock

set cpoptions+=$                  " Visual help for change word cw

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

let g:airline_powerline_fonts = 1 " automatically populate the g:airline_symbols
" Solarized stuff
set background=light
colorscheme solarized

" Diferentiate between INSERT and NORMAL mode with insert line
set cursorline
autocmd InsertEnter * set cursorline! 
autocmd InsertLeave * set cursorline

" Tab mappings.
" map <leader>tt :tabnew<cr>
" map <leader>te :tabedit
" map <leader>tc :tabclose<cr>
" map <leader>to :tabonly<cr>
" map <leader>tn :tabnext<cr>
" map <leader>tp :tabprevious<cr>
" map <leader>tf :tabfirst<cr>
" map <leader>tl :tablast<cr>
" map <leader>tm :tabmove

" Mappings custom 
" tab for auto complete
"imap <Tab> <C-P>
" press jk in insert mode to enter command mode 
imap jk <c-c>
" Autocomplete will pull from keywords in the current file, other buffers (closed or still
" open), and from the current tags file
set complete=.,b,u,]
" Closest to zsh completion
set wildmode=longest,list:longest

" Navigate open buffers
let g:ctrlp_map = '<c-q>'
let g:ctrlp_cmd = 'CtrlPBuffer'
"" Navigate files
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" progaming language number of tabs
autocmd Filetype r setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" Automatic fold settings for specific files. Uncomment to use.
 autocmd FileType ruby setlocal foldmethod=syntax
 autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

set relativenumber        " toggle relative line numbers

" ctrl-n shortcut to toggle between relative and absolute line numbers
"function! NumberToggle()
  "if(&relativenumber == 1)
    "set number
  "else
    "set relativenumber
  "endif
"endfunc

"nnoremap <C-n> :call NumberToggle()<cr>

" Switch to absolute line numbers when vim loses focus
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" Switch to absolute line numbers when in insert mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" reduce esc  key lag
set timeoutlen=1000 ttimeoutlen=0

" Speed up screen drawing
" Syntax coloring lines that are too long just slows down the world
"set synmaxcol=128
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
set re=1 "set regex engine to older one, might speedup vim

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Auto remove trailing whitespace
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" VIM-Latex specific
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
"set wildignore+=*.log,*.aux,*.dvi,*.aut,*.aux,*.bbl,*.blg,*.dvi,*.fff,*.log,*.out,*.pdf,*.ps,*.toc,*.ttt,*.m*,*.lo*,*.eps,*.sty,*.backupn

" set default register to the clipboard
set clipboard=unnamed                    

" stop swap files
set nobackup
set nowritebackup
set noswapfile

"" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"""""""""""""""""""""""""""""""""""""""""""
""""""     Personal shortcuts       """""""
"""""""""""""""""""""""""""""""""""""""""""
"
" Replace current selected text, on current buffer
nnoremap <leader>r :%s///g<left><left>

" Opens buffer list
nnoremap <leader>b :buffers<CR>:buffer<Space>

" Save all buffers
nnoremap <leader>ss :wa<CR>

" Save all buffers and quit
nnoremap <leader>sq :xa<CR>

" Quit all, not if there are unsaved changes
nnoremap <leader>qq :qa<CR>

" Use enter, and shift enter to add a new line in exec mode
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k
