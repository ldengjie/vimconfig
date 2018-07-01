"=== list of shortcuts ===

"b 向上翻页
"f 向下翻页
"K 上移一行 == k
"s 单字符跳转
"v 自动扩展选择连接着的区域

"-- [c]omment --
"cc 加注释
"cu 解开注释
"c<space> 加上/解开注释, 智能判断
"cy 先复制, 再注解(p可以进行黏贴)

"-- [c]lose --
"cq 关闭底部窗口，并从 nerdtree or tagbar 返回主窗口
"cw 关闭当前window
"ct 关闭当前tabpage
"co 关闭[airline上部buffer栏里]其他buffer
"cr 关闭[airline上部buffer栏里]右侧buffer
"cb 关闭[airline上部buffer栏里]当前buffer
"c[1-9] 关闭[airline上部buffer栏里]第1-9个buffer

"-- [d]elete --
"dp 删除指定字符之间的字符
"dl 删除指定行之间的行

"-- [t]abs in buffers window --
"tn [airline上部buffer栏里]下一个buffer
"tp [airline上部buffer栏里]下一个buffer
"t[1-9] [airline上部buffer栏里]跳转到第1-9个buffer

"-- [g]oto --
"ga 根据指定符号对其，V选中行 -> ga[1|2\*][,|-| ]
"gd 选中并返回原位置
"gf 跳转到变量的定义或声明处
"gy 进入/离开 goyo 模式
"gt 下一个tabpage
"gT 上一个tabpage
"gj 格式化json文件

"-- [w]indow --
"w <c-w>
"wc 关闭当前的窗口,不能关闭最后一个窗口, 
"wo 关闭当前窗口以外的所有窗口, [c*]依赖这个快捷键
"wz 最大化当前窗口

"-- [y]ank --
"yp 复制指定字符之间的字符
"yl 复制指定行之间的行

",a 搜索单词
",f 搜索文件
",l Move to line
",s Move to char == s
",n 打开nerdtree
",t 打开tagbar
",w 强制保存文件
",y 打开粘贴板

"<c-y> 翻译当前单词
"<c-g> 语义补齐
"<c-j> 自动扩展输入
"<c-n> 下拉菜单里下一个
"<c-p> 下拉菜单里上一个

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

"语法高亮
syntax on
"显示行号
set nu
"光亮光标行
set cursorline
"光标的上方或下方至少会保留显示的行数
set scrolloff=3
"高亮显示搜索结果
set hlsearch
hi Search term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
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
        set background=dark
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
"与windows共享剪贴板
"set clipboard+=unnamed
"在离开 Insert 模式时自动切换至英文输入法
set noimdisable 
"关闭vim声音错误提示，打开后会屏幕发白闪烁
"set vb t_vb=
"buffer未保存也可以切换
set hidden

"=== 自动命令=== 
"自动关闭时保存折叠，打开时读出折叠
au BufWinLeave *.* silent mkview
au BufWinEnter *.* silent loadview

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

"-- , --
let mapleader = "," 
"关闭底部窗口，并从 nerdtree or tagbar 返回主窗口
nmap <silent> cq :cclose<CR>:call Leave_nerdtree_tagbar()<CR>: call ReSizeWin()<CR>
"强制保存文件
nnoremap <silent> <leader>w :w!<CR>

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
    
"tab键补齐
"Plug 'ervandew/supertab'
    "let g:SuperTabRetainCompletionType = 2
    "" 0 - 不记录上次的补全方式
    "" 1 - 记住上次的补全方式,直到用其他的补全命令改变它
    "" 2 - 记住上次的补全方式,直到按ESC退出插入模式为止
    "let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
    
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
    "Automatically close nerdtree when NERDTree is the last buffer
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    nnoremap <silent> <Leader>n :call ToggleWin('nerdtree')<CR>

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
    noremap <silent> <leader>Agg :Agg<CR>
    noremap <silent> <leader>a :normal gd ,Agg<CR>

