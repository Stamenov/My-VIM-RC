" Vundle config
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" Plugin for scala from github
Plugin 'derekwyatt/vim-scala'
" Plugin for folding
Plugin 'tmhedberg/SimpylFold'
" For autocomplete---Does this go here?XXX
Bundle 'Valloric/YouCompleteMe'
" file browsing
Plugin 'scrooloose/nerdtree'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
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

" personal config
set nocompatible

source $VIMRUNTIME/vimrc_example.vim

source $VIMRUNTIME/mswin.vim

behave mswin



set diffexpr=MyDiff()

function MyDiff()

  let opt = '-a --binary '

  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif

  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif

  let arg1 = v:fname_in

  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif

  let arg2 = v:fname_new

  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif

  let arg3 = v:fname_out

  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif

  let eq = ''

  if $VIMRUNTIME =~ ' '

    if &sh =~ '\<cmd'

      let cmd = '""' . $VIMRUNTIME . '\diff"'

      let eq = '"'

    else

      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'

    endif

  else

    let cmd = $VIMRUNTIME . '\diff'

  endif

  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq

endfunction



" Switch line numbers on, and get mouse interaction

set number

set mouse=a



" Switch search highlighting and incremental search

set hlsearch

set incsearch

" Show matching brackets when text indicator is over them

set showmatch



"Switch autoread on: reread a file if it was changed outside of VIM

set autoread



" Set word wrap, not just text wrap

set wrap linebreak nolist



" Enable syntax highlighting

syntax enable

filetype plugin indent on

" Get decent tabs

set shiftwidth=2
set tabstop=2



" Use -/= to backward/forward for buffers

nnoremap - :bprev<CR>

nnoremap + :bnext<CR>



" Toggle wrapping

nnoremap <Leader>w :set wrap!<CR>



" Turn off the swap files

set noswapfile



" Turn backup off, since most stuff is in SVN, git et.c anyway...

set nobackup

set nowb

" add cursorline 
set cursorline

" setting vertical and horizontal split locations:
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" integrate system and vim clipboard
set clipboard=unnamed

" enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" see docstrings in folded code:
" let g:SimpylFold_docstring_preview=1

" for autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ignore pyc file:
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" nerdtree coggle to cntl+n
map <C-n> :NERDTreeToggle<CR>
