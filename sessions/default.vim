" ~/.vim/sessions/default.vim:
" Vim session script.
" Created by session.vim 2.7 on 03 二月 2015 at 19:43:20.
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
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Desktop/iwork/neutron_yield
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 neutron_yield_eng.tex
badd +1 ldjtheme.sty
badd +1 ~/Desktop/iwork/ctex_ppt_ldj_template/ldj_ppt_template.tex
badd +1 ~/Desktop/iwork/ctex_ppt_ldj_template/ldjtheme.sty
badd +1 ~/Desktop/iwork/WS3.25_isotopes/Isotope_progress.tex
badd +1 ~/Desktop/iwork/WS3.25_isotopes/ldjtheme.sty
badd +10 ~/Desktop/iwork/WG5.21Model_independent/model_independent_estimation_of_fn.tex
badd +1 ~/Desktop/iwork/WG5.21Model_independent/ldjtheme.sty
argglobal
silent! argdel *
argadd neutron_yield_eng.tex
edit ~/Desktop/iwork/WS3.25_isotopes/Isotope_progress.tex
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
setlocal fdl=5
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
2,23fold
46,62fold
88,91fold
64,93fold
100,102fold
108,108fold
113,122fold
94,126fold
63,126fold
147,150fold
128,153fold
159,159fold
165,165fold
166,166fold
167,167fold
168,168fold
169,173fold
154,175fold
183,185fold
191,194fold
201,207fold
176,210fold
213,216fold
211,217fold
127,217fold
45,217fold
226,226fold
227,227fold
228,228fold
229,229fold
230,230fold
223,232fold
233,233fold
220,251fold
275,280fold
252,282fold
286,286fold
287,291fold
292,298fold
305,310fold
283,313fold
317,317fold
318,322fold
323,331fold
338,343fold
314,346fold
350,350fold
351,355fold
356,364fold
371,376fold
347,379fold
383,383fold
384,393fold
384,393fold
380,395fold
399,399fold
400,403fold
404,404fold
396,406fold
219,406fold
408,425fold
434,437fold
426,443fold
452,455fold
444,461fold
468,471fold
479,482fold
462,490fold
491,518fold
519,524fold
407,524fold
218,524fold
525,532fold
546,546fold
554,554fold
555,555fold
556,556fold
557,557fold
558,562fold
540,565fold
571,571fold
577,581fold
595,597fold
566,599fold
602,606fold
600,607fold
539,607fold
611,613fold
608,615fold
533,615fold
2
normal! zc
45
silent! normal! zo
46
normal! zc
63
silent! normal! zo
64
silent! normal! zo
88
normal! zc
64
normal! zc
94
silent! normal! zo
100
normal! zc
108
normal! zc
113
normal! zc
94
normal! zc
63
normal! zc
127
silent! normal! zo
128
silent! normal! zo
147
normal! zc
128
normal! zc
154
silent! normal! zo
159
normal! zc
165
normal! zc
166
normal! zc
167
normal! zc
168
normal! zc
169
normal! zc
154
normal! zc
176
silent! normal! zo
183
normal! zc
191
normal! zc
201
normal! zc
176
normal! zc
211
silent! normal! zo
213
normal! zc
211
normal! zc
127
normal! zc
45
normal! zc
218
silent! normal! zo
219
silent! normal! zo
220
silent! normal! zo
223
silent! normal! zo
226
normal! zc
227
normal! zc
228
normal! zc
229
normal! zc
230
normal! zc
223
normal! zc
233
normal! zc
220
normal! zc
252
silent! normal! zo
275
normal! zc
252
normal! zc
283
silent! normal! zo
286
normal! zc
287
normal! zc
292
normal! zc
305
normal! zc
283
normal! zc
314
silent! normal! zo
317
normal! zc
318
normal! zc
323
normal! zc
338
normal! zc
314
normal! zc
347
silent! normal! zo
350
normal! zc
351
normal! zc
356
normal! zc
371
normal! zc
347
normal! zc
380
silent! normal! zo
383
normal! zc
384
silent! normal! zo
384
normal! zc
384
normal! zc
380
normal! zc
396
silent! normal! zo
399
normal! zc
400
normal! zc
404
normal! zc
396
normal! zc
219
normal! zc
407
silent! normal! zo
408
normal! zc
426
silent! normal! zo
434
normal! zc
426
normal! zc
444
silent! normal! zo
452
normal! zc
444
normal! zc
462
silent! normal! zo
468
normal! zc
479
normal! zc
462
normal! zc
491
normal! zc
519
normal! zc
407
normal! zc
218
normal! zc
525
normal! zc
533
silent! normal! zo
539
silent! normal! zo
540
silent! normal! zo
546
normal! zc
554
normal! zc
555
normal! zc
556
normal! zc
557
normal! zc
558
normal! zc
540
normal! zc
566
silent! normal! zo
571
normal! zc
577
normal! zc
595
normal! zc
566
normal! zc
600
silent! normal! zo
602
normal! zc
600
normal! zc
539
normal! zc
608
silent! normal! zo
611
normal! zc
608
normal! zc
533
normal! zc
let s:l = 9 - ((8 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
9
normal! 0
tabedit neutron_yield_eng.tex
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
setlocal fdl=4
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
4,30fold
63,68fold
69,81fold
82,82fold
60,84fold
87,92fold
93,97fold
85,99fold
105,108fold
112,113fold
118,119fold
120,121fold
122,123fold
124,125fold
126,127fold
128,133fold
134,135fold
136,141fold
142,144fold
149,156fold
54,180fold
350,354fold
181,569fold
570,632fold
52,632fold
666,669fold
675,678fold
690,692fold
635,692fold
633,692fold
4
normal! zc
52
silent! normal! zo
54
silent! normal! zo
60
silent! normal! zo
63
normal! zc
69
normal! zc
82
normal! zc
60
normal! zc
85
silent! normal! zo
87
normal! zc
93
normal! zc
85
normal! zc
105
normal! zc
112
normal! zc
118
normal! zc
120
normal! zc
122
normal! zc
124
normal! zc
126
normal! zc
128
normal! zc
134
normal! zc
136
normal! zc
142
normal! zc
149
normal! zc
54
normal! zc
181
silent! normal! zo
350
normal! zc
181
normal! zc
570
normal! zc
52
normal! zc
633
silent! normal! zo
635
silent! normal! zo
666
normal! zc
675
normal! zc
690
normal! zc
635
normal! zc
633
normal! zc
let s:l = 45 - ((3 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
45
normal! 0
tabedit ~/Desktop/iwork/ctex_ppt_ldj_template/ldj_ppt_template.tex
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
let s:l = 15 - ((3 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
15
normal! 0
tabnext 3
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
tabnext 3
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
