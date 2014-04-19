set number
set encoding=utf-8
set fileencodings=gbk,utf-8
set termencoding=utf-8
set ambiwidth=double
<<<<<<< HEAD
let mapleader = "," 
"自动关闭时保存折叠，打开时读出折叠
au BufWinLeave *.* silent mkview
au BufWinEnter *.* silent loadview

set tags+=~/.vim/mytags
=======

"cscope , preparing works for shortcut key <F5>, because '!pwd' can't show right path in vim.
if has("cscope")
    set cscopetag
    set csto=0
    let i = 1
    let $CS_PWD=getcwd()
    "10 levels is enough for me on ihep server
    while i < 10 
        if filereadable("cscope.out")
	    "avoid error : 'duplicate cscope database not added'
	        if i==1
		        silent cs kill 0
	        endif
            let db = getcwd() . "/cscope.out"
            let $CSCOPE_DB = db
            silent cs add $CSCOPE_DB 
            let i = 10
	    let $CS_OUT_DIR=getcwd()	
        else
            cd ..
            let i += 1
        endif
    endwhile
    cd $CS_PWD 
    set cscopeverbose  
endif
"设置cscope快捷键
let mapleader = "," 
map <silent> <leader>s :scs find s <C-R>=expand("<cword>")<CR><CR>
map <silent> <leader>g :scs find g <C-R>=expand("<cword>")<CR><CR>
map <silent> <leader>c :scs find c <C-R>=expand("<cword>")<CR><CR>
map <silent> <leader>t :scs find t <C-R>=expand("<cword>")<CR><CR>
map <silent> <leader>e :scs find e <C-R>=expand("<cword>")<CR><CR>
map <silent> <leader>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
map <silent> <leader>i :scs find i <C-R>=expand("<cfile>")<CR><CR>
map <silent> <leader>d :scs find d <C-R>=expand("<cword>")<CR><CR> 
"和autoclose.vim，a重复
map <silent> <leader>a :cs kill 0 <CR>:cs add cscope.out<CR>
"if .out exits,kill 0,avoid error : 'duplicate cscope database not added';if not,forbid automaticlly generating .out for avoid error: 'no permission to write (if you are in other's dir)'
nmap <silent> <F5> :cs kill 0 <CR>
	\:!find $CS_OUT_DIR -iname '*.c' -o -iname '*.cc' -o -iname '*.h'> $CS_OUT_DIR/cscope.files<CR>
	\:!cscope -bkq -i $CS_OUT_DIR/cscope.files -f $CS_OUT_DIR/cscope.out<CR>
	\:cs add $CS_OUT_DIR/cscope.out<CR>
"自动关闭时保存折叠，打开时读出折叠
au BufWinLeave * silent mkview 
au BufWinEnter * silent loadview

>>>>>>> af68b420f58e124c0a3f024bc608295efafaf67a
set expandtab
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
<<<<<<< HEAD
"set autoindent 
set cindent 
=======
set autoindent 
set cindent 
"if &term=="xterm" 
"    set t_Co=8 
"    set t_Sb=^[[4%dm 
"    set t_Sf=^[[3%dm 
"endif
>>>>>>> af68b420f58e124c0a3f024bc608295efafaf67a
"设置状态栏
set laststatus=2
set statusline=%f%=%l,%v\ %p%%\ LEN=%L
"语法高亮
syntax on

" 与windows共享剪贴板
set clipboard+=unnamed
"w3m
"let g:w3m#command = '/usr/bin/w3m'
<<<<<<< HEAD
=======
"youdao{
vnoremap <silent> <C-T> <Esc>:Ydv<CR> 
nnoremap <silent> <C-T> <Esc>:Ydc<CR> 
noremap <leader>yd :Yde<CR>
"}
>>>>>>> af68b420f58e124c0a3f024bc608295efafaf67a
"pathogen
call pathogen#infect()
"Powerline{
set laststatus=2
"set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible 
set t_Co=256 
let g:Powerline_symbols = 'fancy'
 "let g:Powerline_symbols='unicode'
set fillchars+=stl:\ ,stlnc:\
"} 

"tagbar{
"设置快捷键  
nmap <F4> :TagbarToggle<CR>   
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

"检测file类型，默认On;自动加载该类型相关的插件;自动选择合适的缩进方式
filetype plugin indent on
"修改注释颜色
hi Comment ctermfg=6
"高亮显示搜索结果
set hlsearch
hi Search term=standout ctermfg=0 ctermbg=11 guifg=Black guibg=Yellow
" 不能用backspace键删除
set backspace=indent,eol,start
"输入时，显示匹配的括号
set showmatch
set matchtime=0
"光标的上方或下方至少会保留显示的行数
set scrolloff=3
<<<<<<< HEAD
"关闭vim声音错误提示
set vb t_vb=
"nmap <leader>w :w<CR>
nmap <leader>e :tabe<Space>
nnoremap <leader>p :cp<CR> 
nnoremap <leader>n :cn<CR>

"make,make with makeprg
"nnoremap <leader>m :call Do_OneFileMake()<CR>:make!<CR><CR><CR>:ccl<CR>
map <F5> :call Do_OneFileMake()<CR>:make!<CR><CR><CR>:ccl<CR>
            \:for d in getqflist() <Bar>
            \if d.type=~?'e' <Bar><Bar> d.type=~?'w'  <Bar><Bar> d.text =~?'error' <Bar><Bar>d.text =~?'warning' <Bar>
            \copen <Bar>
            \break <Bar> 
            \endif <Bar>
            \endfor<CR>
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
map <F6> :call Do_make()<CR>:make!<CR><CR><CR>:ccl<CR>
            \:for d in getqflist() <Bar>
            \if d.type=~?'e' <Bar><Bar> d.type=~?'w'  <Bar><Bar> d.text =~?'error' <Bar><Bar>d.text =~?'warning' <Bar>
            \copen <Bar>
            \break <Bar> 
            \endif <Bar>
            \endfor<CR>
function Do_make()
    set makeprg=make
endfunction
=======
>>>>>>> af68b420f58e124c0a3f024bc608295efafaf67a
