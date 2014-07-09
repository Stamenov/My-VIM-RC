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

" Use -/= to backward/forward for buffers
nnoremap - :bprev<CR>
nnoremap = :bnext<CR>

" Toggle wrapping
nnoremap <Leader>w :set wrap!<CR>

" Turn off the swap files
set noswapfile

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb

" Set specialized settings based on GUI or console
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Consolas\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
  colorscheme murphy
  set lines=35 columns=110
else
  set background=dark
  colorscheme desert
endif

