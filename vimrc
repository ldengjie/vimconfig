"=== list of shortcuts ===

"b 向上翻页
"f 向下翻页
"K 上移一行 == k
"v 自动扩展选择连接着的区域  
"s 单字符跳转  
"/ 多字符跳转  

"-- [c]omment --
"cc 加注释
"cu 解开注释
"c<space> 加上/解开注释, 智能判断
"cy 先复制, 再注解(p可以进行黏贴)

"-- [c]lose --
"co 关闭其他buffer
"cr 关闭右侧buffer
"cb 关闭当前buffer
"[count]cb 关闭指定buffer

"-- [d]elete --
"dp 删除指定字符之间的字符
"dl 删除指定行之间的行

"-- [t]abs in buffers window --
"[count]t 跳转到指定buffer
"t 跳转到前一个buffer
"gT 上一个buffer
"gt 下一个buffer

"-- [g]oto --
"ga 根据指定符号对其，V选中行 -> ga[1|2\*][,|-| ]
"gd 选中并返回原位置
"gf 跳转到变量的定义或声明处
"gj 格式化json文件

"-- [w]indow --
"w <c-w>
"wc 关闭当前的窗口,不能关闭最后一个窗口, 
"wo 关闭当前窗口以外的所有窗口
"wz 最大化当前窗口

"-- [y]ank --
"yp 复制指定字符之间的字符
"yl 复制指定行之间的行

",a 搜索单词
",q 关闭底部窗口，并从 nerdtree or tagbar 返回主窗口
",f 搜索文件
",l Move to line
",s Move to char == s
",m 打开minibufexplorer
",n 打开nerdtree
",t 打开tagbar
",w 强制保存文件
",y 打开粘贴板
",c YCM-Generator为c-family项目生成配置文件
",h 在header添加作者信息

"<c-y> 翻译当前单词
"<c-g> 语义补齐
"<c-j> 自动扩展输入
"<c-n> 下拉菜单里下一个
"<c-p> 下拉菜单里上一个
"<c-l> 显示当前行数/总行数

"==== SCRIPT ====

"关闭vi兼容模式
set nocompatible

"=== 界面设置 === 
if has("gui_running")
    "au GUIEnter * simalt ~x " 窗口启动时自动最大化
    set lines=50 columns=100 "启动时窗口大小
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    set showtabline=0 " 隐藏Tab栏
    set guifont=courier_new:h14
    colorscheme solarized
endif

"set fillchars=stl:\ ,stlnc:\

"语法高亮
syntax on
"显示行号,由vim-absorb进行控制
"set nu
"光亮光标行
set cursorline
"光标的上方或下方至少会保留显示的行数
set scrolloff=3
"高亮显示搜索结果
set hlsearch
hi Search term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩
"缩进4字符，tab变为空格
set ts=4 
set softtabstop=4 
set shiftwidth=4 
set expandtab
"设置使用 C/C++ 语言的自动缩进方式
set cindent 
"底部显示preview window
set splitright

function! Setbg()
    if has("gui_running")
        set background=light
    else
        "set background=dark
        set background=light
    endif
endfunction

call Setbg()


"=== 编码=== 
"ambiwidth 默认值为 single。在其值为 single 时，若 encoding 为 utf-8，gvim 显示全角符号时就会出问题，会当作半角显示
set ambiwidth=double
"编辑区显示乱码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin-1
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif

"=== 功能控制=== 
"与系统共享剪贴板
set clipboard+=unnamed
"在离开 Insert 模式时自动切换至英文输入法
set noimdisable 
"关闭vim声音错误提示，打开后会屏幕发白闪烁
set vb t_vb=
"buffer未保存也可以切换
set hidden

"=== 自动命令=== 
"自动关闭时保存折叠，打开时读出折叠
au BufWinLeave *.* silent mkview
au BufWinEnter *.* silent loadview
"自动保存
"let autosave=1

