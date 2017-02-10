set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'lokaltog/vim-powerline'
Plugin 'raimondi/delimitmate'
Plugin 'ervandew/supertab'

" theme
Plugin 'tomasr/molokai'

call vundle#end()
filetype plugin indent on     " required

let g:NERDTreeWinSize = 20
let mapleader = " "

"設定 ' ' + n 打開 NERDTree
""設定 ' ' + s 打開 easymotion
map <Leader> <Plug>(easymotion-prefix)

set clipboard=unnamed

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2


nmap <leader>e :NERDTree<cr>
nmap <leader>c :NERDTreeClose<cr>
nnoremap <leader>h gT
nnoremap <leader>l gt

let g:javascript_enable_domhtmlcss = 1
let g:html_indent_inctags = "html,body,head,tbody"

"let g:airline_section_y = '%{strftime("%c")}'
"let g:airline_section_c = '%t'
"let g:airline_section_x = ''
"let g:airline_section_warning = ''

"set status line
set laststatus=2
set showtabline=2
set t_Co=256

set nocompatible
set wildmenu
set backupdir=~/tmp,.,/var/tmp/vi.recover,/tmp
set directory=~/tmp,/var/tmp/vi.recover,/tmp,.
set backup		" keep a backup file
" set textwidth=78
" set shiftwidth=4
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
set showmatch
set nu
set ts=4
set shiftwidth=4
set hlsearch

" VIM 6.0,
if version >= 600
    "set nohlsearch
	 "set foldcolumn=2
	"set foldmethod=syntax
	set foldmethod=marker
    set foldlevel=1
"    set foldtext=/^/=>
     set encoding=utf-8
    " set fileencoding=big5
    " set termencoding=big5
    " set encoding=big5
    " set fileencodings=latin,big5,ucs-bom,utf-8,sjis,big5
    set fileencodings=ucs-bom,utf-8,sjis,big5,gbk
else
    set fileencoding=taiwan
endif

" Tab key binding
if version >= 700
  map  <C-c> :tabnew<CR>
  imap <C-c> <ESC>:tabnew<CR>
  map  <C-k> :tabclose<CR>
  map  <C-p> :tabprev<CR>
  imap <C-p> <ESC>:tabprev<CR>
  map  <C-n> :tabnext<CR>
  "imap <C-n> <ESC>:tabnext<CR>
  map <F4> :set invcursorline<CR>

  map g1 :tabn 1<CR>
  map g2 :tabn 2<CR>
  map g3 :tabn 3<CR>
  map g4 :tabn 4<CR>
  map g5 :tabn 5<CR>
  map g6 :tabn 6<CR>
  map g7 :tabn 7<CR>
  map g8 :tabn 8<CR>
  map g9 :tabn 9<CR>
  map g0 :tabn 10<CR>
  map gc :tabnew<CR>
  map gn :tabn<CR>
  map gp :tabp<CR>

  highlight TabLineSel term=bold,underline cterm=bold,underline ctermfg=7 ctermbg=0
  highlight TabLine    term=bold cterm=bold
  highlight clear TabLineFill


end

" Crontabs must be edited in place
au BufRead /tmp/crontab* :set backupcopy=yes
