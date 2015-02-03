let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_pdf = 'xelatex -synctex=1 -interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'Skim'

" 写出/cite{ 后按 F9  无反应，没有给出交叉引用，原因在于vim中的Python接口对latex-suite来说有些问题，将其禁用即可
let g:Tex_UsePython = 0

" 为了能够正向搜索，应设定好参数并使用/ll编译，然而当工作目录下有makefile时，/ll并非执行设定的编译命令，而是执行makefile，于是导致无法正向搜索，只要禁用makefile即可
let g:Tex_UseMakefile = 0

" Multiple runs on files with '\cite,\ref,\bibitem,etc'
let g:Tex_MultipleCompileFormats='pdf'

let g:Tex_IgnoredWarnings =
            \'Underfull'."\n".
            \'Overfull'."\n".
            \'specifier changed to'."\n".
            \'You have requested'."\n".
            \'Missing number, treated as zero.'."\n".
            \'There were undefined references'."\n".
            \'LaTeX Warning: Command %s invalid in math mode'."\n".
            \'Font Warning:'."\n".
            \'Citation %.%# undefined'
let g:Tex_IgnoreLevel = 9
