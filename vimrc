set nocompatible              " be iMproved, required
filetype on                  " required

syntax on
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set nu
set softtabstop=4
set hlsearch
"set cursorline
set autochdir
" 开启手动代码折叠  eg: zfa{ 折叠大括号区域
set fdm=manual

set laststatus=2

"============ <colorscheme config> ============
" mkdir ~/.vim/colors/
" cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
" onedark主题需要cp autoload文件
" cp  ~/.vim/bundle/onedark.vim/autoload/onedark.vim ~/.vim/autoload/
let g:solarized_termcolors=256
set background=dark
"let g:onedark_termcolors=256
"colorscheme onedark
colorscheme solarized

"============ <encoding config> ============
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,latin1


"============ <minibufexpl config> ============
"不自动打开minibufexpl
let g:miniBufExplorerAutoStart = 0




"============ <keymap config> ============
let mapleader=","

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <leader>m :NERDTreeToggle<CR>
map <F3> :CtrlPBuffer<CR>
map <F4> :YcmCompleter GoToDefinition<CR>
nnoremap <F6> :UndotreeToggle<cr>
nmap <F8> :TagbarToggle<CR>
nmap <leader>n :TagbarToggle<CR>
noremap <F9> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"设置切换Buffer快捷键"
nnoremap <C-M> :bn<CR>
nnoremap <C-N> :bp<CR>
"复制粘贴到系统剪切板
vmap <leader>v "+gp
vmap <leader>c "+y

"打开minibufexpl
nmap <leader>z :MBEToggle<CR>

" 当前无文件编辑窗口时，自动退出
"autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

"============ <DoxygenToolkit config> ============
let g:DoxygenToolkit_authorName="yourname"
let g:DoxygenToolkit_versionString=""
let g:DoxygenToolkit_paramTag_pre="@param [] "
let s:licenseTag = ""
let s:licenseTag = s:licenseTag . "**************************************************************************\<enter>"
let s:licenseTag = s:licenseTag . " \<enter>"
let s:licenseTag = s:licenseTag . " Copyright (c) 2018 xxx.com, Inc. All Rights Reserved\<enter>"
let s:licenseTag = s:licenseTag . " \<enter>" 
let s:licenseTag = s:licenseTag . "**************************************************************************"
let g:DoxygenToolkit_licenseTag = s:licenseTag 
let g:doxygen_enhanced_color=1 
let g:DoxygenToolkit_commentType="C++" 
let g:DoxygenToolkit_classTag = "@class " 


"============ <OmniCpp config> ============
"set tags+=/home/work/workspace/github/hhvm/tags

" 自动隐藏预览窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"set completeopt=menu,menuone " 关掉智能补全时的预览窗口
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1


"============ <autocomplpop插件,一个字母即可补全> ============ 
let g:acp_behaviorKeywordLength = 1  
let g:AutoComplPop_MappingDriven = 1  

"============ <Tagbar config> ============
let g:tagbar_autofocus=1

"============ <use Ag instead Ack> ============
let g:ackprg = 'ag --nogroup --column'

"============ <undotree config> ============
set undodir=~/.vim_undo/
set undofile

"============ <NERDTree config> ============
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeWinSize = 30
" 当NERDTree为剩下的唯一窗口时自动关闭
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowLineNumbers=1
let g:nerdtree_tabs_open_on_console_startup=1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


"============ <airline config> ============
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show=1


"===================== Vundle Start =====================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'joshdick/onedark.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'haya14busa/incsearch.vim'
Plugin 'mbbill/undotree'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'majutsushi/tagbar'
"Plugin 'vim-airline/vim-airline'
Plugin 'TerrySolar/eleline.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'airblade/vim-gitgutter'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