"文档class分析
Plug 'majutsushi/tagbar'
    "let g:tagbar_left = 1 "让tagbar在页面左侧显示，默认右边
    let g:tagbar_width = 30 "设置tagbar的宽度为30列，默认40.
    "取消快捷键默认功能, :help tagbar
    let tagbar_map_togglesort='\s'
    let tagbar_map_jump='o'
    let tagbar_map_togglefold='O'
    nnoremap <silent> <Leader>t :call ToggleWin('tagbar')<CR>

"在本级目录和逐步查询上级目录中找tags，在保存的时候自动更新tags
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
    "let g:easytags_auto_highlight = 0

"Plug 'xolox/vim-shell'
    "let g:shell_fullscreen_always_on_top = 0
    "let g:shell_fullscreen_items='mT'
    "let g:shell_fullscreen_message=0

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

    "语义补全 Semantic Completion: C-family, C#, Go, Java, JavaScript, Python, Rust, and TypeScript languages are supported natively by YouCompleteMe using the Clang, OmniSharp, Gocode/Godef, jdt.ls, Tern, Jedi, racer, and TSServer engines, respectively (2018.06.29). 
    "C 想全局使用,在~/.ycm_extra_conf.py加入你的库的header,例如-F/path/to/include,只想在当前目录临时使用的话就在当前目录另开一个.ycm_extra_conf.py就好了.如果有使用构建工具的话,github上有一个叫YCM-Generator的插件,可以根据构建工具自动生成.ycm_extra_conf.py文件.
    "for javascript的补全: 已集成tern(~/.tern-project),默认自动安装调用。(2017.05.30)
    "当tab补全时vim上面会分裂一个小窗口显示函数变量原型，我们按下esc或者结束补全时,自动关闭那个窗口
    "autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    "语义补全候选数目，默认50
    "let g:ycm_max_num_candidates = 50
    "触发语义补全
    let g:ycm_key_invoke_completion = "<c-g>"
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
    "nnoremap <silent> <leader>jl :YcmCompleter GoToDeclaration<CR>
    "nnoremap <silent> <leader>jf :YcmCompleter GoToDefinition<CR>

    "eclim
    "let g:EclimCompletionMethod = 'omnifunc'
    "关闭eclimd自带的语法错误检查
    "let g:EclimJavaValidate=0
    "let g:EclimScalaValidate=0
    "通过eclim实现定义跳转
    "autocmd FileType java nnoremap <silent> <leader>jsd :JavaSearch<CR>
    "autocmd FileType java nnoremap <silent> <leader>d :normal gd ,jsd zz<CR>
    "autocmd FileType java nnoremap <silent> <leader>i :JavaImport<CR>
    "autocmd FileType java nnoremap <silent> <leader>o :JavaImportOrganize<CR>
    "autocmd FileType scala nnoremap <silent> <leader>csd :ScalaSearch<CR>
    "autocmd FileType scala nnoremap <silent> <leader>d :normal gd ,csd zz<CR>
    "autocmd FileType scala nnoremap <silent> <leader>i :ScalaImport<CR>

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
    "nmap <silent> <c-k> <Plug>(ale_previous_wrap)
    "nmap <silent> <c-j> <Plug>(ale_next_wrap)
    ""另:syntastic是代码风格检查工具,可以为不同的编程语言(对应为Vim中的filetype)配置不同的checker.甚至每个文件类型可以有若干个checker，syntastic会负责聚合警告和错误。只在保存文件时检查，不是实时的。for javascript，手动安装eslint后，调用eslint
    
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
"状态栏美化
Plug 'vim-airline/vim-airline'
    set laststatus=2  "永远显示状态栏
    set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t' "buffer display only filename instead of path
    let g:airline#extensions#tabline#buffer_idx_mode = 1
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

    "nmap <silent> tp t l <Plug>AirlineSelectPrevTab
    "nmap <silent> tn t l <Plug>AirlineSelectNextTab
    nmap <silent> tp :bp<CR>
    nmap <silent> tn :bn<CR>
    for nr in range(1,9)
        execute 'nmap <silent> t'.nr.' t l <Plug>AirlineSelectTab'.nr
    endfor

    "跳转到指定选项卡
    fun! GotoTab(tnr)
        execute 'normal t'.a:tnr
    endfun
    "删除指定buffer c1
    fun! DeleteThatBuffer(nr)
        let l:curWinNr = winnr()
        if winbufnr(l:curWinNr) == 1
            return
        endif
        let l:buftotalnum=len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
        let g:tt=l:buftotalnum
        exe 'echo "'.l:buftotalnum.'"'
        if a:nr > l:buftotalnum
            return
        endif
        let l:curBufNr = bufnr("%")
        call GotoTab(a:nr)
        let l:thatBufNr = bufnr("%")
        if l:thatBufNr != l:curBufNr
            exe "b #"
        else
            exe "bn"
        endif
        exe "bdel ".l:thatBufNr
    endfun
    "删除所有其他buffer co
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
    "删除所有右边buffer cr
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
    "删除当前buffer cb
    fun! DeleteCurBuffer()
        let l:curWinNr = winnr()
        if winbufnr(l:curWinNr) == 1
            return
        endif
        let l:curBufNr = bufnr("%")
        exe "bn"
        exe "bdel ".l:curBufNr
    endfun
    "close buffer
    map <silent> co :call DeleteAllOtherBuffersInWindow()<CR>
    map <silent> cr :call DeleteAllRightBuffersInWindow()<CR>
    for nr in range(1,9)
        execute 'map <silent> c'.nr.' :call DeleteThatBuffer('.nr.')<CR>'
    endfor
    map <silent> cb :call DeleteCurBuffer()<CR>
    "close window
    map <silent> cw :close<CR>
    "close tab
    map <silent> ct :tabclose<CR>
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
Plug 'junegunn/goyo.vim'
    "line number, default 0
    "let g:goyo_linenr = 1

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

