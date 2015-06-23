"光亮光标行
set cursorline
"set cursorcolumn
set nu
set encoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8
set ambiwidth=double
set fileformat=unix
let mapleader = "," 
"自动关闭时保存折叠，打开时读出折叠
au BufWinLeave *.* silent mkview
au BufWinEnter *.* silent loadview

nmap f <C-f>
nmap b <C-b>
nmap K k

set expandtab
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
""set autoindent 
set cindent 
""设置状态栏
"set laststatus=2
"set statusline=%f%=%l,%v\ %p%%\ LEN=%L
"语法高亮
syntax on

" 与windows共享剪贴板
set clipboard+=unnamed
"检测file类型，默认On;自动加载该类型相关的插件;自动选择合适的缩进方式
filetype plugin indent on
"用backspace键删除
set backspace=indent,eol,start
"输入时，显示匹配的括号
set showmatch
set matchtime=0
"光标的上方或下方至少会保留显示的行数
set scrolloff=3
"关闭vim声音错误提示
set vb t_vb=


"pathogen
"execute pathogen#infect()
call pathogen#infect()

"Powerline{
set laststatus=2
set guifont=PowerlineSymbols\ for\ Powerline
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible 
set t_Co=256 
"let g:Powerline_symbols = 'fancy'
 let g:Powerline_symbols='unicode'
set fillchars+=stl:\ ,stlnc:\
"} 

"vim-easymotion{
"Disable default mappings
let g:EasyMotion_do_mapping = 0

"Search for characters: '
map  / <Plug>(easymotion-sn)
" Bi-directional find motion
nmap s <Plug>(easymotion-s)
"omap f <Plug>(easymotion-s)

"Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
" Smartsign
let g:EasyMotion_use_smartsign_us = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyOperator_line_do_mapping = 0
nmap dl <Plug>(easyoperator-line-delete)
nmap yl <Plug>(easyoperator-line-yank)

let g:EasyOperator_phrase_do_mapping = 0
nmap dp <Plug>(easyoperator-phrase-delete)
nmap yp <Plug>(easyoperator-phrase-yank)
"}

"tagbar{
"设置快捷键  
"nmap <F4> :TagbarToggle<CR>   
nmap <leader>4 :TagbarToggle<CR>   
"设置宽度，默认为40  
let g:tagbar_width =28 
"打开vim时自动打开  
"autocmd VimEnter * nested :call tagbar#autoopen(1)
"在左侧"  
let g:tagbar_left = 1         
let g:tagbar_right = 1
"自动打开
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.C call tagbar#autoopen()
"}

"doxygen toolkit{ 
"let g:DoxygenToolkit_briefTag_pre="@Synopsis "
"let g:DoxygenToolkit_paramTag_pre="@Param "
"let g:DoxygenToolkit_returnTag="@Returns "
let g:DoxygenToolkit_authorName="ldengjie,lidengjie@ihep.ac.cn"
""let s:licenseTag = "Copyright(C)\<enter>"
""let s:licenseTag = s:licenseTag . "For free\<enter>"
""let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
""let g:DoxygenToolkit_licenseTag = s:licenseTag
"let g:DoxygenToolkit_briefTag_funcName="yes"
""let g:doxygen_enhanced_color=1
"}

"indentLine{ 
" Vim
"let g:indentLine_color_term = 239
 "GVim
"let g:indentLine_color_gui = '#A4E57E'
" none X terminal
"let g:indentLine_color_tty_light = 7 " (default: 4)
"let g:indentLine_color_dark = 1 " (default: 2)
"¦, ┆, ︙ or │
"let g:indentLine_char = '│'
let g:indentLine_char = '︙'
"let g:indentLine_char = '|'
"let g:indentLine_char = '¦'
"let g:indentLine_enabled = 0
nmap <leader>i :IndentLinesToggle<CR>
"}

"let g:indent_guides_start_level=2
"let g:indent_guides_guide_size=1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=white 
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey 
"nmap <leader>w :w<CR>
nmap <leader>e :e<CR>
nmap <leader>t :tabe<Space>
nmap <leader>m :MarksBrowser<CR>
"map <Leader>d <plug>NERDTreeTabsToggle<CR>
"map <F3> :NERDTreeTabsToggle<CR>
nmap <leader>3 :NERDTreeTabsToggle<CR>
nnoremap <leader>p :cp<CR> 
nnoremap <leader>n :cn<CR>
nnoremap <leader>c :cw 7<CR>
"set switchbuf+=usetab,newtab "Vim quickfix list launch files in new tab
nnoremap <leader>q :cclose<CR>
nnoremap <leader>a :AT<CR>

"\if d.type=~?'e' <Bar><Bar> d.type=~?'w'  <Bar><Bar> d.text =~?'error' <Bar><Bar>d.text =~?'warning' <Bar>
"make,make with makeprg
"nnoremap <leader>m :call Do_OneFileMake()<CR>:make!<CR><CR><CR>:ccl<CR>
"map <F5> :call Do_OneFileMake()<CR>:make!<CR><CR><CR>:ccl<CR>:cw 7<CR><CR>
nmap <leader>5 :call Do_OneFileMake()<CR>:make!<CR><CR><CR>:ccl<CR>:cw 7<CR><CR>
function Do_OneFileMake()
    if expand("%:p:h")!=getcwd()
        echohl WarningMsg | echo "Fail to make! This file is not in the current dir! " | echohl None
        return
    endif
    let sourcefileename=expand("%:t")
    echohl WarningMsg | echo "filename : "sourcefileename | echohl None
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'','g')
    echohl WarningMsg | echo "outfilename : "outfilename | echohl None
    echohl WarningMsg | echo "filetype : "&filetype | echohl None
    "return
    if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
        echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
        return
    endif
    let deletedspacefilename=substitute(sourcefileename,' ','','g')
    if strlen(deletedspacefilename)!=strlen(sourcefileename)
        echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
        return
    endif
    if &filetype=="c"
        set makeprg=gcc\ -o\ %<\ %
    elseif &filetype=="cpp"
        set makeprg=g++\ -o\ %<\ %
    endif
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'','g')
    let toexename=outfilename
    if filereadable(outfilename)
        let outdeletedsuccess=delete("./".outfilename)
        if(outdeletedsuccess!=0)
            set makeprg=make
            echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
            return
        endif
    endif
    "execute "silent make" "using silent,texts will disappear,should ctrl+l
    "execute "normal :"
    "if filereadable(outfilename)
        "execute "!./".toexename
    "endif
