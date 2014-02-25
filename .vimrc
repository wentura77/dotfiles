" Wentura ~/.vimrc
set nocompatible
filetype off " обязательно!

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

filetype plugin indent on " обязательно!
Bundle 'Python-mode-klen'
" let g:pymode_lint_checker = "pep8,mccabe" pyflakes
Bundle 'Tagbar'
nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0 "tagbar shows tags in order of they created in file
let g:tagbar_foldlevel = 0 "close tagbar folds by default

Bundle 'The-NERD-tree'
autocmd vimenter * NERDTree
autocmd FileType python setlocal ts=4 sts=4 sw=4

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc$']

map <C-n> :NERDTreeToggle<CR>

" Основные настройки


if has("unix")
	set listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×
	set encoding=utf-8
	set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё~

else
	set listchars=tab:+-,trail:?,extends:>,precedes:<,nbsp:?
endif

set fileencodings=utf-8,windows-1251,iso-8859-15,koi8-r
set fileformats=unix,dos,mac

" переключение режима отступов при вставке
set pastetoggle=<F2>
set wildmenu
set wildcharm=<TAB>
set tabpagemax=99

if has("mouse")
    set mouse=nvir
endif

if has("clipboard")
    " использовать буфер мыши при выделении
    set clipboard=autoselect
endif
" настройки сессий
set viminfo='128,/64,:64,<64,s10,h,n~/.vim/viminfo
" настройки файлов с сессиями
set sessionoptions=buffers,tabpages,help
" отключить автоматический перенос строк
set formatoptions-=tc
" отключить автоматическое открытие новой строки комментария
set formatoptions-=o
if has("folding")
    " сворачивать по отступам
    set foldmethod=indent
    " не сворачивать рекурсивно
    set foldlevel=99
endif

set history=128
set undolevels=2048
set backup
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
" сохранять умные резервные копии ежедневно
    function! BackupDir()
        if !exists("g:backupdir_default")
            let g:backupdir_default=&backupdir
        endif
        let l:backupdir=g:backupdir_default
        if &backup
            if has("unix")
                let l:backupdir.=substitute(expand("%:p:h"), "^".$HOME, "~", "")
            else
                let l:backupdir.=substitute(expand("%:p:h"), ":", "$", "")
            endif
            if !isdirectory(l:backupdir)
                call mkdir(l:backupdir, "p", 0700)
            endif
        endif
        let &backupdir=l:backupdir
        let &backupext=strftime("~%Y-%m-%d~")
    endfunction

set lazyredraw
set modeline
set t_Co=256
colorscheme slate
set ttimeoutlen=100
set autoread
set smartindent
if !&diff
	syntax enable
endif
set number
set ruler

set statusline+=%=Col:%3*%03c%*\ Ln:%3*%04l/%04L%*
set statusline+=%(\ File:%3*%{join(filter([&filetype,&fileformat!=split(&fileformats,',')[0]?&fileformat:'',&fileencoding!=split(&fileencodings,',')[0]?&fileencoding:''],'!empty(v:val)'),'/')}%*%)
set title
set titlestring=%t%(\ %m%)%(\ %r%)%(\ %h%)%(\ %w%)%(\ (%{expand(\"%:p:~:h\")})%)\ -\ VIM


set keywordprg=:help
" Табуляция
set tabstop=4
set softtabstop=4
set et|retab
set shiftwidth=4
set confirm

" поиск
set hlsearch
set ignorecase

set list

" Python

autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
let g:neocomplcache_enable_at_startup = 1

" Шаблоны Django
autocmd BufNewFile,BufRead *.html call DetectTemplate()
fun! DetectTemplate()
  let n = 1
  while n < line("$")
    if getline(n) =~ '{%' || getline(n) =~ '{{'
      set ft=htmldjango
      return
    endif
    let n = n + 1
  endwhile
  set ft=html "default html
endfun

" --- всячина ---

" проверим и создадим каталог под резервные копии
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p", 0700)
endif

" проверим и создадим каталог под swap
if !isdirectory(&directory)
    call mkdir(&directory, "p", 0700)
endif

" попробуем прочитать локальный файл конфигурации
if filereadable($HOME.'/.vimrc.local')
    source $HOME.'/.vimrc.local'
endif

