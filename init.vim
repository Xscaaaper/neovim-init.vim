" ~/.config/nvim/init.vim

" 将空格字符作为键盘映射的前导键
let mapleader=" "
" 设置行号
set number
" 禁用相对行号显示
set norelativenumber
" 启用光标列高亮
set cuc
" 启用光标行高亮
set cul
" 启用语法高亮
syntax on
" 关闭兼容模式
set nocompatible
" 启用文件类型检测
filetype on
" 启用文件类型插件支持
filetype plugin on
" 启用文件类型缩进
filetype indent on
" 启用文件类型插件和缩进支持的组合
filetype plugin indent on
" 启用鼠标支持
set mouse=a
" 编码格式
set encoding=utf-8
" 校正终端配色
let &t_ut=''
" 制表符宽度为 4 个空格
set tabstop=4
" 将制表符自动扩展为相应数量的空格
set expandtab
" 执行缩进操作时每次缩进的宽度为 4 个空格
set shiftwidth=4
" 退格键一次删除4个空格
set softtabstop=4
" 当打开 .make 文件时，将禁用扩展制表符，即不将 Tab 键替换为空格
autocmd FileType make set noexpandtab
" 显示不可见字符（如制表符、空格、行尾符等）
set list
" 自定义显示不可见字符的可见表示形式
set listchars=tab:▸\ ,trail:▫
" 设置光标接近屏幕边缘时，离屏幕边缘的行数
set scrolloff=5
" 设置文本换行的行宽度
set tw=0
" 设置自动缩进的表达式
set indentexpr=
" 光标在行首按退格健回到行尾
set backspace=indent,eol,start
" 设置折叠方法为基于缩进的折叠
set foldmethod=indent
" 设置折叠级别的最大值
set foldlevel=99
" 在终端中更改插入模式下光标的形状
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" 在普通模式下恢复光标的形状
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" 用于在 Vim 窗口的底部显示状态栏
set laststatus=2
" vim使用自动对齐，也就是把当前行的对起格式应用到下一行
set autoindent
" 在打开文件后自动跳转到上次编辑位置的行首
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" 用于突出显示当前光标所在行
set cursorline
" 用于启用文本换行
set wrap
" 用于启用命令行模式的自动补全菜单
set wildmenu
" 用于指定当前文件的编码格式为 UTF-8
set fileencoding=utf-8
" 用于指定当前缓冲区的文本编码格式为 UTF-8
set fenc=utf-8
" 用于指定可接受的文件编码列表
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936,big－5
" 用于在图形用户界面（GUI）中设置 Vim 的字体和字号
set guifont=Monospace\ 16
" 用于在当前光标所在行显示一条高亮的线
set cursorline
" 用于在 Vim 窗口的右下角显示当前光标所在位置的行号和列号
set ruler
" 用于在搜索时忽略大小写
set ignorecase
" 在状态列显示目前所执行的指令
set showcmd
" 用于高亮显示搜索结果
set hlsearch
" 用于取消高亮显示当前的搜索结果
exec "nohlsearch"
" 用于实时增量搜索
set incsearch
" 用于在搜索时智能匹配大小写
set smartcase


noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :noh<CR>
noremap _ 0
noremap + $

noremap H 5h
noremap J 5j
noremap K 5k
noremap L 5l

map s <nop>
map S :w<CR>
map Q :q<CR>
map NR :source ~/.config/nvim/init.vim<CR>

" 向左、下、上、右分屏
map sh :set nosplitright<CR>:vsplit<CR>
map sj :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sl :set splitright<CR>:vsplit<CR>

" 向左、下、上、右切换窗口
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l

" 更改分屏大小
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" 打开标签
map tk :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

" 切换水平、垂直分屏
map sb <C-w>t<C-w>H
map sv <C-w>t<C-w>K


" 插件管理
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'preservim/nerdtree'
Plug 'ervandew/supertab'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

call plug#end()


" 设置颜色主题
" colorscheme default
" colorscheme snazzy
" colorscheme gruvbox
colorscheme onedark

" 设置NerdTree打开的快捷键,可自行更改
map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<CR>


" 在保存文件时确保文件末尾有一个空行
au BufWritePre * :call PreserveTrailingNewline()

function! PreserveTrailingNewline()
    " 获取当前文件的行数
    let line_count = line('$')

    " 检查文件末尾是否存在空行
    let last_line_empty = getline(line_count) =~ '^$'

    " 如果文件末尾没有空行，则在最后一行之后添加一个空行
    if !last_line_empty
        call append(line_count, '')
    endif
endfunction


" 使用 clang-format 进行代码格式化
autocmd FileType cpp nnoremap <buffer> <F12> :call ClangFormat()<CR>
function! ClangFormat()
    let l:original_position = getpos('.')
    execute 'silent !clang-format -i ' . expand('%') | execute 'e!'
    call setpos('.', l:original_position)
endfunction


" 使用 verible-verilog-format 进行 SystemVerilog 代码格式化
autocmd FileType sv nnoremap <buffer> <F12> :%!verible-verilog-format<CR>


" 用于禁用鼠标功能
set mouse-=a