"=== 其他功能 === 
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
    "翻译输入的单词
    "noremap <silent> <leader>yd :<c-u>Yde<CR>

call plug#end()

"=== 自定义功能 === 
"-- 最大化当前buffer窗口 --
function! ToggleMaxWin()
    if exists("t:winMax")
        let l:winMax_tmp=t:winMax
        let l:curtab=tabpagenr()
        for tabno in range(1,tabpagenr('$'))
            execute 'normal! '.tabno.'gt'
            if exists("t:orig_tab") && t:orig_tab==l:winMax_tmp
                let l:winMax_orig_tabnr=tabpagenr()
            endif
            if exists("t:new_tab") && t:new_tab==l:winMax_tmp
                let l:winMax_new_tabnr=tabpagenr()
                let l:winMax_new_line=line('.')
                let l:winMax_new_col=col('.')
            endif
        endfor
        execute 'normal! '.l:curtab.'gt'

        if exists("l:winMax_orig_tabnr")
            if exists("l:winMax_new_tabnr")
                "是在新tab里操作时
                if l:winMax_orig_tabnr!=l:curtab
                    execute 'normal! '.l:winMax_orig_tabnr.'gt'
                    execute t:winMax_orig_winnr . 'wincmd w'
                    execute 'b'.t:winMax_orig_bufnr
                    execute printf('normal! %dG%d|', l:winMax_new_line, l:winMax_new_col)
                endif
                execute 'tabclose '.l:winMax_new_tabnr
            endif
        endif

        unlet t:winMax
        if exists('t:orig_tab') | unlet t:orig_tab | endif
        if exists('t:new_tab') | unlet t:new_tab | endif

        "是在原来tab里操作时,关闭前一个最大化窗口后,自动最大化当前buffer
        if l:winMax_orig_tabnr==l:curtab
            call MaxWin()
        endif
    else
        call MaxWin()
    endif
endfunction
function! MaxWin()
    "只有一个窗口时,不操作
    if winnr('$')>1
        let l:winMax_id=localtime()
        let l:winMax_orig_winnr_tmp=winnr()
        let l:winMax_orig_bufnr_tmp=winbufnr(0)

        let t:winMax=l:winMax_id
        let t:orig_tab=l:winMax_id
        let t:winMax_orig_winnr=l:winMax_orig_winnr_tmp
        let t:winMax_orig_bufnr=l:winMax_orig_bufnr_tmp
        tab split
        let t:winMax=l:winMax_id
        let t:new_tab=l:winMax_id
        let t:winMax_orig_winnr=l:winMax_orig_winnr_tmp
        let t:winMax_orig_bufnr=l:winMax_orig_bufnr_tmp
    endif
