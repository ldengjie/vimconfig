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
    set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩
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
    nmap <leader>b wt wl <Plug>AirlineSelectNextTab
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
    map <leader>cb :call DeleteCurBuffer()<CR>
    map <leader>co :call DeleteAllOtherBuffersInWindow()<CR>
    map <leader>cr :call DeleteAllRightBuffersInWindow()<CR>
    map <leader>c1 :call DeleteThatBuffer(1)<CR>
    map <leader>c2 :call DeleteThatBuffer(2)<CR>
    map <leader>c3 :call DeleteThatBuffer(3)<CR>
    map <leader>c4 :call DeleteThatBuffer(4)<CR>
    map <leader>c5 :call DeleteThatBuffer(5)<CR>
    map <leader>c6 :call DeleteThatBuffer(6)<CR>
    map <leader>c7 :call DeleteThatBuffer(7)<CR>
    map <leader>c8 :call DeleteThatBuffer(8)<CR>
    map <leader>c9 :call DeleteThatBuffer(9)<CR>
    "close window
    map <leader>cw :close<CR>

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
Plug 'chiphogg/vim-prototxt', { 'for': 'prototxt' }

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
    "取消快捷键默认功能, :help NERDTree-s
    let NERDTreeMapOpenVSplit='\s'
    let NERDTreeMapToggleFilters='\f'
    let g:NERDTreeWinSize=30
    nnoremap <Leader>n :call OpenWin('nerdtree')<CR>

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
    
"文档class分析
Plug 'majutsushi/tagbar'
    "let g:tagbar_left = 1 "让tagbar在页面左侧显示，默认右边
    let g:tagbar_width = 30 "设置tagbar的宽度为30列，默认40.
    "取消快捷键默认功能, :help tagbar
    let tagbar_map_togglesort='\s'
    let tagbar_map_jump='o'
    let tagbar_map_togglefold='O'
    nnoremap <Leader>t :call OpenWin('tagbar')<CR>

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
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
    "let g:EclimCompletionMethod = 'omnifunc'
    "关闭eclimd自带的语法错误检查
    "let g:EclimJavaValidate=0
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
    autocmd InsertLeave    * if pumvisible() == 0|pclose|endif
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
    \    'ctermfgs': ['brown','Darkblue','darkcyan','darkgreen','darkred','darkmagenta','brown','darkmagenta','Darkblue','darkcyan','darkgreen','darkred','red'],
    \    'guifgs': ['RoyalBlue3','SeaGreen3','DarkOrchid3','firebrick3','RoyalBlue3','SeaGreen3','DarkOrchid3','firebrick3','RoyalBlue3','SeaGreen3','DarkOrchid3','firebrick3','RoyalBlue3','SeaGreen3','DarkOrchid3','firebrick3'],
    \    'operators': '_,\|+\|:\|->\|*\|===\|-\|!==_',
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

"关灯看小说
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
    nmap <Leader>g :Goyo<CR>
    let g:goyo_width = 100
    "line number, default 0
    "let g:goyo_linenr = 0
    "进入goyo模式后自动触发limelight,退出后则关闭
    function! s:goyo_enter()
        if has('gui_running')
            set fullscreen
            set background=light
            set linespace=7
        elseif exists('$TMUX')
            silent !tmux set status off
            silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
        endif
        let g:goyo_running=1
        let g:goyo_5 = SaveWinLayout()
        Limelight
        let b:quitting = 0
        let b:quitting_bang = 0
        autocmd QuitPre <buffer> let b:quitting = 1
        cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
    endfunction
    function! s:goyo_leave()
        if has('gui_running')
            set nofullscreen
            set background=dark
            set linespace=0
        elseif exists('$TMUX')
            silent !tmux set status on
            silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
        endif
        let g:goyo_running=0
        unlet g:goyo_5
        Limelight!
        set background=dark
        " Quit Vim if this is the only remaining buffer
        if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
            if b:quitting_bang
                qa!
            else
                qa
            endif
        endif
    endfunction
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()

