
set nocompatible

" 设置字体
set guifont=Menlo:h14

" 设置行距
set linespace=6

" 显示行号
set nu

" 语法高亮
syntax on

" File type detection
filetype on  
" Loading the plugin files for specific file types
filetype plugin on  
" Loading the indent files for specific file types
filetype indent on  

" 没有保存或文件只读时弹出确认
set confirm

" 鼠标可用
set mouse=a

" 复制到系统剪切板
set clipboard=unnamed

" tab缩进
set expandtab
set tabstop=4
set shiftwidth=4

" 文件自动检测外部更改
set autoread

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

""""""""""""""设置折叠""""""""""
" 允许折叠
set foldenable

" 根据语法折叠
set fdm=syntax

" 手动折叠
" set fdm=manual

"设置键盘映射，通过空格设置折叠
nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>

""""""""""""""""""""""""""""""""""""""""""""""
" 不要闪烁
set novisualbell

" 启动显示状态行
set laststatus=2

" 浅色显示当前行
"autocmd InsertLeave * se nocul

" 用浅色高亮当前行
autocmd InsertEnter * se cul

" 显示输入的命令
set showcmd

" 编码
""""""""""""""""""""""""""""""""""""""""""
" 编辑文件的编码方式，从前向后逐一探测
set fileencodings=utf-8,chinese,latin-1

" vim所工作终端的字符编码方式
set termencoding=utf-8

" vim内部使用的编码方式，包括buffer， 菜单文本，消息文本等
set encoding=utf-8

set nobackup

" plug 插件: https://github.com/junegunn/vim-plug
" Installation: curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" A tree explorer plugin for vim
Plug 'scrooloose/nerdtree'

" Vim plugin for intensely orgasmic commenting
Plug 'scrooloose/nerdcommenter'

" A git wrapper
Plug 'tpope/vim-fugitive'

" A powerful syntax and fuzzy completion completion engine 
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Adaptation of one-light and one-dark colorschemes for Vim
Plug 'rakr/vim-one'

" Initialize plugin system
call plug#end()

" Open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" A specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" Set one theme
colorscheme one
set background=dark
" set background=light

" Airline theme
let g:airline_theme='one'

" ycm completion config
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_warning_symbol = '->'
let g:ycm_complete_in_comments = 1
" YCM's identifier completer will seed its identifier database with the keywords
" of the programming language you're writing
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" Close preview window after leaving insert mode
let g:ycm_autoclose_preview_window_after_insertion = 0
let g:ycm_key_invoke_completion = '<D-i>'

" Some key mapping
nmap <D-1> 1gt
nmap <D-2> 2gt
nmap <D-3> 3gt
nmap <D-4> 4gt
nmap <D-5> 5gt
nmap <D-6> 6gt
nmap <D-7> 7gt
nmap <D-8> 8gt
nmap <D-9> 9gt

" A very simple quick run
" TODO: 待完善
map <D-r> :call QuickRun()<CR>

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