endfunction
map <c-w>z :call ToggleMaxWin()<CR>

"-- nerdtree tagbar goyo 共存 --
nmap <silent> gy :call GoyoToggle()<CR>
for direc in ['h','l','j','k']
    exe 'map <silent> w'.direc.' :call GoyoWG("'.direc.'")<CR>'
endfor
for oz in ['o','z']
    exe 'map <silent> w'.oz.' :call GoyoWOZ("'.oz.'")<CR>'
endfor

let g:gy_width = '60%'
let g:gy_height= '90%'
let g:gy_recover_nerdtree_tagbar= 1

augroup ntg
    autocmd!
    autocmd VimResized *  call ReSizeWin() 
augroup END

"windows goto to skip surrounding margin in goyo mode
autocmd ntg WinEnter * call SkipCount()
function! SkipCount()
    let g:skip_count=get(g:,'skip_count',0)+1
endfunction
function! GoyoWG(direction)
    if exists("#goyo") && !(tolower(bufname('%')) =~ '.*tagbar.*' && a:direction=='h')
        let l:lastCount=get(g:,'skip_count',0)
        let l:lastWinNr=winnr()
        execute 'normal '.a:direction
        let l:curCount=get(g:,'skip_count',0)
        "let l:curWinNr=winnr()
        if l:curCount-l:lastCount >= 2
            exe l:lastWinNr.' wincmd w'
            execute 'normal w2'.a:direction
        endif
    else
        execute 'normal '.a:direction
    endif
endfunction
function! GoyoWOZ(ozp)
    if exists("#goyo") 
        call CloseWin('nerdtree')
        call CloseWin('tagbar')
        if CommonWinNr()>5
            call GoyoToggle()
            call GoyoToggle()
        endif
    else
        execute 'normal '.a:ozp
    endif
endfunction

"enter/leave goyo mode using custom size
function! GoyoToggle()
    call Save_nerdtree_tagbar()
    call Save_bufferinfo()

    execute 'Goyo'

    call Setbg()
    call GuiSetting()
    call TmuxToggle()
    if get(g:, 'gy_recover_nerdtree_tagbar', 0) | call Recover_nerdtree_tagbar() |endif
    call Recover_bufferinfo()
    "禁用goyo自带的自动调整大小适应屏幕，因为有问题，极小以后再放大不能恢复宽度
    if exists("#goyo") 
        autocmd! goyo VimResized 
    endif
    "重新画图，覆盖默认大小，必须排在Recover_nerdtree_tagbar()之后
    call ReSizeWin()
endfunction

function! GuiSetting()
    if has('gui_running')
        if exists("#goyo")
            "set fullscreen
            "set linespace=7
        else
            "set nofullscreen
            "set linespace=0
        endif
    endif
endfunction

function! TmuxToggle()
    if exists('$TMUX')
        if exists("#goyo")
            call TmuxStatusOff()
        else
            call TmuxStatusOn()
        endif
    endif
endfunction
function! TmuxStatusOff()
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
endfunction
function! TmuxStatusOn()
    silent !tmux set status on 
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
endfunction

function! Save_bufferinfo()
    let g:curbufnr_goyo=winbufnr(0)
    let g:line_goyo=line('.')
    let g:col_goyo=col('.')
endfunction
function! Recover_bufferinfo()
    execute 'b'.g:curbufnr_goyo
    execute printf('normal! %dG%d|', g:line_goyo, g:col_goyo)
endfunction

function! Save_nerdtree_tagbar()
    call Leave_nerdtree_tagbar()
    if exists('t:NERDTreeBufName')
        let g:nerdtree_open_goyo = bufwinnr(t:NERDTreeBufName) != -1
    else
        let g:nerdtree_open_goyo = 0
    endif
    let g:tagbar_open_goyo = bufwinnr('__Tagbar__') != -1
