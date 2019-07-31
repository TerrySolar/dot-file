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


"===================== Self Functions Start =====================
if exists("loaded_gendocument")
    finish
endif
let loaded_gendocument = 1

let g:KeyWordsPrefixToErase = "inline,extern,\"C\",virtual,static,"
let g:TokenNotInFunDeclare = "#,{,},;,"
let g:MAX_PARAM_LINE = 12 

function! <SID>DateInsert()
	$read !date /T
endfunction

function! <SID>OpenNew()
	let s = input("input file name: ")
	execute  ":n"." ".s
endfunction


" Function : GetNthItemFromList (PRIVATE)
" Purpose  : Support reading items from a comma seperated list
"            Used to iterate all the extensions in an extension spec
"            Used to iterate all path prefixes
" Args     : list -- the list (extension spec, file paths) to iterate
"            n -- the extension to get
" Returns  : the nth item (extension, path) from the list (extension 
"            spec), or "" for failure
" Author   : Michael Sharpe <feline@irendi.com>
" History  : Renamed from GetNthExtensionFromSpec to GetNthItemFromList
"            to reflect a more generic use of this function. -- Bindu
function! <SID>GetNthItemFromList(list, n, sep) 
   let itemStart = 0
   let itemEnd = -1
   let pos = 0
   let item = ""
   let i = 0
   while (i != a:n)
      let itemStart = itemEnd + 1
      let itemEnd = match(a:list, a:sep, itemStart)
      let i = i + 1
      if (itemEnd == -1)
         if (i == a:n)
            let itemEnd = strlen(a:list)
         endif
         break
      endif
   endwhile 
   if (itemEnd != -1) 
      let item = strpart(a:list, itemStart, itemEnd - itemStart)
   endif
   return item 
endfunction


function! DebugStr(s)
	return
	echo a:s
endfunction

function! <SID>MatchInList(s, l)
	let i=1
	let kw = <SID>GetNthItemFromList(a:l, i, ",")
	while (strlen(kw)>0)
		call DebugStr("MatchInList Nth ".kw)
		if (match(a:s, kw)!=-1)
			return i
		endif
		let i = i+1
		let kw = <SID>GetNthItemFromList(a:l, i, ",")
	endwhile
	return -1
endfunction


function! <SID>ErasePrefix(s)
	let i=1 
	let ts = substitute(a:s, '^\s\+', "", "")  		
	let kw = <SID>GetNthItemFromList(g:KeyWordsPrefixToErase, i, ",")

	while (strlen(kw)>0)
		call  DebugStr("ErasePrefix Nth ".kw)
		let ts = substitute(ts, '^'.kw, "", "")  	
		let ts = substitute(ts, '^\s\+', "", "")  		
		let i = i+1
		let kw = <SID>GetNthItemFromList(g:KeyWordsPrefixToErase, i, ",")
	endwhile
	return ts
endfunction

	

"pass in : ' int a[23] '
"return  : "int[23],a"
function! <SID>GetSingleParamInfo(s, isparam)
	" unsigned int * ass [1][2]
	
	let single_param = a:s
	call DebugStr("single param ".single_param)
	

	if (a:isparam)
		" erase default value , eg int a = 10
		let single_param = substitute(single_param, '=\(.\+\)', "", "g")  
	endif
	
	" erase ending blank
	let single_param = substitute(single_param, '\(\s\+\)$' , "", "")
	
	" erase blank before '['
	let single_param = substitute(single_param, '\(\s\+\)[', "[", "g")  
	"exec DebugStr(single_param)

	let single_param = substitute(single_param, '^\s\+', "", "")  
	"exec DebugStr(single_param)

	" erase blank before '*' | '&'
	let single_param = substitute(single_param, '\(\s\+\)\*', "*", "g")  
	let single_param = substitute(single_param, '\(\s\+\)&', "\\&", "g")  
	"exec DebugStr(single_param)

	" insert blank to * (&), eg int *i => int * i
	let single_param = substitute(single_param, '\(\*\+\)', "\\0 ", "")  
	let single_param = substitute(single_param, '\(&\+\)', "\\0 ", "")  
	
	call DebugStr("single param processed:" .single_param. "END")
	"call DebugStr("single param processed:" .single_param)

	"let match_res = matchlist(single_param, '\(.\+\)\s\+\(\S\+\)')
	"'^\s/*\(.\+\)\s\+\(.\+\)\s/*$')     
	"exec DebugStr(match_res)
	"let type = match_res[1]
	"let name = match_res[2]
	
	let pos = match(single_param, '\S\+$')
	
	if (pos==-1)
		call DebugStr("pos==-1")
		return ""
	endif

	let type = strpart(single_param, 0, pos-1)
	let name = strpart(single_param, pos)
	
	" type can be "", eg c++ constructor
	if (strlen(name)==0)
		call DebugStr("strlen(name)==0")
		return ""
	endif
	
	if (a:isparam && strlen(type)==0)
		call DebugStr("a:isparam && strlen(type)==0")
		return ""
	endif	

	let bpos = match(name, "[")
	if (bpos!=-1)
		let type = type . strpart(name, bpos)
		let name = strpart(name, 0, bpos)
	endif

	"trim final string
	let type = substitute(type, '\(\s\+\)$' , "", "")
	let name = substitute(name, '\(\s\+\)$' , "", "")
	
	let ret = type.",". name.","
	call DebugStr("RET GetSingleParamInfo " . ret)	
	return ret
