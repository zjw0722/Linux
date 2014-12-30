" *****************************************************************************
"                                  一般性配置                                 *
" *****************************************************************************
" 关闭vim一致性原则
set nocompatible

" 显示行号
set number

" 设置在编辑过程中右下角显示光标的行列信息
set ruler

" 在状态栏显示正在输入的命令
set showcmd

" 设置历史记录数
set history=1000

" 设置取消备份 禁止临时文件的生成
set nobackup
set noswapfile

" 设置匹配模式
" set showmatch

" 设置自动缩进
set autoindent

" 设置C/C++方式自动对齐
set cindent

" 开启语法高亮功能
syntax enable
syntax on
" 在搜索时，输入的词句逐字符高亮
set incsearch

" 指定配色方案为256色
set t_Co=256
colorscheme murphy
" colorscheme torte
" 设置搜索忽略大小写
set ignorecase

" 设置backspace的工作方式
set backspace=indent,eol,start

" 设置在vim中可以使用鼠标
" set mouse=a

" 设置Tab宽度
set tabstop=4

" 设置自动对齐空格数
set shiftwidth=4

" 设置退格键时可以删除4个空格
set smarttab
set softtabstop=4

" 将Tab键自动转换为空格 编写python代码时应该使用
" set expandtab
" 不将tab转换为空格
set noexpandtab

" 设置编码格式
set encoding=utf-8

" 自动判断编码格式 依次判断一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" 检测文件类型
filetype on

" 针对不同的文件采取不同的缩进方式
filetype indent on

" 允许插件
filetype plugin on

" 启动智能补全
filetype plugin indent on
" ****************************************************************************
"                    新建文件自动插入文件头                                  *
" ****************************************************************************
autocmd BufNewFile *.cpp,*.c exec ":call SetTitle()"
" function SetTitle()
function SetTitle()
	" sh
	if &filetype == 'sh'
		call setline(1, "\#########################################################################")
		call append(line("."), "\# File Name: ".expand("%")"
		call append(line(".") + 1, "\# Author: zjw")
		call append(line(".") + 2, "\# Email: zjw_0722@163.com")
		call append(line(".") + 3, "\# Create Time: ".strftime("%c"))
		call append(line(".") + 4, "\#########################################################################")
		call append(line(".") + 5, "\#!/bin/bash")
		call append(line(".") + 6, "")
	else
		call setline(1, "\/*******************************************************************************")
		call append(line("."), "* File Name		: ".expand("%"))
		call append(line(".") + 1, "* Author		: zjw")
		call append(line(".") + 2, "* Email			: zjw_0722@163.com")
		call append(line(".") + 3, "* Create Time	: ".strftime("%c"))
		call append(line(".") + 4, "*******************************************************************************/")
		call append(line(".") + 5, "")
	endif

	" cpp
	if &filetype == 'cpp'
		call append(line(".") + 6, "#include <iostream>")
		call append(line(".") + 7, "using namespace std;")
		call append(line(".") + 8, "")
	endif
	autocmd BufNewFile * normal G
endfunc

