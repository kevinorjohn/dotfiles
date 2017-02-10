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

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-airline'
"Plugin 'lokaltog/vim-powerline'
Plugin 'valloric/youcompleteme'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'raimondi/delimitmate'
"Plugin 'honza/vim-snippets'
Plugin 'stanangeloff/php.vim'
Plugin 'pangloss/vim-javascript'
"Plugin 'ervandew/supertab'

" theme
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'amadeus/vim-evokai'

call vundle#end()
filetype plugin indent on     " required


" If no screen, use color term
if ($TERM == "vt100")
  " xterm-color / screen
  set t_Co=8
  set t_AF=[1;3%p1%dm
  set t_AB=[4%p1%dm
endif

if filereadable($VIMRUNTIME . "/vimrc_example.vim")
 so $VIMRUNTIME/vimrc_example.vim
endif

if filereadable($VIMRUNTIME . "/macros/matchit.vim")
 so $VIMRUNTIME/macros/matchit.vim
endif

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

let g:airline_section_y = '%{strftime("%c")}'
let g:airline_section_c = '%t'
let g:airline_section_x = ''
let g:airline_section_warning = ''

"set status line
set laststatus=2
set t_Co=256
""enable powerline-fonts
let g:airline_powerline_fonts = 1

" enable tabline
let g:airline#extensions#tabline#enabled = 1

let g:solarized_termcolors=256

" YouCompleteMe Configuration
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
" 自動補全配置
set completeopt=longest,menu "讓Vim的補全菜單行為與一般IDE一致(參考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "離開插入模式後自動關閉預覽窗口
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" "回車即選中當前項
"上下左右鍵的行為 會顯示其他信息
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme 默認tab s-tab 和自動補全衝突
let g:ycm_server_python_interpreter = 'python3'
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Tab>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "關閉加載.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 開啟 YCM 基於標籤引擎
let g:ycm_min_num_of_chars_for_completion=2 " 從第2個鍵入字符就開始羅列匹配項
let g:ycm_cache_omnifunc=0 " 禁止緩存匹配項,每次都重新生成匹配項
let g:ycm_seed_identifiers_with_syntax=1 " 語法關鍵字補全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR> "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在註釋輸入中也能補全
let g:ycm_complete_in_comments = 1
"在字符串輸入中也能補全
let g:ycm_complete_in_strings = 1
"註釋和字符串中的文字也會被收入補全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳轉到定義處

" indent guide
" The default mapping to toggle the plugin is <Leader>ig
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

syntax on

colorscheme molokai
"colorscheme solarized
set background=dark	" another is 'light'
"set background=light
"let g:molokai_original = 1
let g:rehash256 = 1
let g:airline_theme="lucius"
"let g:airline_teme="murmur"
"let g:airline_theme="badwolf"
"let g:airline_theme="tomorrow"

set cursorline
set mouse=a
autocmd filetype python setlocal colorcolumn=80

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
"map <C-V> "+gP
"map <S-Insert> "+gP

cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature. They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>

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
