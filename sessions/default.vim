" ~/.vim/sessions/default.vim:
" Vim session script.
" Created by session.vim 2.7 on 25 三月 2015 at 03:57:34.
" Open this file in Vim and run :source % to restore your session.

set guioptions=egmrL
silent! set guifont=Menlo\ Regular:h11
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'light'
	set background=light
endif
if !exists('g:colors_name') || g:colors_name != 'macvim' | colorscheme macvim | endif
call setqflist([{'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/v5rXEdR/16', 'text': '(/usr/local/texlive/2014basic/texmf-dist/tex/latex/pgf/frontendlayer/tikz.sty'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/v5rXEdR/16', 'text': ')'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/v5rXEdR/16', 'text': '))'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/v5rXEdR/16', 'text': ') (/usr/local/texlive/2014basic/texmf-dist/tex/latex/pgf/math/pgfmath.sty'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/v5rXEdR/16', 'text': ')'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/v5rXEdR/16', 'text': ')'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/v5rXEdR/16', 'text': ')'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/v5rXEdR/16', 'text': '))'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/v5rXEdR/16', 'text': ''}])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd /
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/Desktop/iwork/neutron_yield/neutron_yield_technote.tex
badd +29 ~/Desktop/iwork/neutron_yield/neutron_yield_eng.tex
badd +1 ~/Desktop/iwork/neutron_yield/ldjtheme.sty
badd +15 ~/Desktop/iwork/ctex_ppt_ldj_template/ldj_ppt_template.tex
badd +1 ~/Desktop/iwork/ctex_ppt_ldj_template/ldjtheme.sty
badd +1 ~/Desktop/iwork/WS3.25_isotopes/Isotope_progress.tex
badd +1 ~/Desktop/iwork/WS3.25_isotopes/ldjtheme.sty
badd +10 ~/Desktop/iwork/WG5.21Model_independent/model_independent_estimation_of_fn.tex
badd +1 ~/Desktop/iwork/WG5.21Model_independent/ldjtheme.sty
badd +2348 ~/Desktop/iwork/neutron_yield/neutron_yield_eng.log
badd +763 ~/Desktop/iwork/WS3.25_isotopes/Isotope_progress.log
badd +7 ~/Desktop/iwork/neutron_yield/neutron_yield_eng.toc
badd +1 /neutron_yield_eng.log
badd +24 /neutron_yield_technote.tex
badd +623 ~/Desktop/iwork/neutron_yield/neutron_yield_technote.log
badd +53 /usr/local/texlive/2014basic/texmf-dist/tex/latex/xltxtra/xltxtra.sty
badd +99 /Volumes/UPan/backup/documents/研究生/硕士毕业/latex_小文章/ustc_article.tex
badd +154 ~/.vimrc
badd +177 ~/Desktop/iwork/neutron_yield/neutron_yield.tex
argglobal
silent! argdel *
argadd ~/Desktop/iwork/neutron_yield/neutron_yield_technote.tex
edit ~/Desktop/iwork/neutron_yield/neutron_yield_technote.tex
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 114 - ((3 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
114
normal! 0
tabnext 1
if exists('s:wipebuf')
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

1wincmd w
tabnext 1
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
