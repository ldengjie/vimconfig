" ~/.vim/sessions/default.vim:
" Vim session script.
" Created by session.vim 2.7 on 07 五月 2015 at 16:48:26.
" Open this file in Vim and run :source % to restore your session.

set guioptions=egmrL
silent! set guifont=PowerlineSymbols\ for\ Powerline
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'light'
	set background=light
endif
if !exists('g:colors_name') || g:colors_name != 'macvim' | colorscheme macvim | endif
call setqflist([{'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': '(/usr/local/texlive/2014basic/texmf-dist/tex/generic/oberdiek/ifpdf.sty'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': ')'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': '))'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': '(/usr/local/texlive/2014basic/texmf-dist/tex/latex/oberdiek/auxhook.sty'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': '))'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': '(/usr/local/texlive/2014basic/texmf-dist/tex/latex/beamer/beamerbasetitle.sty'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': '(/usr/local/texlive/2014basic/texmf-dist/tex/latex/beamer/beamerbaseframe.sty'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': '(./ldjtheme.sty'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': '(/usr/local/texlive/2014basic/texmf-dist/tex/latex/l3kernel/l3xdvipdfmx.def'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': '(/usr/local/texlive/2014basic/texmf-dist/tex/latex/metalogo/metalogo.sty'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': '(/usr/local/texlive/2014basic/texmf-dist/tex/latex/pgf/frontendlayer/tikz.sty'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': ') (/usr/local/texlive/2014basic/texmf-dist/tex/latex/pgf/math/pgfmath.sty'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': ')'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': ')'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': ')'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': '))'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': '(./neutron_yield_eng.aux)'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': '(./neutron_yield_eng.out)'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'OT1/cmss/m/n --> EU1/ComicSansMS(0)/m/n on input line 3'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'OT1/cmr/bx/n --> EU1/ComicSansMS(0)/bx/n on input line '}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'OT1/cmr/bx/n --> EU1/ComicSansMS(0)/bx/n on input line '}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'OT1/cmss/m/n --> EU1/ComicSansMS(0)/m/n on input line 3'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'OT1/cmss/bx/n --> EU1/ComicSansMS(0)/m/n on input line '}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'OT1/cmr/m/it --> EU1/ComicSansMS(0)/m/it on input line '}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'OT1/cmr/bx/it --> EU1/ComicSansMS(0)/m/it on input line'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'OT1/cmtt/m/n --> EU1/ComicSansMS(1)/m/n on input line 3'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'OT1/cmtt/m/n --> EU1/ComicSansMS(1)/m/n on input line 3'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'EU1/ComicSansMS(0)/m/n --> EU1/ComicSansMS(0)/bx/n on i'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'EU1/ComicSansMS(0)/m/it --> EU1/ComicSansMS(0)/bx/it on'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'OT1/cmss/bx/n --> EU1/ComicSansMS(0)/bx/n on input line'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'EU1/ComicSansMS(0)/bx/n --> EU1/ComicSansMS(0)/bx/n on '}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'EU1/ComicSansMS(0)/m/n --> EU1/ComicSansMS(0)/bx/n on i'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'EU1/ComicSansMS(0)/m/it --> EU1/ComicSansMS(0)/bx/it on'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'EU1/ComicSansMS(1)/m/n --> EU1/ComicSansMS(1)/bx/n on i'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'OT1/cmss/m/n --> EU1/ComicSansMS(0)/m/n on input line 3'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'OT1/cmss/bx/n --> EU1/ComicSansMS(0)/m/n on input line '}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'EU1/ComicSansMS(0)/m/n --> EU1/ComicSansMS(0)/m/n on in'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'EU1/ComicSansMS(0)/m/it --> EU1/ComicSansMS(0)/m/it on '}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'EU1/ComicSansMS(0)/bx/n --> EU1/ComicSansMS(0)/bx/n on '}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'EU1/ComicSansMS(0)/m/n --> EU1/ComicSansMS(0)/m/n on in'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'EU1/ComicSansMS(1)/m/n --> EU1/ComicSansMS(1)/m/n on in'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'EU1/ComicSansMS(0)/m/n --> EU1/ComicSansMS(0)/bx/n on i'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'EU1/ComicSansMS(0)/bx/it --> EU1/ComicSansMS(0)/bx/it o'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'EU1/ComicSansMS(0)/bx/n --> EU1/ComicSansMS(0)/bx/n on '}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'EU1/ComicSansMS(1)/bx/n --> EU1/ComicSansMS(1)/bx/n on '}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': 'using `EU1/ComicSansMS(0)/m/n'' instead on input line 71.'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/private/var/folders/ln/8rcqq2vs2jj3m906pkzgb0zw0000gn/T/vpVYQIl/14', 'text': ''}])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 neutron_yield_eng.tex
badd +1 ldjtheme.sty
badd +15 Desktop/iwork/ctex_ppt_ldj_template/ldj_ppt_template.tex
badd +1 Desktop/iwork/ctex_ppt_ldj_template/ldjtheme.sty
badd +1 Desktop/iwork/WS3.25_isotopes/Isotope_progress.tex
badd +1 Desktop/iwork/WS3.25_isotopes/ldjtheme.sty
badd +10 Desktop/iwork/WG5.21Model_independent/model_independent_estimation_of_fn.tex
badd +1 Desktop/iwork/WG5.21Model_independent/ldjtheme.sty
badd +2062 neutron_yield_eng.log
badd +763 Desktop/iwork/WS3.25_isotopes/Isotope_progress.log
badd +73 neutron_yield_eng.aux
argglobal
silent! argdel *
argadd neutron_yield_eng.tex
edit neutron_yield_eng.tex
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
setlocal fdl=3
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
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
