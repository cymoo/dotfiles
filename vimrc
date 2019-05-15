set nocompatible

"""""""""""
" Basic config
"""""""""""

" 语法高亮
syntax on

" File type detection
filetype on  
" Loading the plugin files for specific file types
filetype plugin on  
" Loading the indent files for specific file types
filetype indent on  

" 设置字体
set guifont=Menlo:h15

" 设置行距
set linespace=8

" 显示行号
set nu

" 没有保存或文件只读时弹出确认
set confirm

" 文件自动检测外部更改
set autoread

" 鼠标可用
set mouse=a

" 复制到系统剪切板，还可在可视模式下选择的内容发送到剪贴板
set clipboard=unnamed,autoselect

" Tab缩进
set expandtab
set tabstop=4
set shiftwidth=4

" 自动对齐
set autoindent
" 智能缩进
set smartindent

" 高亮查找匹配
set hlsearch
" 增量搜索
set incsearch
set ignorecase
set showmatch

" 显示标尺
set ruler

" 允许折叠
set foldenable
" 根据语法折叠
set foldmethod=syntax
" 手动折叠
" set foldmethod=manual
" 若编辑python时，使用indent折叠
autocmd filetype python set foldmethod=indent
" 关闭默认折叠
set foldlevelstart=99

" 不要闪烁
set novisualbell

" 启动显示状态行
set laststatus=2

" 显示输入的命令
set showcmd

" 编辑文件的编码方式，从前向后逐一探测
set fileencodings=utf-8,chinese,latin-1

" vim所工作终端的字符编码方式
set termencoding=utf-8

" vim内部使用的编码方式，包括buffer， 菜单文本，消息文本等
set encoding=utf-8

set nobackup

" 如果多少毫秒内没有输入，swap文件将被写入磁盘，默认为4s，gitgutter推荐设置为100ms
set updatetime=100

"设置键盘映射，通过空格设置折叠
nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>
" Reselect after > or <
xnoremap < <gv
xnoremap > >gv
" 切分窗口
nnoremap sv <C-w>v
nnoremap ss <C-w>s
" 打开两个窗口时，在一个窗口滚动另一个窗口内容
nnoremap vd <C-w>w<C-d><C-w>p
nnoremap vu <C-w>w<C-u><C-w>p
" 切换tab
nnoremap <D-1> 1gt
nnoremap <D-2> 2gt
nnoremap <D-3> 3gt
nnoremap <D-4> 4gt
nnoremap <D-5> 5gt
nnoremap <D-6> 6gt
nnoremap <D-7> 7gt
nnoremap <D-8> 8gt
nnoremap <D-9> 9gt
" A very simple quick run
nnoremap <D-r> :call QuickRun()<CR>

" 用浅色高亮当前行
autocmd InsertEnter * se cul
" 浅色显示当前行
"autocmd InsertLeave * se nocul
" 保存vimrc时，自动重载
autocmd BufWritePost $MYVIMRC source $MYVIMRC

""""""""""
" Functions
"""""""""""

func! QuickRun()
    if &filetype == 'c'
        exec '!gcc % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!time python3 %'
    elseif &filetype == 'sh'
        :!time bash %
    endif
endfunc

"""""""""""
" Pluggin: https://github.com/junegunn/vim-plug
"""""""""""

" 1. Manual Installation
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" 2. Automatic Installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins: avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" A collection of language packs for vim
Plug 'sheerun/vim-polyglot'

" A dark Vim/Neovim color scheme inspired by Atom's One Dark Syntax theme
Plug 'joshdick/onedark.vim'

" A powerful syntax and fuzzy completion completion engine 
" 还需要下载clang，并手动编译, https://github.com/Valloric/YouCompleteMe
Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer' }

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" A vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'

" A vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks
Plug 'airblade/vim-gitgutter'

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" Initialize plugin system
call plug#end()

" Set color scheme to onedark theme
colorscheme onedark

" Airline theme
let g:airline_theme='onedark'

" ycm completion config
let g:ycm_python_binary_path = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_warning_symbol = '->'
let g:ycm_complete_in_comments = 1
" YCM's identifier completer will seed its identifier database with the keywords
" of the programming language you're writing
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
" Close preview window after leaving insert mode
" let g:ycm_autoclose_preview_window_after_insertion = 0
" let g:ycm_key_invoke_completion = '<D-;>'
let g:ycm_semantic_triggers =  {'c,cpp,python,java,go': ['re!\w{2}'], 'cs,lua,javascript': ['re!\w{2}']}

" A specific key or shortcut to open NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