endfunction




function! <SID>GetUserName()
	let home = $HOME
	let user = matchstr(home, '[^/\\]\+$')
	return user
endfunction

function! <SID>GetDate()
	"windows
	let date = system("date /T")
	if (v:shell_error!=0)
		"linux
		let date = system("date +\"%Y/%m/%d %H:%M:%S\" ")
	endif

	if (date[strlen(date)-1]=="\n")
		let date = strpart(date, 0, strlen(date)-1)
	endif
	return date
endfunction

function! <SID>GetYear()
	return strftime("%Y")
endfunction

function! <SID>GetLastModifiedDate()
	let fname = expand("%")
	let	date = getftime(fname)
	let strDate = strftime("%c", date)
	return strDate
endfunction	

function! <SID>GetFileName()
	let fname = expand("%")
	return fname
endfunction
function! <SID>GetVer()
  let fname = system("cvs st ".<SID>GetFileName()." |grep -o \"Sticky Tag:.*\"|awk -F'[\t\t]' '{print $3}' ")
  if (strlen(matchstr(fname, "PD_BL")) <= 0)
	  let fname = system("cvs st ".<SID>GetFileName()."|grep -o \"Working revision:.*\"|awk -F'[\t]' '{print $2}' ")
	  if ( strlen(fname) > 6)
		  let fname = "1.0"
	  endif
  endif
	if (fname[strlen(fname)-1]=="\n")
		let fname = strpart(fname,0,strlen(fname)-1)
	endif
	return fname
endfunction

function! <SID>GetEmail()
  return "wanzhiqiang@baidu.com"
endfunction

function! <SID>GetDoxFileHeader(leading_blank)

	let doc = ""
  let doc = doc. a:leading_blank."/***************************************************************************\n"
	let doc = doc. a:leading_blank." * \n"
  let doc = doc. a:leading_blank." * Copyright (c) ".<SID>GetYear()." Baidu.com, Inc. All Rights Reserved\n"
  let doc = doc. a:leading_blank." * \n"
  let doc = doc. a:leading_blank." **************************************************************************/\n"
  let doc = doc. a:leading_blank." \n \n \n"
  let doc = doc. a:leading_blank."/**\n"
	let doc = doc. a:leading_blank." * @file ".<SID>GetFileName()."\n"
	let doc = doc. a:leading_blank." * @author ".<SID>GetUserName()."(".<SID>GetEmail().")\n"
	let doc = doc. a:leading_blank." * @date ".<SID>GetDate()."\n"
	let doc = doc. a:leading_blank." * @brief \n"
	let doc = doc. a:leading_blank." *  \n"
	let doc = doc. a:leading_blank." **/\n"
  call append(line('$'), "/* vim: set expandtab ts=4 sw=4 sts=4 tw=100: */")
	return doc


endfunction

function! <SID>GetDoxMainpage(leading_blank)

	let doc = ""
	let doc = doc.a:leading_blank."/**\n"
	let doc = doc.a:leading_blank."* @mainpage xxx介绍及使用方法 \n"
	let doc = doc.a:leading_blank."* \<h2>概述</h2>\n"
	let doc = doc.a:leading_blank."* <p>xxxxxxxxxxx</p>\n"
	let doc = doc.a:leading_blank."* <ol></ol>\n"
	let doc = doc.a:leading_blank."* <h2>使用方法</h2>\n"
	let doc = doc.a:leading_blank."* <hr>\n"
	let doc = doc.a:leading_blank."* <p>问题请发送<a href=\"mailto:".<SID>GetEmail()."?subject=[dilib]\">.".<SID>GetEmail()."</a></p>\n"
	let doc = doc. a:leading_blank."*/\n"
	return doc
