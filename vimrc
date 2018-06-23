if has("gui_running")
"au GUIEnter * simalt ~x " 窗口启动时自动最大化
set lines=50 columns=100 "启动时窗口大小
set guioptions-=m " 隐藏菜单栏
set guioptions-=T " 隐藏工具栏
set guioptions-=L " 隐藏左侧滚动条
set guioptions-=r " 隐藏右侧滚动条
set guioptions-=b " 隐藏底部滚动条
set showtabline=0 " 隐藏Tab栏
endif

let mapleader = "," 
set nu
set guifont=courier_new:h14
set backupdir=~/.vim/backup

set ts=4 
set softtabstop=4 
set shiftwidth=4 
"set expandtab

"
nmap f <C-f>
nmap b <C-b>
nmap K k
nmap w <C-w>
"wc，关闭当前的窗口,不能关闭最后一个窗口
"wo，关闭当前窗口以外的所有窗口
nnoremap <Leader>w :w!<CR>
"切换buffer
nmap gb :bn<CR>
nmap gB :bp<CR>

nmap gd :normal! mt gd `t<CR>
nmap <Leader>q :cclose<CR>
nmap gf :%!python -m json.tool<CR>

"在离开 Insert 模式时自动切换至英文输入法
set noimdisable 
"自动关闭时保存折叠，打开时读出折叠
au BufWinLeave *.* silent mkview
au BufWinEnter *.* silent loadview
"光亮光标行
set cursorline
"ambiwidth 默认值为 single。在其值为 single 时，若 encoding 为 utf-8，gvim 显示全角符号时就会出问题，会当作半角显示
set ambiwidth=double
"设置使用 C/C++ 语言的自动缩进方式
set cindent 
"语法高亮
syntax on
"与windows共享剪贴板
"set clipboard+=unnamed
"光标的上方或下方至少会保留显示的行数
set scrolloff=3
"关闭vim声音错误提示，打开后会屏幕发白闪烁
"set vb t_vb=
"编辑区显示乱码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin-1
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
"高亮显示搜索结果
set hlsearch
hi Search term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow


set nocompatible
filetype plugin indent on

"vim-plug settings
call plug#begin('~/.vim/plugged')
" original repos on github 
"

"状态栏美化
Plug 'vim-airline/vim-airline'
	set laststatus=2  "永远显示状态栏
	set t_Co=256	  "在windows中用xshell连接打开vim可以显示色彩
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#fnamemod = ':t' "buffer display only filename instead of path
	let g:airline#extensions#tabline#buffer_idx_mode = 1
	nmap <Leader>1 wt wl <Plug>AirlineSelectTab1
	nmap <leader>2 wt wl <Plug>AirlineSelectTab2
	nmap <leader>3 wt wl <Plug>AirlineSelectTab3
	nmap <leader>4 wt wl <Plug>AirlineSelectTab4
	nmap <leader>5 wt wl <Plug>AirlineSelectTab5
	nmap <leader>6 wt wl <Plug>AirlineSelectTab6
	nmap <leader>7 wt wl <Plug>AirlineSelectTab7
	nmap <leader>8 wt wl <Plug>AirlineSelectTab8
	nmap <leader>9 wt wl <Plug>AirlineSelectTab9
	nmap <leader>p wt wl <Plug>AirlineSelectPrevTab
	nmap <leader>n wt wl <Plug>AirlineSelectNextTab
	let g:airline#extensions#tabline#buffer_nr_show = 0
	let g:airline#extensions#tabline#buffer_idx_format = {
		\ '0': '0 ',
		\ '1': '1 ',
		\ '2': '2 ',
		\ '3': '3 ',
		\ '4': '4 ',
		\ '5': '5 ',
		\ '6': '6 ',
		\ '7': '7 ',
		\ '8': '8 ',
		\ '9': '9 '
		\}
	let g:airline#extensions#tabline#show_tabs = 0
"删除所有其他buffer  <leader>co
	fun! DeleteAllOtherBuffersInWindow()
	let s:curWinNr = winnr()
	if winbufnr(s:curWinNr) == 1
		ret
	endif
	let s:curBufNr = bufnr("%")
	exe "bn"
	let s:lastBufNr = bufnr("%")
	while s:lastBufNr != s:curBufNr
		exe "bn"
		exe "bdel ".s:lastBufNr
		let s:lastBufNr = bufnr("%")
	endwhile
	endfun
"删除所有右边buffer  <leader>cr
	fun! DeleteAllRightBuffersInWindow()
	let s:curWinNr = winnr()
	if winbufnr(s:curWinNr) == 1
		ret
	endif
	let s:curBufNr = bufnr("%")
	exe "bn"
	let s:lastBufNr = bufnr("%")
	while s:lastBufNr > s:curBufNr
		exe "bn"
		exe "bdel ".s:lastBufNr
		let s:lastBufNr = bufnr("%")
	endwhile
	exe "b ".s:curBufNr
	endfun
"删除指定buffer  <leader>c1
	fun! DeleteThatBuffer(nr)
		let s:curBufNr = bufnr("%")
		exe "normal ,".a:nr
		let s:thatBufNr = bufnr("%")
		if s:thatBufNr != a:nr
			exe "b #"
		else
			exe "bn"
		endif
		exe "bdel ".s:thatBufNr
	endfun
"删除当前buffer  <leader>cq
	fun! DeleteCurBuffer()
		let s:curBufNr = bufnr("%")
		exe "bn"
		exe "bdel ".s:curBufNr
	endfun
	map <leader>co :call DeleteAllOtherBuffersInWindow()<CR>
	map <leader>cr :call DeleteAllRightBuffersInWindow()<CR>
	map <leader>cq :call DeleteCurBuffer()<CR>
	map <leader>c1 :call DeleteThatBuffer(1)<CR>
	map <leader>c2 :call DeleteThatBuffer(2)<CR>
	map <leader>c3 :call DeleteThatBuffer(3)<CR>
	map <leader>c4 :call DeleteThatBuffer(4)<CR>
	map <leader>c5 :call DeleteThatBuffer(5)<CR>
	map <leader>c6 :call DeleteThatBuffer(6)<CR>
	map <leader>c7 :call DeleteThatBuffer(7)<CR>
	map <leader>c8 :call DeleteThatBuffer(8)<CR>
	map <leader>c9 :call DeleteThatBuffer(9)<CR>

Plug 'vim-airline/vim-airline-themes'
	let g:airline_theme="papercolor" 

"光标跳转
Plug 'Lokaltog/vim-easymotion'
	"Disable default mappings
	let g:EasyMotion_do_mapping = 0
	"Turn on case sensitive feature
	let g:EasyMotion_smartcase = 1
	" Smartsign
	let g:EasyMotion_use_smartsign_us = 1
	" <Leader>f{char} to move to {char}
	map  s <Plug>(easymotion-bd-f)
	nmap s <Plug>(easymotion-overwin-f)
	" Move to line
	map <Leader>l <Plug>(easymotion-bd-jk)
	nmap <Leader>l <Plug>(easymotion-overwin-line)
Plug 'haya14busa/vim-easyoperator-line'
	let g:EasyOperator_line_do_mapping = 0
	nmap dl <Plug>(easyoperator-line-delete)
	nmap yl <Plug>(easyoperator-line-yank)
Plug 'haya14busa/vim-easyoperator-phrase'
	let g:EasyOperator_phrase_do_mapping = 0
	nmap dp <Plug>(easyoperator-phrase-delete)
	nmap yp <Plug>(easyoperator-phrase-yank)

"A simple ftplugin for `.prototxt` files
Plug 'chiphogg/vim-prototxt'

"多光标操作
Plug 'terryma/vim-multiple-cursors'
	set selection=inclusive "CTRL+n doesn't seem to work in gVIM

"括号补齐
Plug 'Raimondi/delimitMate'
	 "syntax awareness (will not insert the closing delimiter in comments and other configurable regions)，输入时想把光标移动到｝后继续输入时，C-o进入normal模式，再a。   
	 
"引号成对操作
Plug 'tpope/vim-surround'
	" cs"' [inside]
	" "Hello world!" -> 'Hello world!'
	" ds"
	" "Hello world!" -> Hello world!
	" ysiw"
	" Hello -> "Hello"

"重复上一个操作
Plug 'tpope/vim-repeat'

"批量添加注释
Plug 'scrooloose/nerdcommenter'
	" shift+v+方向键选中(默认当前行)
	" <leader>cc   加注释
	" <leader>cu   解开注释
	" <leader>c<space>  加上/解开注释, 智能判断
	" <leader>cy   先复制, 再注解(p可以进行黏贴)

"搜索文件,最近打开,缓冲区域
Plug 'ctrlpvim/ctrlp.vim'
	let g:ctrlp_cmd = 'CtrlP'
	map <leader>f :CtrlPMRU<CR>
	let g:ctrlp_custom_ignore = {
		\ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
		\ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
		\ }
	let g:ctrlp_working_path_mode='ra'
	let g:ctrlp_match_window_bottom=1
	let g:ctrlp_max_height=15
	let g:ctrlp_match_window_reversed=0
	let g:ctrlp_mruf_max=500
	let g:ctrlp_follow_symlinks=1
	let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']
	" Press <c-d> to switch to filename only search instead of full path.
	" Press <c-r> to switch to regexp mode.
	" Press <c-f> and <c-b> to cycle between modes.
	" Use <c-j>, <c-k> or the arrow keys to navigate the result list.
	" Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
	" Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
	" Use <c-y> to create a new file and its parent directories.
	" Use <c-z> to mark/unmark multiple files and <c-o> to open them.
	" Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.

"文件树
Plug 'scrooloose/nerdtree'
	let NERDTreeAutoDeleteBuffer=1
	"取消快捷键s默认功能
	let NERDTreeMapOpenVSplit='\s'
	" o.......在已有窗口中打开文件、目录或书签，并跳到该窗口   .....|NERDTree-o|  
	" Go......在已有窗口 中打开文件、目录或书签，但不跳到该窗口 .....|NERDTree-go| 
	" t....... 在新Tab中打开选中文件/书签，并跳到新Tab		  .....|NERDTree-t|  
	" T.......在新Tab中打开选中文件/书签，但不跳到新Tab		.....|NERDTree-T|  
	" i.......split 一个新窗口打开选中文件，并跳到该窗口		.....|NERDTree-i|  
	" gi......split一个新窗口打开选中文件，但不跳到该窗口	  .....|NERDTree-gi| 
	" s.......vsp一个新窗口打开选中文件，并跳到该窗口		  .....|NERDTree-s|  
	" gs......vsp一个新 窗口打开选中文件，但不跳到该窗口		.....|NERDTree-gs| 
	" !.......执行当前文件									 .....|NERDTree-!|  
	" O.......递归打开选中 结点下的所有目录					 .....|NERDTree-O|  
	" x.......合拢选中结点的父目录							 .....|NERDTree-x|  
	" X.......递归 合拢选中结点下的所有目录					 .....|NERDTree-X|  
	" e.......Edit the current dif							 .....|NERDTree-e|  
	" 双击......相当于NERDTree-o
	" 中键......对文件相当于NERDTree-i，对目录相当于NERDTree-e
	" D....... 删除当前书签
	" P.......跳到根结点
	" p....... 跳到父结点
	" K.......跳到当前目录下同级的第一个结点
	" J.......跳到当前目录下同级的最后一个结点
	" ...跳到当前目录下同级的前一个结点
	" ...跳到当前目录下同级的后一个结点
	" C.......将选中目录或选中文件的父目录设为根结点
	" u.......将当前根结点的父目录设为根目录，并变成合拢原根结点
	" U.......将当前根结点的父目录设为根目录，但保持展开原根结点
	" r.......递归刷新选中目录
	" R.......递归刷新根结点
	" m....... 显示文件系统菜单
	" cd......将CWD设为选中目录
	" I....... 切换是否显示隐藏文件
	" f.......切换是否使用文件过滤器
	" F.......切换是否显示文件
	" B.......切换是否显示书签
	" q.......关闭NerdTree窗口
	" ?.......切换是否显示Quick Help

"nerdtree里显示git信息
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"	: "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"	 : "✗",
	\ "Clean"	 : "✔︎",
	\ "Unknown"   : "?"
	\ }
	
"文档class分析
Plug 'majutsushi/tagbar'
    "let g:tagbar_left = 1 "让tagbar在页面左侧显示，默认右边
    let g:tagbar_width = 30 "设置tagbar的宽度为30列，默认40.

"nerdTree tagBar窗口排列
	" +-----------+-------------+
	" | nerd tree | edited file |
	" | contents  |			 |
	" +-----------+			 |
	" | tagbar	|			 |
	" | contents  |			 |
	" +-----------+-------------+
	function! ToggleNERDTreeAndTagbar() 
	let w:jumpbacktohere = 1
	" Detect which plugins are open
	if exists('t:NERDTreeBufName')
		let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
	else
		let nerdtree_open = 0
	endif
	let tagbar_open = bufwinnr('__Tagbar__') != -1
	" Perform the appropriate action
	if nerdtree_open && tagbar_open
		NERDTreeClose
		TagbarClose
	else
		NERDTreeClose
		TagbarClose
		NERDTree
		TagbarOpen
	endif
	wincmd K
	wincmd j
	wincmd L
	wincmd t
	exe 'vertical resize 30'
	" Jump back to the original window
	for window in range(1, winnr('$'))
		execute window . 'wincmd w'
		if exists('w:jumpbacktohere')
			unlet w:jumpbacktohere
			break
		endif
	endfor  
	endfunction
	"nnoremap <Leader>tn :call ToggleNERDTreeAndTagbar()<CR>
	nnoremap <Leader>n :NERDTreeToggle<CR>
	nnoremap <Leader>t :TagbarToggle<CR>

"在本级目录和逐步查询上级目录中找tags，在保存的时候自动更新tags
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
	"let g:easytags_auto_highlight = 0

"Plug 'xolox/vim-shell'
	"let g:shell_fullscreen_always_on_top = 0
	"let g:shell_fullscreen_items='mT'
	"let g:shell_fullscreen_message=0
	
"=号两侧对齐
Plug 'junegunn/vim-easy-align'
    vmap <Leader>= <Plug>(EasyAlign)
    nmap <Leader>= <Plug>(EasyAlign)

"扩展选中区域   
Plug 'terryma/vim-expand-region'
	vmap v <Plug>(expand_region_expand)
	vmap V <Plug>(expand_region_shrink)

"Ag的源代码,不用下载,macos直接brew install ag安装即可
"Plug 'ggreer/the_silver_searcher'
"代码搜索工具，类似于grep,ack,但更快
Plug 'rking/ag.vim'
	" e	open file and close the quickfix window.
	" o	open file (same as enter).
	" go   preview file (open but maintain focus on ag.vim results).
	" t	open in a new tab.
	" T	open in new tab silently.
	" h	open in horizontal split.
	" H	open in horizontal split silently.
	" v	open in vertical split.
	" gv   open in vertical split silently.
	" q	close the quickfix window.
	" If [!] is not given the first error is jumped to.
	command! Agg exe 'Ag! -Q -s -w ' . expand('<cword>') . ' --ignore-dir node_modules --ignore-dir dist'
	noremap <leader>Agg :Agg<CR>
	noremap <leader>a :normal gd ,Agg<CR>

"自动跳转到项目根目录
Plug 'airblade/vim-rooter'
	let g:rooter_patterns = ['pom.xml','.git/','.project']
	let g:rooter_silent_chdir = 1
	let g:rooter_change_directory_for_non_project_files = 'current'

"有道词典
Plug 'ianva/vim-youdao-translater'
	vnoremap <silent> <C-Y> :<C-u>Ydv<CR>
	nnoremap <silent> <C-Y> :<C-u>Ydc<CR>
	noremap <leader>yd :<C-u>Yde<CR>

"tab键补齐
"Plug 'ervandew/supertab'
	"let g:SuperTabRetainCompletionType = 2
	"" 0 - 不记录上次的补全方式
	"" 1 - 记住上次的补全方式,直到用其他的补全命令改变它
	"" 2 - 记住上次的补全方式,直到按ESC退出插入模式为止
	"let g:SuperTabDefaultCompletionType = "<C-X><C-U>"

"自动补全,自带且只有c family的语法检查.for javascript的补全: 已集成tern(~/.tern-project),默认自动安装调用。(2017.05.30)
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --java-completer' }
	let g:EclimCompletionMethod = 'omnifunc'
	"关闭eclimd自带的语法错误检查
	let g:EclimJavaValidate=0
	"let g:EclimScalaValidate=0
	" 从第一个键入字符就开始列出匹配项  
	let g:ycm_min_num_of_chars_for_completion=1 
	"语义补全: C 想全局使用,在~/.ycm_extra_conf.py加入你的库的header,例如-F/path/to/include,只想在当前目录临时使用的话就在当前目录另开一个.ycm_extra_conf.py就好了.如果有使用构建工具的话,github上有一个叫YCM-Generator的插件,可以根据构建工具自动生成.ycm_extra_conf.py文件.

	" 触发语义补全
	let g:ycm_key_invoke_completion = "<c-g>"
	" 语义补全候选数目，默认50
	"let g:ycm_max_num_candidates = 50
	" 触发语义补全,scala时比较慢1-2s
	"let g:ycm_semantic_triggers =  {
  "\   'c' : ['->', '.'],
  "\   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  "\             're!\[.*\]\s'],
  "\   'ocaml' : ['.', '#'],
  "\   'cpp,objcpp' : ['->', '.', '::'],
  "\   'perl' : ['->'],
  "\   'php' : ['->', '::'],
  "\   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.','re!\w{2}'],
  "\   'ruby' : ['.', '::'],
  "\   'lua' : ['.', ':'],
  "\   'erlang' : [':'],
  "\ }
	"" 补全功能在注释中同样有效  
	let g:ycm_complete_in_comments=1
    let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
    "let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
    let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
    "let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开
	"代码跳转: C 前提是设置好.ycm_extra_conf.py
	nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
	"nnoremap <leader>jl :YcmCompleter GoToDeclaration<CR>
	"nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
	"当tab补全时vim上面会分裂一个小窗口显示函数变量原型，我们按下esc或者结束补全时,自动关闭那个窗口
	autocmd InsertLeave	* if pumvisible() == 0|pclose|endif
    "通过eclim实现定义跳转
    autocmd FileType java nnoremap <leader>jsd :JavaSearch<CR>
    autocmd FileType java nnoremap <leader>d :normal gd ,jsd zz<CR>
    autocmd FileType java nnoremap <leader>i :JavaImport<CR>
    autocmd FileType java nnoremap <leader>o :JavaImportOrganize<CR>
    autocmd FileType scala nnoremap <leader>csd :ScalaSearch<CR>
    autocmd FileType scala nnoremap <leader>d :normal gd ,csd zz<CR>
    autocmd FileType scala nnoremap <leader>i :ScalaImport<CR>

""代码异步检测:拼写错误,语法错误。实时检测，并发运行。for javascript,手动安装eslint后,自动调用eslint(~/.eslint.json)
"Plug 'w0rp/ale'
	""0)不能使用tagbar 1)javac.vim中修改pom.xml为pxm.xml,因为项目太大，mvn dependency:build-classpath分"析出的classpath太多，导致javac编译很慢，10-20S. 2)mvn shade 插件打包后的jar引入到classpath里，如下:
	""2018.05.15 semantic analysis has been done for the javac linter to look for dependencies with maven and gradle.
	"let g:ale_java_javac_classpath='/Users/lidj/Documents/大数据项目/项目测试/乌鲁木齐高新区深度学习超算/项目研发/XJGASugonBigData/backend/target/xjga.jar'
	""let g:ale_java_javac_classpath='/Users/lidj/Documents/大数据项目/项目测试/乌鲁木齐高新区深度学习超算/项目研发/XJGASugonBigData/algorithm/xjcs-assembly-2.0.jar'
	""2018.05.15 the scalac linter only checks syntax, it doesn't do any semantic analysis. https://github.com/w0rp/ale/issues/815
	"let g:ale_linters = {'scala': ['scalastyle']}
	""let g:airline#extensions#ale#enabled = 1
	""let g:airline#extensions#ale#error_symbol='✗'
	""let g:airline#extensions#ale#warning_symbol='⚠'
	"let g:ale_lint_delay=50
	"let g:ale_sign_error='✗'
	"let g:ale_sign_warning='⚠'
	"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
	"nmap <silent> <C-j> <Plug>(ale_next_wrap)
    ""另:syntastic是代码风格检查工具,可以为不同的编程语言(对应为Vim中的filetype)配置不同的checker.甚至每个文件类型可以有若干个checker，syntastic会负责聚合警告和错误。只在保存文件时检查，不是实时的。for javascript，手动安装eslint后，调用eslint
	
"scala 缩进
Plug 'derekwyatt/vim-scala'
    "To enable the indentation standard as recommended for Scaladoc comments (from http://docs.scala-lang.org/style/scaladoc.html, since Scaladoc2)
    let g:scala_scaladoc_indent = 1
	"Sorting of import statements
	":SortScalaImports

"括号彩色
Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1
    let g:rainbow_conf = {
    \	'ctermfgs': ['brown','Darkblue','darkcyan','darkgreen','darkred','darkmagenta','brown','darkmagenta','Darkblue','darkcyan','darkgreen','darkred','red'],
    \	'guifgs': ['RoyalBlue3','SeaGreen3','DarkOrchid3','firebrick3','RoyalBlue3','SeaGreen3','DarkOrchid3','firebrick3','RoyalBlue3','SeaGreen3','DarkOrchid3','firebrick3','RoyalBlue3','SeaGreen3','DarkOrchid3','firebrick3'],
    \	'operators': '_,\|+\|:\|->\|*\|===\|-\|!==_',
    \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \	'separately': {
    \		'*': {},
    \		'tex': {
    \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \		},
    \		'lisp': {
    \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \		},
    \		'vim': {
    \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \		},
    \		'html': {
    \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \		},
    \		'css': 0,
    \	}
    \}

"添加扩展模块代码
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
    let g:UltiSnipsExpandTrigger="<c-j>"
	let g:UltiSnipsJumpForwardTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger="<c-k>"
	"输入并展开 if<c-j> ;
	"或者在 visual 模式下选中已有代码，按下 <c-j>
	"然后按老样子输入并展开 if<c-j> 

"调试
Plug 'idanarye/vim-vebugger'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
	"let g:vebugger_leader = "d"

" vim-scripts repos 

" non github repos 

call plug#end()

"Plug 'altercation/vim-colors-solarized'
	set background=dark
"   colorscheme solarized
"

"最大化当前buffer窗口
"if exists("g:vimlayoutloaded")
"	finish
"else
"	let g:vimlayoutloaded=1
"endif
function! HeightToSize(height)
	let currwinno=winnr()
	if winheight(currwinno)>a:height
		while winheight(currwinno)>a:height
			execute "normal \<c-w>-"
		endwhile
	elseif winheight(currwinno)<a:height
		while winheight(currwinno)<a:height
			execute "normal \<c-w>+"
		endwhile
	endif
endfunction
function! WidthToSize(width)
	let currwinno=winnr()
	if winwidth(currwinno)>a:width
		while winwidth(currwinno)>a:width
			execute "normal \<c-w><"
		endwhile

	elseif winwidth(currwinno)<a:width
		while winwidth(currwinno)<a:width
			execute "normal \<c-w>>"
		endwhile
	endif
endfunction
function! TweakWinSize(orgisize)
	call HeightToSize(a:orgisize[0])
	call WidthToSize(a:orgisize[1])
endfunction
function! RestoreWinLayout()
	if exists("g:layout")
		for win in g:layout
			execute "normal \<c-w>w"
			let currwinno=winnr()
			call TweakWinSize(g:layout[currwinno-1])
		endfor
		unlet g:layout
	endif
endfunction
function! SaveWinLayout()
	let wnumber=winnr("$")
	let winlist=range(wnumber)
	let layout=[]
	for index in winlist
		let wininfo=[winheight(index+1),winwidth(index+1)]
		call add(layout,wininfo)
	endfor
	let g:layout=layout
endfunction
function! ToggleMaxWin()
	if exists("g:layout")
		if winnr("$")==len(g:layout)
			call RestoreWinLayout()
		else
			call SaveWinLayout()
			execute "normal 200\<c-w>>"
			execute "normal \<c-w>_"
			"call RestoreWinLayout()
		endif
	else
		call SaveWinLayout()
		execute "normal 200\<c-w>>"
		execute "normal \<c-w>_"
	endif
endfunction
map <leader>z :call ToggleMaxWin()<CR>