"=== 快捷键=== 
nmap <silent> f <c-f>
nmap <silent> b <c-b>
nmap <silent> K k
"wc 关闭当前的窗口,不能关闭最后一个窗口, wo 关闭当前窗口以外的所有窗口, [,c*]依赖这个快捷键
map <silent> w <c-w>

"-- [g]oto --
"选中并返回原位置
nmap <silent> gd :normal! md gd `d<CR>
"格式化json文件
nmap <silent> gj :%!python -m json.tool<CR>
"[count] t: 跳转到指定buffer, [count]空时:前一个
nmap <expr>  t ':<c-u>b '.(v:count==0 ? "#" : v:count).'<cr>'

"-- [c]lose --
"[count] cb: 删除指定buffer, [count]空时:删除当前buffer 
nmap <expr>  cb ':<c-u>bd '.(v:count==0 ? "" : v:count).'<cr>'

"-- <c-*> --
"显示当前行数/总行数
map  <c-l> :echo line('.').' / '.line('$')<CR>

"-- , --
let mapleader = "," 
"强制保存文件
nnoremap <silent> <leader>w :w!<CR>
"关闭底部窗口，并从 nerdtree or tagbar 返回主窗口
nmap <silent> <leader>q :cclose<CR>

"=== vim-plug === 
filetype plugin indent on
"vim-plug settings
call plug#begin('~/.vim/plugged')

"=== 操作 === 
"-- 跳转 --
"光标跳转
Plug 'Lokaltog/vim-easymotion'
    "Disable default mappings
    let g:EasyMotion_do_mapping = 0
    "Turn on case sensitive feature
    let g:EasyMotion_smartcase = 1
    " Smartsign
    let g:EasyMotion_use_smartsign_us = 1
    " <Leader>f{char} to move to {char}
    map <silent> s <Plug>(easymotion-bd-f)
    nmap <silent> s <Plug>(easymotion-overwin-f)
    nmap <silent> / <Plug>(easymotion-sn)
    " Move to line
    map <silent> <leader>l <Plug>(easymotion-bd-jk)
    nmap <silent> <leader>l <Plug>(easymotion-overwin-line)
Plug 'haya14busa/vim-easyoperator-line'
    let g:EasyOperator_line_do_mapping = 0
    nmap <silent> dl <Plug>(easyoperator-line-delete)
    nmap <silent> yl <Plug>(easyoperator-line-yank)
Plug 'haya14busa/vim-easyoperator-phrase'
    let g:EasyOperator_phrase_do_mapping = 0
    nmap <silent> dp <Plug>(easyoperator-phrase-delete)
    nmap <silent> yp <Plug>(easyoperator-phrase-yank)

"-- 选中 --
"扩展选中区域   
Plug 'terryma/vim-expand-region'
    vmap <silent> v <Plug>(expand_region_expand)
    vmap <silent> V <Plug>(expand_region_shrink)

"-- 批量 -- 
"重复上一个操作
Plug 'tpope/vim-repeat'

"符号两侧对齐: 
Plug 'junegunn/vim-easy-align'
    "V选中行 -> ga[1|2\*][,|=| ]
    vmap <silent> ga <Plug>(EasyAlign)
    nmap <silent> ga <Plug>(EasyAlign)

"多光标操作
Plug 'terryma/vim-multiple-cursors'
    set selection=inclusive "CTRL+n doesn't seem to work in gVIM

"批量添加注释
Plug 'scrooloose/nerdcommenter'
    " shift+v+方向键选中(默认当前行)
    "加注释
    map <silent> cc <Plug>NERDCommenterComment
    "解开注释
    map <silent> cu <Plug>NERDCommenterUncomment
    "加上/解开注释, 智能判断
    map <silent> c<space> <Plug>NERDCommenterToggle
    "先复制, 再注解(p可以进行黏贴)
    map <silent> cy <Plug>NERDCommenterYank
    " 取消掉默认的 <leader>cb
    map <silent> <leader>\cb <Plug>NERDCommenterAlignBoth

"引号成对操作
Plug 'tpope/vim-surround'
    " cs"' [inside]
    " "Hello world!" -> 'Hello world!'
    " ds"
    " "Hello world!" -> Hello world!
    " ysiw"
    " Hello -> "Hello"

"-- 补齐 -- 
"括号补齐
Plug 'Raimondi/delimitMate'
    "syntax awareness (will not insert the closing delimiter in comments and other configurable regions)，输入时想把光标移动到｝后继续输入时，C-o进入normal模式，再a。   
    
"添加模块代码扩展
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
    let g:UltiSnipsExpandTrigger="<c-j>"
    "输入并展开 if<c-j> 
    "tab/<c-n>/<c-p>在列表中上下切换
    "或者在 visual 模式下选中已有代码，按下 <c-j>
    "然后按老样子输入并展开 if<c-j> 

"=== 文件 === 
"搜索文件,最近打开,缓冲区域
Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_cmd = 'CtrlP'
    map <silent> <leader>f :CtrlPMRU<CR>
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
    "default ones (.git, .hg, .svn, .bzr, and _darcs)
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

"自动跳转到项目根目录
Plug 'airblade/vim-rooter'
    let g:rooter_patterns = ['pom.xml','.git/','.project']
    let g:rooter_silent_chdir = 1
    let g:rooter_change_directory_for_non_project_files = 'current'

"文件树
Plug 'scrooloose/nerdtree'
    "删除文件时自动删除文件对应buffer
    let NERDTreeAutoDeleteBuffer=1
    "取消快捷键默认功能, :help NERDTree-s
    let NERDTreeMapOpenVSplit='\s'
    let NERDTreeMapOpenInTab='\t'
    let NERDTreeMapOpenInTabSilent='\T'
    let NERDTreeMapToggleFilters='\f'
    let g:NERDTreeWinSize=30
    nmap<silent> <Leader>n :NERDTreeToggle<CR>

"nerdtree里显示git信息
Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
    
"=== 代码分析 === 
"代码搜索工具，类似于grep,ack,但更快
"Ag的源代码如下行,不用下载,macos直接brew install ag安装即可
"Plug 'ggreer/the_silver_searcher'
Plug 'rking/ag.vim'
    " e    open file and close the quickfix window.
    " o    open file (same as enter).
    " go   preview file (open but maintain focus on ag.vim results).
    " t    open in a new tab.
    " T    open in new tab silently.
    " h    open in horizontal split.
    " H    open in horizontal split silently.
    " v    open in vertical split.
    " gv   open in vertical split silently.
    " q    close the quickfix window.
    " If [!] is not given the first error is jumped to.
    command! Agg exe 'Ag! -Q -s -w ' . expand('<cword>') . ' --ignore-dir node_modules --ignore-dir dist'
    noremap <silent> <leader>a :normal! gd <CR> :Agg<CR>

"文档class分析
Plug 'majutsushi/tagbar'
    "let g:tagbar_left = 1 "让tagbar在页面左侧显示，默认右边
    let g:tagbar_width = 30 "设置tagbar的宽度为30列，默认40.
    "取消快捷键默认功能, :help tagbar
    let tagbar_map_togglesort='\s'
    let tagbar_map_jump='o'
    let tagbar_map_togglefold='O'
    nmap<silent>  <Leader>t :TagbarToggle<CR>

"在本级目录和逐步查询上级目录中找tags，在保存的时候自动更新tags
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
    "let g:easytags_auto_highlight = 0

"Plug 'xolox/vim-shell'
    "let g:shell_fullscreen_always_on_top = 0
    "let g:shell_fullscreen_items='mT'
    "let g:shell_fullscreen_message=0

"生成 ycm c-family 语义补全时需要的 .ycm_extra_conf.py 文件, C 想全局使用,在~/.ycm_extra_conf.py加入自定义库的header,例如-F/path/to/include,只想在当前目录临时使用的话就在当前目录另开一个.ycm_extra_conf.py就好了.
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
    nmap  <Leader>c :YcmGenerateConfig<CR>
"自动补全
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --java-completer' }
    " 从第一个键入字符就开始列出匹配项  
    let g:ycm_min_num_of_chars_for_completion=1 
    "补全功能在注释中同样有效  
    let g:ycm_complete_in_comments=1
    "在字符串输入中也能补全
    let g:ycm_complete_in_strings = 1
    "提示UltiSnips
    "let g:ycm_use_ultisnips_completer = 1
    "注释和字符串中的文字也会被收入补全
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    "let g:ycm_collect_identifiers_from_tags_files = 1
    "语言关键字补全, 不过python关键字都很短，所以，需要的自己打开
    let g:ycm_seed_identifiers_with_syntax=1   
    let g:ycm_autoclose_preview_window_after_completion=1

    "语义补全 Semantic Completion: C-family, C#, Go, Java, JavaScript, Python, Rust, and TypeScript languages are supported natively by YouCompleteMe using the Clang, OmniSharp, Gocode/Godef, jdt.ls, Tern, Jedi, racer, and TSServer engines, respectively (2018.06.29). 
    "for javascript的补全: 已集成tern(~/.tern-project),默认自动安装调用。(2017.05.30)
    "触发语义补全
    let g:ycm_key_invoke_completion = "<c-g>"
    "语义补全候选数目，默认50
    "let g:ycm_max_num_candidates = 50
    "取消提醒确认
    let g:ycm_confirm_extra_conf = 0
    "自动触发语义补全,scala时比较慢1-2s
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

    "代码跳转: C 前提是设置好.ycm_extra_conf.py
    nnoremap <silent> gf :YcmCompleter GoToDefinitionElseDeclaration<CR>
    let g:ycm_goto_buffer_command = 'vertical-split'
    "nnoremap <silent> <leader>jl :YcmCompleter GoToDeclaration<CR>
    "nnoremap <silent> <leader>jf :YcmCompleter GoToDefinition<CR>
    
"调试
"GDB LLDB JDB Mdbg PDB RDebug. Vebugger is developed under Linux. It doesn't work properly under Windows due to lack of PTY support. I have neither plans nor means to support OSX. (2018.06.29)
Plug 'idanarye/vim-vebugger'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    "let g:vebugger_leader = "d"
    "di      |:VBGstepIn|
    "do      |:VBGstepOver|
    "dO      |:VBGstepOut|
    "dc      |:VBGcontinue|
    "db      |:VBGtoggleBreakpointThisLine|
    "dB      |:VBGclearBreakpoints|
    "de      |:VBGevalWordUnderCursor| in normal mode. |:VBGevalSelectedText| in select mode
    "dE      Prompt for an argument for |:VBGeval|
    "dx      |:VBGexecute| current line in normal mode. |:VBGexecuteSelectedText| in select mode
    "dX      Prompt for an argument for |:VBGexecute|
    "dt      |:VBGtoggleTerminalBuffer|
    "dr      Select mode only - |:VBGrawWriteSelectedText|
    "dR      Prompt for an argument for |:VBGrawWrite|
    
"=== 显示 === 
"buffer explorer
Plug 'fholgado/minibufexpl.vim'
    "不固定在屏幕边缘
	let g:miniBufExplSplitToEdge = 0
    "在上方
	let g:miniBufExplBRSplit = 0
    "行数
	let g:miniBufExplMaxSize = 2
    "自动启动的buffer数量
    let g:miniBufExplBuffersNeeded = 2
    nmap <silent> <leader>m :MBEToggle<CR>
    "下一个buffer
    nmap gt :MBEbn<cr>
    "上一个buffer
    nmap gT :MBEbp<cr>

Plug 'vim-airline/vim-airline-themes'
	let g:airline_theme="papercolor" 

"括号彩色
Plug 'luochen1990/rainbow'
    let g:rainbow_active = 1
    let g:rainbow_conf = {
    \    'ctermfgs': ['brown','Darkblue','darkcyan','darkgreen','darkred','darkmagenta','brown','darkmagenta','Darkblue','darkcyan','darkgreen','darkred','red'],
    \    'guifgs': ['RoyalBlue3','SeaGreen3','DarkOrchid3','firebrick3','RoyalBlue3','SeaGreen3','DarkOrchid3','firebrick3','RoyalBlue3','SeaGreen3','DarkOrchid3','firebrick3','RoyalBlue3','SeaGreen3','DarkOrchid3','firebrick3'],
    \    'operators': '_,\|+\|:\|->\|*\|=== \|-\|!==_',
    \    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \    'separately': {
    \        '*': {},
    \        'tex': {
    \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \        },
    \        'lisp': {
    \            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \        },
    \        'vim': {
    \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \        },
    \        'html': {
    \            'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \        },
    \        'css': 0,
    \    }
    \}

"关灯看小说
Plug 'ldengjie/vim-absorb'
"Plug '~/Documents/workspace/vim-absorb'
    let g:absorb_width      = '70%'
    let g:absorb_height     = '90%'
    let g:absorb_showlinenr = 1
    "默认不启用
    let g:absorb_open       = 1

"主题配色
Plug 'altercation/vim-colors-solarized'

"=== 特定文件类型 === 
"-- caffe --
"A simple ftplugin for `.prototxt` files
Plug 'chiphogg/vim-prototxt', { 'for': 'prototxt' }

"-- scala --
"scala 缩进
Plug 'derekwyatt/vim-scala'
    "To enable the indentation standard as recommended for Scaladoc comments (from http://docs.scala-lang.org/style/scaladoc.html, since Scaladoc2)
    let g:scala_scaladoc_indent = 1
    "Sorting of import statements
    ":SortScalaImports
    
"== python ==
"对齐代码的虚线，写Python尤其需要
Plug 'Yggdroot/indentLine'
    "let g:indentLine_char = '|'
"Yggdroot/indentLine会隐藏json里的",禁止json里隐藏引号，但md里还是隐藏#
Plug 'elzr/vim-json'
    let g:vim_json_syntax_conceal = 0
"show help documentation
nnoremap <buffer> gh :<C-u>execute "!pydoc " . expand("<cword>")<CR>

"=== 其他功能 === 
"作者信息
Plug 'alpertuna/vim-header'
    let g:header_field_author = 'LiDengjie'
    let g:header_field_author_email = 'ldengjie@163.com'
    let g:header_auto_add_header = 0
    nmap <leader>h :AddHeader<CR>

"全部剪切板
Plug 'vim-scripts/YankRing.vim'
    "将yankring的历史文件夹移到~/.vim
    let g:yankring_history_dir = '~/.vim/'
    nmap <silent> <leader>y :YRShow<CR>

"有道词典
Plug 'ianva/vim-youdao-translater'
    "翻译当前单词
    vnoremap <silent> <c-y> :<c-u>Ydv<CR>
    nnoremap <silent> <c-y> :<c-u>Ydc<CR>
    ""翻译输入的单词
    ""noremap <silent> <leader>yd :<c-u>Yde<CR>

call plug#end()

"=== user function ===

"删除所有其他buffer co
map <silent> co :call DeleteAllOtherBuffersInWindow()<CR>
"删除所有右边buffer cr
map <silent> cr :call DeleteAllRightBuffersInWindow()<CR>
    fun! DeleteAllOtherBuffersInWindow()
        let l:curWinNr = winnr()
        if winbufnr(l:curWinNr) == 1
            return
        endif
        let l:curBufNr = bufnr("%")
        exe "bn"
        let l:lastBufNr = bufnr("%")
        while l:lastBufNr != l:curBufNr
            exe "bn"
            exe "bdel ".l:lastBufNr
            let l:lastBufNr = bufnr("%")
        endwhile
    endfun
    fun! DeleteAllRightBuffersInWindow()
        let l:curWinNr = winnr()
        if winbufnr(l:curWinNr) == 1
            return
        endif
        let l:curBufNr = bufnr("%")
        exe "bn"
        let l:lastBufNr = bufnr("%")
        while l:lastBufNr > l:curBufNr
            exe "bn"
            exe "bdel ".l:lastBufNr
            let l:lastBufNr = bufnr("%")
        endwhile
        exe "b ".l:curBufNr
    endfun

"=== init ===