endfunction
"进行make的设置,make with Makefile
nmap <leader>6 :call Do_make()<CR>:make!<CR><CR><CR>:ccl<CR>:cw 7<CR><CR>
function Do_make()
    set makeprg=make
endfunction
" with makeprg
"map <F8> :call Do_OneFileMake_RooFit()<CR>:make!<CR><CR><CR>:ccl<CR>:cw 7<CR><CR>
nmap <leader>8 :call Do_OneFileMake_RooFit()<CR>:make!<CR><CR><CR>:ccl<CR>:cw 7<CR><CR>
function Do_OneFileMake_RooFit()
    if expand("%:p:h")!=getcwd()
        echohl WarningMsg | echo "Fail to make! This file is not in the current dir! " | echohl None
        return
    endif
    let sourcefileename=expand("%:t")
    echohl WarningMsg | echo "filename : "sourcefileename | echohl None
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'','g')
    echohl WarningMsg | echo "outfilename : "outfilename | echohl None
    echohl WarningMsg | echo "filetype : "&filetype | echohl None
    "return
    if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
        echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
        return
    endif
    let deletedspacefilename=substitute(sourcefileename,' ','','g')
    if strlen(deletedspacefilename)!=strlen(sourcefileename)
        echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
        return
    endif
    if &filetype=="c"
        set makeprg=gcc\ -o\ %<\ %
    elseif &filetype=="cpp"
        set makeprg=g++\ -lm\ -lRooFit\ -O\ -Wall\ -fpic\ -g\ `root-config\ --cflags`\ `root-config\ --libs`\ -o\ %<\ %
    endif
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'','g')
    let toexename=outfilename
    if filereadable(outfilename)
        let outdeletedsuccess=delete("./".outfilename)
        if(outdeletedsuccess!=0)
            set makeprg=make
            echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
            return
        endif
    endif
    "execute "silent make" "using silent,texts will disappear,should ctrl+l
    "execute "normal :"
    "if filereadable(outfilename)
        "execute "!./".toexename
    "endif
endfunction
"map <F7> :call Do_OneFileMake_Root()<CR>:make!<CR><CR><CR>:ccl<CR>:cw 7<CR><CR>
nmap <leader>7 :call Do_OneFileMake_Root()<CR>:make!<CR><CR><CR>:ccl<CR>:cw 7<CR><CR>
function Do_OneFileMake_Root()
    if expand("%:p:h")!=getcwd()
        echohl WarningMsg | echo "Fail to make! This file is not in the current dir! " | echohl None
        return
    endif
    let sourcefileename=expand("%:t")
    echohl WarningMsg | echo "filename : "sourcefileename | echohl None
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'','g')
    echohl WarningMsg | echo "outfilename : "outfilename | echohl None
    echohl WarningMsg | echo "filetype : "&filetype | echohl None
    "return
    if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
        echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
        return
    endif
    let deletedspacefilename=substitute(sourcefileename,' ','','g')
    if strlen(deletedspacefilename)!=strlen(sourcefileename)
        echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
        return
    endif
    if &filetype=="c"
        set makeprg=gcc\ -o\ %<\ %
    elseif &filetype=="cpp"
        set makeprg=g++\ -lm\ -O\ -Wall\ -fpic\ -g\ `root-config\ --cflags`\ `root-config\ --libs`\ -o\ %<\ %
    endif
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)' ,'','g')
    let toexename=outfilename
    if filereadable(outfilename)
        let outdeletedsuccess=delete("./".outfilename)
        if(outdeletedsuccess!=0)
            set makeprg=make
            echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
            return
        endif
    endif
    "execute "silent make" "using silent,texts will disappear,should ctrl+l
    "execute "normal :"
    "if filereadable(outfilename)
        "execute "!./".toexename
    "endif
endfunction

"修改注释颜色
hi Comment ctermfg=6
"高亮显示搜索结果
set hlsearch
hi Search term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
"visual mode color
hi Visual cterm=bold ctermfg=236 ctermbg=252 gui=bold guifg=#303030 guibg=#d0d0d0

autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>ls :!open -a "Google Chrome" "%:p"<CR><CR>

"latex-suite
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.  
filetype plugin on  

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex  
" can be called correctly.  
set shellslash  

" IMPORTANT: grep will sometimes skip displaying the file name if you  
" search in a singe file. This will confuse Latex-Suite. Set your grep  
" program to always generate a file-name.  
set grepprg=grep\ -nH\ $*  

" OPTIONAL: This enables automatic indentation as you type.  
filetype indent on  

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to   'plaintex' instead of 'tex', which results in vim-latex not being loaded.   The following changes the default filetype back to 'tex':  
let g:tex_flavor='latex'
"spell checker
set spell

"save and load session in MacVim
let g:session_autoload = 'no'
if has("gui_running")
    set spell
    let g:session_autosave = 'yes'
    "let g:session_autoload = 'yes'
endif