" 对齐代码的虚线，写Python尤其需要
Plug 'Yggdroot/indentLine'
    "let g:indentLine_char = '|'
"Yggdroot/indentLine会隐藏json里的",禁止json里隐藏引号，但md里还是隐藏#
Plug 'elzr/vim-json'
    let g:vim_json_syntax_conceal = 0

" vim-scripts repos 
Plug 'vim-scripts/YankRing.vim'
    "将yankring的历史文件夹移到~/.vim
    let g:yankring_history_dir = '~/.vim/'
    nmap <Leader>y :YRShow<CR>

" non github repos 

call plug#end()

"Plug 'altercation/vim-colors-solarized'
    set background=dark
"   colorscheme solarized


"最大化当前buffer窗口
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
    else
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
    endif
endfunction
map <leader>z :call ToggleMaxWin()<CR>

"nerdtree tagbar goyo 共存
function! RestoreWinLayout(layout)
    "execute printf('echo "r %s"',"=>")
    for winno in range(1,len(a:layout))
        execute winno . 'wincmd w'
        "execute printf('echo "r ==>%s"',winno)
        call TweakWinSize(a:layout[winno-1])
    endfor
endfunction
function! SaveWinLayout()
    let wnumber=winnr("$")
    let winlist=range(wnumber)
    let layout=[]
    for index in winlist
        let wininfo=[winheight(index+1),winwidth(index+1)]
        call add(layout,wininfo)
    endfor
    return layout
endfunction

function! CalWinSize()
    let goyo_7=[]
    let screenHeight=2+g:goyo_5[0][0]+g:goyo_5[1][0]+g:goyo_5[4][0]
    let screenWidth=g:goyo_5[0][1]

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
    let goyo_1_w=max([1,nerdtree_open ? g:goyo_5[1][1]-nt_max_w-n_line_w : g:goyo_5[1][1]])
    let goyo_3_w=max([1,tagbar_open ? g:goyo_5[3][1]-nt_max_w-t_line_w : g:goyo_5[3][1]])
    let goyo_0_w=screenWidth-goyo_n_w-goyo_t_w-nt_lin_w
    let goyo_4_w=goyo_0_w
    let goyo_2_w=screenWidth-goyo_n_w-goyo_t_w-goyo_1_w-goyo_3_w-2-nt_lin_w

    let goyo_n_w=nerdtree_open ? nt_max_w : 0
    let goyo_t_w=tagbar_open ? nt_max_w : 0

    if nerdtree_open | call add(goyo_7,[screenHeight,goyo_n_w]) | endif
    call add(goyo_7,[g:goyo_5[0][0],goyo_0_w])
    call add(goyo_7,[g:goyo_5[1][0],goyo_1_w])
    call add(goyo_7,[g:goyo_5[2][0],goyo_2_w])
    call add(goyo_7,[g:goyo_5[3][0],goyo_3_w])
    call add(goyo_7,[g:goyo_5[4][0],goyo_4_w])
    if tagbar_open | call add(goyo_7,[screenHeight,goyo_t_w]) | endif
    return goyo_7
endfunction
function! OpenWin(winName)
    if a:winName == "nerdtree"
        NERDTreeToggle
    elseif a:winName == "tagbar"
        TagbarToggle
    endif
    if exists("g:goyo_running") && g:goyo_running==1
        call ReSizeWin(CalWinSize())
    endif
endfunction
function! ReSizeWin(layout)
    "execute printf('echo "r %s"',"=>")
    for winno in range(1,len(a:layout))
        execute winno . 'wincmd w'
        "execute printf('echo "r ==>%s %s"',winno,winnr())
        if winno == winnr()
            execute 'resize ' . a:layout[winno-1][0]
            execute 'vertical resize ' . a:layout[winno-1][1]
        endif 
    endfor
endfunction
