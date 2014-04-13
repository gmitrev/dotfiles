" vim: set tw=0 sw=4 sts=4 et:

" Ketku's .vimrc file
" Maintainer: Tuomas Susi <tsusi@cc.hut.fi>
" Modified: CS 312 Staff
" Last Change: 2003 Jan 21
" Version: 1.14

" Warning: Contains some system-dependent stuff below this notice
" and in the autocommands at the bottom of this file. Needs at least vim 6.0.


""" Stuff that needs to be in the beginning

"set verbose=9      " Debug messages
set nocompatible    " Begin with Vim defaults (much better!)


""" System dependent stuff

" System dependent options
set dictionary+=~/.dictionary,~/.mail_aliases   " Dictionary
set backupdir=~/tmp,.,~/,/tmp                   " Set backup dir to .
set tags+=./tags;/                              " Upward tag search
set printoptions+=syntax:y                      " Use syntax hilighting when printing

" Terminal: we know xterm is a color terminal.
" This is from Debian GNU/Linux global vimrc
if &term =~ "xterm"
    set t_Co=16
    set t_Sf=[3%dm
    set t_Sb=[4%dm
endif

" GUI font
" "set guifont=-jmk-neep-medium-r-normal-*-*-140-*-*-c-*-iso8859-15

" Use my color scheme
" colorscheme darkslategray


""" Plugin stuff

" Don't use the status line stuff of the cvs plugin because it
" messes up my own status line and title bar messeges are OK.
let g:CVSstatusline = 0

" TeX itemize indent
let g:tex_indent_items = 1

" Man plugin
runtime ftplugin/man.vim        " <Leader>K gets a man page

" Winmanager mappings
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
map <c-w><c-t> :WMToggle<cr>
let g:saveTagsDisplay = 0


""" Options

" Misc options
set keywordprg=                 " Use :help when K is pressed, use man plugin for man pages
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set backup                      " Keep a backup file
set history=256                 " Set history size
set viminfo='64,\"2048,h,r/tmp,r~/tmp,r/floppy,r/cdrom,r/cdrom2 " read/write a .viminfo file
set showcmd                     " Show (partial) command in status line.
set sm                          " Use the kinky s/m-mode. Warning: adult content!
set hidden                      " Use emacs-style hidden buffers
set ww=<,>,[,],h,l,b,s,~        " Make end/beginning-of-line cursor wrapping behave human-like, not vi-like
set mouse=ar                    " Mouse on
set hlsearch                    " Highlight search results
set incsearch                   " Incremental search
set ignorecase                  " Do case insensitive matching
set infercase                   " Handle case in a smart way in autocompletes
set smartcase                   " Do smart case search
set vb                          " Visual bell
set nowrap                      " No wrapping of long lines
set showbreak=++++++++\         " If wrapping IS used, show it
set cpoptions+=n                " Use number column for wrapped lines
set ss=1                        " Nice sidescroll
set siso=9                      " Even nicer sidescroll ;)
set scrolloff=4                 " Keep lines between the cursor and bottom/top
set gdefault                    " Use g flag by default in substitutes
set wildmenu                    " Wild menu!
set wildmode=longest,full       " First match only to the longest common string, then use full/wildmenu match
set laststatus=2                " Always show status bar
set listchars=tab:»\ ,trail:·,extends:>,precedes:<  " Use sensible list chars
set foldopen+=jump              " Add jump to fold open list
set noea                        " Do not equalize windows
set previewheight=8             " Preview window height
set virtualedit=block           " Allow more flexible visual block selection
set switchbuf=useopen           " Buffer switching the reuses already visible buffers
set nosol                       " Don't jump to start of line with misc commands
set showfulltag                 " Show full tag completions
set complete=.,w,b,u,U,i,d,k,t  " Better completion, full tags last
set timeoutlen=2000             " Use a longer timeout
set guioptions+=c               " Use console dialogs
set guioptions-=T               " Don't show the toolbar
set nofoldenable                " Don't show folds by default

" Text formatting options
set autoindent                  " Always set autoindenting on
set shiftround                  " Always round indent to shiftwidth
set cinoptions+=(0              " Custom C indent options
set nojoinspaces                " Don't use double space after a period

" Tab stuff
set ts=8
set sw=8
set sts=0
set noet


""" Misc stuff

" Set syntax on
syntax on

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,CVS/,tags

" Status line
set statusline=%<%f\ %y[%{&ff}]%m%r%w%a\ %=%l/%L,%c%V\ %P


""" Commands

" Smart make command
com -nargs=* Make wa | make <args> | cwin

" Smart grep command
com -nargs=* -bar DummyGrep grep <args>
com -nargs=* Grep DummyGrep <args> | cwin

" cd to the dir of the current buffer
com Cd cd %:p:h
com CD cd %:p:h


""" Macros

" Easy move between buffers
map <F2> :bp<CR>
imap <F2> <Esc>:bp<CR>a
map <F3> :bn<CR>
imap <F3> <Esc>:bn<CR>a

" Easy wrap, line numbers & list mode toggle
map <F4> :setlocal wrap!<CR>
imap <F4> <Esc>:setlocal wrap!<CR>a
map <F5> :setlocal list!<CR>
imap <F5> <Esc>:setlocal list!<CR>a
map <F6> :setlocal nu!<CR>
imap <F6> <Esc>:setlocal nu!<CR>a

" Some programming helpers
"imap <Leader>for for() {<cr>}<Up><Right><Right><Right>
"map <Leader>for afor() {<cr>}<Up><Right><Right><Right>
"imap <Leader>if if() {<cr>}<Up><Right><Right>
"map <Leader>if aif() {<cr>}<Up><Right><Right>
"imap <Leader>else if() {<cr>} else {<cr>}<Up><Up><Right><Right>
"map <Leader>else aif() {<cr>} else {<cr>}<Up><Up><Right><Right>
"imap <Leader>elif if() {<cr>} else if() {<cr>} else {<cr>}<Up><Up><Up><Right><Right>
"map <Leader>elif aif() {<cr>} else if() {<cr>} else {<cr>}<Up><Up><Up><Right><Right>
"imap <Leader>while while() {<cr>}<Up><Right><Right><Right><Right><Right>
"map <Leader>while awhile() {<cr>}<Up><Right><Right><Right><Right><Right>
"imap <Leader>do do() {<cr>} while();<Left><Left>
"map <Leader>do ado() {<cr>} while();<Left><Left>
"imap <Leader>switch switch() {<cr>case 0:<cr>break;<cr><cr>default:<cr>}<Up><Up><Up><Up><Up><Right><Right><Right><Right><Right><Right>
"map <Leader>switch aswitch() {<cr>case 0:<cr>break;<cr><cr>default:<cr>}<Up><Up><Up><Up><Up><Right><Right><Right><Right><Right><Right>


""" Functions

" Enables/Disables folding
map <F7> :call <SID>ToggleFolding()<CR>
imap <F7> <Esc>:call <SID>ToggleFolding()<CR>a

function <SID>ToggleFolding()
    if &foldcolumn == 0
        setlocal foldenable
        setlocal foldcolumn=8
    else
        setlocal nofoldenable
        setlocal foldcolumn=0
    endif
endfunction

" This autocomments the curly brackets when you type }//
imap <Leader>} <ESC>:call <SID>CurlyBracket()<CR>a
map <Leader>} :call <SID>CurlyBracket()<CR>

function <SID>CurlyBracket()
    let l:line_num = line(".")
    let l:is_match = searchpair('{', '', '}', 'bW')
    if (l:is_match > 0)
        let l:comment_string = substitute(getline("."), '^\s*\(.\{-}\)\s*{', '\1', "")
        sil exe ":" . l:line_num
        sil exe "normal a // " . l:comment_string
    endif
endfunction

" Mark with restoring screen position (by Benji Fisher)
function s:Mark(...)
    if a:0 == 0
        let l:mark = line(".") . "G" . virtcol(".") . "|"
        normal! H
        let l:mark = "normal!" . line(".") . "Gzt" . l:mark
        execute l:mark
        return l:mark
    elseif a:0 == 1
        return "normal!" . a:1 . "G1|"
    else
        return "normal!" . a:1 . "G" . a:2 . "|"
    endif
endfun

" Remove trailing blanks but preserve sigdash lines
" Uses the Mark function above
function s:RemoveTrailingBlanks()
    let l:m = s:Mark()
    " Double backslashes required because the expression is evaluated
    " before it's executed
    silent! execute "%s/\\(^-- $\\)\\|\\(\\s\\+$\\)/\\1/"
    execute l:m
endfunction

" Deletes current buffer without closing the window
" By Raymond Li
command Bdelete call s:BufcloseCloseIt()
command BDelete call s:BufcloseCloseIt()

function s:BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete ".l:currentBufNum)
    endif
endfunction

" Sets simple syntax folding regions
function s:SetSyntaxFolding()

    setlocal foldmethod=syntax

    " Folding syntax regions
    syn region  ketkuCurlyFold
                    \ start="{"
                    \ end="}"
                \ transparent fold

    syn region  ketkuPreprocFold
                    \ start="#if$"
                    \ start="#if .*$"
                    \ start="#ifdef$"
                    \ start="#ifdef .*$"
                    \ start="#ifndef$"
                    \ start="#ifndef .*$"
                    \ end="#endif"
                \ transparent fold
endfunction

" Sets fancy quickfix stuff for LaTeX errors
function s:SetLaTeXMake()
    setlocal efm=%E!\ LaTeX\ %trror:\ %m,
        \%E!\ %m,
        \%+WLaTeX\ %.%#Warning:\ %.%#line\ %l%.%#,
        \%+W%.%#\ at\ lines\ %l--%*\\d,
        \%WLaTeX\ %.%#Warning:\ %m,
        \%Cl.%l\ %m,
        \%+C\ \ %m.,
        \%+C%.%#-%.%#,
        \%+C%.%#[]%.%#,
        \%+C[]%.%#,
        \%+C%.%#%[{}\\]%.%#,
        \%+C<%.%#>%.%#,
        \%C\ \ %m,
        \%-GSee\ the\ LaTeX%m,
        \%-GType\ \ H\ <return>%m,
        \%-G\ ...%.%#,
        \%-G%.%#\ (C)\ %.%#,
        \%-G(see\ the\ transcript%.%#),
        \%-G\\s%#,
        \%+O(%f)%r,
        \%+P(%f%r,
        \%+P\ %\\=(%f%r,
        \%+P%*[^()](%f%r,
        \%+P[%\\d%[^()]%#(%f%r,
        \%+Q)%r,
        \%+Q%*[^()])%r,
        \%+Q[%\\d%*[^()])%r
endfunction

" Smooth scrolling
map <C-U> :call ScrollUp(1)<CR>
map <C-D> :call ScrollDown(1)<CR>
map <C-B> :call ScrollUp(0)<CR>
map <C-F> :call ScrollDown(0)<CR>

function ScrollUp(isHalf)
    if a:isHalf
        let l:lines = &scroll
    else
        let l:lines = &lines - 4
    endif

    while l:lines > 0
        execute "normal \<C-Y>"
        redraw
        let l:lines =  l:lines - 1
    endwhile
endfunction

function ScrollDown(isHalf)
    if a:isHalf
        let l:lines = &scroll
    else
        let l:lines = &lines - 4
    endif

    while l:lines > 0
        execute "normal \<C-E>"
        redraw
        let l:lines =  l:lines - 1
    endwhile
endfunction


""" Abbreviations

" Programming helps
ia #i #include
ia #d #define
ia @p @param
ia @r @return
ia @t @throws
ia @s @see
ia @l @link

" TODO markers
ia t: TODO:
ia T: TODO:
ia //t: // TODO:
ia //T: // TODO:
ia /*t: /* TODO:
ia /*T: /* TODO:
ia "t: " TODO:
ia "T: " TODO:
ia %t: % TODO:
ia %T: % TODO:
ia #t: # TODO:
ia #T: # TODO:

" FIXME markers (I use these to mark temporary code)
ia f: FIXME:
ia F: FIXME:
ia //f: // FIXME:
ia //F: // FIXME:
ia /*f: /* FIXME:
ia /*F: /* FIXME:
ia "f: " FIXME:
ia "F: " FIXME:
ia %f: % FIXME:
ia %F: % FIXME:
ia #f: # FIXME:
ia #F: # FIXME:


""" Autocommands (these are not very portable, but rather customized)

if has("autocmd")
    " Set some sensible defaults for editing source files
    augroup ketku
        au!
        " Remove trailing blanks when writing buffer
        autocmd BufWritePre         *                               call s:RemoveTrailingBlanks()

        " Mark overlong lines (the color is optimixed for darkslategray)
        autocmd BufEnter            *                               hi rightMargin guibg=slategray | match rightMargin /\%79v/

        " Programming language stuff
        autocmd BufReadPost,BufNew  *.java                          setlocal comments=sl:/*,mb:*,elx:*/,:// makeprg=ant\ -emacs
        autocmd BufReadPost,BufNew  *.xml                           setlocal makeprg=ant\ -emacs
        autocmd BufReadPost,BufNew  build.xml                       setlocal ft=ant
        autocmd BufReadPost,BufNew  *.java,*.c,*.cpp,*.cc,*.h,*.xml setlocal sts=4 sw=4 et
        autocmd BufReadPost,BufNew  *.tex                           call s:SetLaTeXMake()

        " Use syntax folding w/these languages.
        autocmd Syntax              java,c,cpp                      call s:SetSyntaxFolding()
        autocmd BufEnter            \[Tag List\]                    setlocal foldmethod=manual
    augroup END
endif " has ("autocmd")