endfunction
function! Leave_nerdtree_tagbar()
    if exists('t:NERDTreeBufName')
        let l:nerdtree_winnr_goyo=bufwinnr(t:NERDTreeBufName)
    else
        let l:nerdtree_winnr_goyo=-1
    endif
    let l:tagbar_winnr_goyo=bufwinnr('__Tagbar__')
    if l:nerdtree_winnr_goyo != -1 || l:tagbar_winnr_goyo != -1
        for winno in range(1,winnr('$'))
            if winno != l:nerdtree_winnr_goyo && winno != l:tagbar_winnr_goyo
                execute winno . 'wincmd w'
                break
            endif
        endfor
    endif
endfunction
function! Recover_nerdtree_tagbar()
    call CloseWin('nerdtree')
    call CloseWin('tagbar')
    if g:tagbar_open_goyo | call OpenWin('tagbar') | endif
    if g:nerdtree_open_goyo | call OpenWin('nerdtree') | endif
    call Leave_nerdtree_tagbar()
endfunction

function! GoyoWinSize()
    let goyo_5=[]

    let goyo_0_w=&columns
    let goyo_4_w=goyo_0_w
    let goyo_2_w=&columns * str2nr(get(g:,'gy_width','80%')[:-2]) / 100
    let goyo_1_w=(&columns - goyo_2_w -2)/2
    let goyo_3_w=&columns - goyo_2_w -2 - goyo_1_w

    let goyo_2_h=&lines * str2nr(get(g:,'gy_height','90%')[:-2]) / 100
    let goyo_1_h=goyo_2_h
    let goyo_3_h=goyo_2_h
    let goyo_0_h=(&lines - goyo_2_h -2)/2
    let goyo_4_h=&lines - goyo_2_h -2 - goyo_0_h

    call add(goyo_5,[goyo_0_h,goyo_0_w])
    call add(goyo_5,[goyo_1_h,goyo_1_w])
    call add(goyo_5,[goyo_2_h,goyo_2_w])
    call add(goyo_5,[goyo_3_h,goyo_3_w])
    call add(goyo_5,[goyo_4_h,goyo_4_w])

    let g:goyo_5=goyo_5
    return goyo_5
endfunction

function! CalWinSize()
    let l:goyo_5 = GoyoWinSize()
    let goyo_7=[]
    let screenHeight=2+l:goyo_5[0][0]+l:goyo_5[1][0]+l:goyo_5[4][0]
    let screenWidth=l:goyo_5[0][1]

    if exists('t:NERDTreeBufName')
        let nerdtree_open = bufwinnr(t:NERDTreeBufName) != -1
    else
        let nerdtree_open = 0
    endif
    let tagbar_open = bufwinnr('__Tagbar__') != -1

    let goyo_n_w=nerdtree_open ? g:NERDTreeWinSize : 0
    let goyo_t_w=tagbar_open ? g:tagbar_width : 0
    let nt_lin_w=(nerdtree_open ? 1 : 0)+(tagbar_open ? 1 : 0)
    let n_line_w=nerdtree_open ? 1 : 0
    let t_line_w=tagbar_open? 1 : 0

    let nt_max_w=max([goyo_n_w,goyo_t_w])
    let goyo_1_w=max([1,nerdtree_open ? l:goyo_5[1][1]-nt_max_w-n_line_w : l:goyo_5[1][1]])
    let goyo_3_w=max([1,tagbar_open ? l:goyo_5[3][1]-nt_max_w-t_line_w : l:goyo_5[3][1]])
    let goyo_0_w=screenWidth-goyo_n_w-goyo_t_w-nt_lin_w
    let goyo_4_w=goyo_0_w
    let goyo_2_w=screenWidth-goyo_n_w-goyo_t_w-goyo_1_w-goyo_3_w-2-nt_lin_w

    let goyo_n_w=nerdtree_open ? nt_max_w : 0
    let goyo_t_w=tagbar_open ? nt_max_w : 0

    if nerdtree_open | call add(goyo_7,[screenHeight,goyo_n_w]) | endif
    call add(goyo_7,[l:goyo_5[0][0],goyo_0_w])
    call add(goyo_7,[l:goyo_5[1][0],goyo_1_w])
    call add(goyo_7,[l:goyo_5[2][0],goyo_2_w])
    call add(goyo_7,[l:goyo_5[3][0],goyo_3_w])
    call add(goyo_7,[l:goyo_5[4][0],goyo_4_w])
    if tagbar_open | call add(goyo_7,[screenHeight,goyo_t_w]) | endif
    let g:goyo_7=goyo_7
    return goyo_7
