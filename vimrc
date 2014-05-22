""" Example Vim configurajonathanfi-luciueistion.
"" Copy or symlink to ~/.vimrc or ~/_vimrc.

"""""  NeoBundle Config 
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
" My bundles here:
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'roman/golden-ratio'

" UtilSnipets
NeoBundle 'SirVer/ultisnips'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'honza/vim-snippets'

NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'sjl/vitality.vim'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'vim-scripts/Auto-Pairs'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'terryma/vim-multiple-cursors'
" Check for uninstalled bundles
NeoBundleCheck

""" Plugins config
" UtiSnips
" Trigger configuration. Do not use <tab> if you use
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories  = ["snips"]

" Tab resolution bettween ultisnips and ycm
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif 
  endif
  return ""
endfunction
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"


set nocompatible                  " Must come first because it changes other options.

syntax on                         " Turn on syntax highlighting.
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
set foldmethod=syntax

set virtualedit=all             " because blocks rock

set cpoptions+=$                  " Visual help for change word cw

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Ignore temp and bin files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX"
set wildignore+=tmp,.tags
set wildignore+=*.gif,*.jpg,*.png
" Ignore images in rails apps, and vendored files
set wildignore+=public/images
set wildignore+=vendor

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
"let g:ctrlp_map = '<c-q>'
"let g:ctrlp_cmd = 'CtrlPBuffer'
"" Navigate files
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" progaming language number of tabs
autocmd Filetype r setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" Automatic fold settings for specific files. Uncomment to use.
 autocmd FileType ruby setlocal foldmethod=syntax
 autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