endfunction

function! <SID>GetDoxClass(leading_blank)
	let doc = ""
	let doc = doc.a:leading_blank."/**\n"
	let doc = doc. a:leading_blank."* @brief short description\n"
	let doc = doc. a:leading_blank."*   detail description\n"
	let doc = doc. a:leading_blank."*  \n"
	let doc = doc. a:leading_blank."*/\n"
	return doc
endfunction
function! <SID>GetDoxGroup(leading_blank)
	let doc = ""
	let doc = doc.a:leading_blank."/** @addtogroup groupname\n"
	let doc = doc. a:leading_blank."*  \n"
	let doc = doc. a:leading_blank."* <ul>\n"
	let doc = doc. a:leading_blank."* <li> item1\n"
	let doc = doc. a:leading_blank."* 	<ol>\n"
	let doc = doc. a:leading_blank."* 	<li> subitem11\n"
	let doc = doc. a:leading_blank."* 	<li> subitem12\n"
	let doc = doc. a:leading_blank."* 	</ol>\n"
	let doc = doc. a:leading_blank."* <li> item2\n"
	let doc = doc. a:leading_blank."* 	<ol>\n"
	let doc = doc. a:leading_blank."* 	<li> subitem21\n"
	let doc = doc. a:leading_blank."* 	<li> subitem22\n"
	let doc = doc. a:leading_blank."* 	</ol>\n"
	let doc = doc. a:leading_blank."* </ul>\n"
	let doc = doc. a:leading_blank."* @{\n"
	let doc = doc. a:leading_blank."*/\n"
	let doc = doc. a:leading_blank." \n"
	let doc = doc. a:leading_blank."/** @} */\n"
	return doc
endfunction

function! <SID>GetDoxFH(type)
	let l:synopsisLine=line(".")+1
    let l:synopsisCol=col(".")

	let cur_line = line(".")
    let first_line = getline(cur_line)
	let leading_blank = matchstr(first_line, '\(\s*\)')
	if (a:type == 1) 
		let doc = <SID>GetDoxFileHeader(leading_blank)
	elseif (a:type == 0)
		let doc = <SID>GetDoxMainpage(leading_blank)
	elseif (a:type == 2)
		let doc = <SID>GetDoxClass(leading_blank)
		if (strlen(matchstr(first_line, '\S'))==0)
			return
		endif
	elseif (a:type == 3)
		let doc = <SID>GetDoxGroup(leading_blank)
	endif
	if (strlen(doc)>0)
		let idx =1
		let li = <SID>GetNthItemFromList(doc, idx, "\n")
		while (strlen(li)>0)
			call append( cur_line-1, li.expand("<CR>"))
			let idx = idx + 1
			let cur_line = cur_line + 1
			let li = <SID>GetNthItemFromList(doc, idx, "\n")
		endwhile
	endif

    exec l:synopsisLine
    exec "normal " . l:synopsisLine . "|"
    startinsert!

endfunction

function! <SID>ValComment()
  
  call cursor(line('.'), col('$'))
  exec "normal! a\t\t  /**<        */"
  call cursor(line('.'), col('$')-9)
  
endfunction

function! <SID>ValComment1()
  
  call cursor(line('.'), col('$'))
  exec "normal! a\t\t  ///<  "
  call cursor(line('.'), col('$')-2)
  
endfunction


function! <SID>InsertPHPHead()

  call append(0, "<?php")
  call <SID>GetDoxFH(1)
  let idx = 5 
  while (idx > 0)
    call append(line('$') - 1, "")
    let idx = idx - 1
  endwhile

endfunction

function! <SID>InsertFormat()
  call <SID>GetDoxFH(1)
  let idx = 20
  while (idx > 0)
    call append(line('$') - 1, "")
    let idx = idx - 1
  endwhile

  call cursor(15, 11)
endfunction

function! <SID>InsertHeadFormat()
  let s = toupper(<SID>GetFileName())
  let s = substitute(s, "[\.]", "_", "g")
  call append(19, "#ifndef  __". s. "_")
  call append(20, "#define  __". s. "_")
  call append(line('$')-2, "#endif  //__". s. "_")
endfunction

autocmd BufNewFile *.h,*.cpp,*.c,*.cc,*.java,*.py,*.pl :call <SID>InsertFormat()
autocmd BufNewFile *.php :call <SID>InsertPHPHead()
autocmd BufNewFile *h :call <SID>InsertHeadFormat()