endfunction
function! ReSizeWin()
    if exists("#goyo")
        let l:layout=CalWinSize()
        "BUG:需要执行两遍,否则1)从goyo_6_t(只打开tagbar)返回goyo_5时，窗口并没有正确改变大小
        for winno in range(1,len(l:layout))
            execute 'vertical '.winno.' resize ' . l:layout[winno-1][1]
            execute winno.' resize ' . l:layout[winno-1][0]
        endfor
        for winno in range(1,len(l:layout))
            execute 'vertical '.winno.' resize ' . l:layout[winno-1][1]
            execute winno.' resize ' . l:layout[winno-1][0]
        endfor
    endif
endfunction

function! ToggleWin(winName)
    if a:winName == "nerdtree"
        NERDTreeToggle
    elseif a:winName == "tagbar"
        TagbarToggle
    endif
    call ReSizeWin() 
endfunction
function! OpenWin(winName)
    if a:winName == "nerdtree"
        NERDTree
    elseif a:winName == "tagbar"
        TagbarOpen
    endif
    call ReSizeWin() 
endfunction
function! CloseWin(winName)
    if a:winName == "nerdtree"
        NERDTreeClose
    elseif a:winName == "tagbar"
        TagbarClose
    endif
    call ReSizeWin() 
endfunction

""=== init ===
function! InitGoyo()
    let l:initTab=tabpagenr()
    call GoyoToggle()
    exe 'tabclose '.l:initTab
    let l:hasFile=len(bufname("%"))
    call OpenWin('nerdtree')
    if l:hasFile
        exe 'normal l'
    endif
endfunction
function! AutoCloseNerdtree()
endfunction

autocmd ntg VimEnter * call InitGoyo()

autocmd ntg WinEnter * call We()
autocmd ntg QuitPre * call Qp()
autocmd ntg TabEnter * call Te()

function! Te()
    if (!exists('#goyo')) && exists('g:qfromgoyo')
        if exists('g:quit_forced')
            qa!
        else
            qa
        endif
    endif
endfunction

function! We()
    if exists('#goyo') && CommonWinNr()==5 && &modifiable
        cabbrev <buffer> q! let g:quit_forced = 1 <bar> q!
    endif
endfunction

cabbrev  qall let g:quit_all= 1 <bar> qall
cabbrev  qa let g:quit_all= 1 <bar> qall
function! Qp()
    if exists('#goyo') && CommonWinNr()==5 && &modifiable
        let g:qfromgoyo=1
        try
            for eachbuf in filter(range(1, bufnr('$')), 'buflisted(v:val)')
                exe 'b '.eachbuf
                if &mod
                    throw 'goyo E37: No write since last change ("'.bufname('%').'")'
                endif
            endfor
        catch /./
            if !exists('g:quit_forced')
                if exists(g:quit_all) | unlet g:quit_all | endif
                throw v:exception
            endif
        endtry
        if exists('$TMUX') | call TmuxStatusOn() | endif
    endif
    if exists('g:quit_all')
        if exists('$TMUX') | call TmuxStatusOn() | endif
    endif
endfunction

function! CommonWinNr()
    if exists('t:NERDTreeBufName')
        let l:nerdtree_open_goyo = bufwinnr(t:NERDTreeBufName) != -1
    else
        let l:nerdtree_open_goyo = 0
    endif
    let l:tagbar_open_goyo = bufwinnr('__Tagbar__') != -1
    return winnr('$')-l:nerdtree_open_goyo - l:tagbar_open_goyo
endfunction
