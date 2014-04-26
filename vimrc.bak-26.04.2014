call pathogen#infect()
syntax on
filetype plugin indent on
filetype indent on
set nu
set ts=2
set bs=2
set shiftwidth=2
set autoindent
set smarttab
set expandtab
set showmatch
set laststatus=2
set rnu " Relative line numbers
color plazora
color seoul256
color mango
color lucius
set background=dark
set title

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Get rid of swap files 
set nobackup
set noswapfile

set nocompatible

set term=screen-256color

" Show the autocomplete options above the command line
set wildmenu

" Move a line with Alt+[jk]
nmap <C-k> :m-2<CR>
nmap <C-j> :m+1<CR>

" Apply substitutions globally
set gdefault
let g:agprg="ag --column"

" Alias :W to :w
ca W w

" Search 
set ignorecase
set incsearch
set hlsearch

" Replace thanks for flying vim with something more useful
let &titleold=getcwd()

" Remap esc
inoremap jj <Esc>

" Remap leader
let mapleader=","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nnoremap j gj
nnoremap k gk

set nolist

" highlight current line
set cul
" No need to type 'asdasdasfdgfd' after search to clear highlights
nmap <silent> <leader><space> :nohlsearch<CR>

" Save folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
set viewoptions=folds

set scrolloff=3 " scroll when nearing screen top/end

" Save folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
set viewoptions=folds

" Toggle the color line at 80 characters
function! ColorColumnToggle()
  if(&colorcolumn == 80)
    set colorcolumn=0
  else
    set colorcolumn=80
  endif
endfunction
nnoremap <C-c> :call ColorColumnToggle()<CR>

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set rnu
  endif
endfunction
nnoremap <C-n> :call NumberToggle()<CR>

" Center line when searching
nmap n nzz
nmap N Nzz

nmap <space> /
nmap <c-space> ?

" Swtich between buffers
noremap <tab> gt<CR>
noremap <S-tab> gT<CR>

" External copy/paste
set pastetoggle=<F2>

map <Leader>so :source ~/.vimrc <CR>

" Insert date
nmap <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" Rails specific bindings
map <Leader>mo :Rmodel 
map <Leader>mv :RVmodel 
map <Leader>ms :RSmodel 
map <Leader>vi :Rview 
map <Leader>vv :RVview 
map <Leader>vs :RSview 
map <Leader>co :Rcontroller 
map <Leader>cv :RVcontroller 
map <Leader>cs :RScontroller 
map <Leader>e :SlimuxREPLSendSelection<CR>
map <Leader>r :SlimuxREPLSendLine<CR>

" Tests
map <Leader>t :SlimuxShellRun s spec<CR>
map <Leader>t :SlimuxShellRun zeus test spec<CR>
map <Leader>s :SlimuxShellRun !!<CR>

map <leader>gr :topleft :split config/routes.rb<CR>

" Clojure
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=0

" Start ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
" let g:ctrlp_regexp = 1

au VimEnter * highlight clear SignColumn
" set cc=80

" xmpfilter
nmap <buffer> <Leader>q <Plug>(xmpfilter-run)
xmap <buffer> <Leader>q <Plug>(xmpfilter-run)
imap <buffer> <Leader>q <Plug>(xmpfilter-run)

" nmap <buffer> <Leader> <Plug>(xmpfilter-mark)
" xmap <buffer> <Leader> <Plug>(xmpfilter-mark)
" imap <buffer> <Leader> <Plug>(xmpfilter-mark)

" Open splits in the right or bottom
set splitbelow
set splitright

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Markdown files end in .md
au BufRead,BufNewFile *.md set filetype=markdown
au BufNewFile,BufRead *.rabl set filetype=ruby

au Filetype java setl et ts=4 sw=4

" Stuped
ab polciy policy

"use docx2txt.pl to allow VIm to view the text content of a .docx file directly.
autocmd BufReadPre *.docx set ro
autocmd BufReadPost *.docx %!docx2txt

" Gist config
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" change pwd
" nnoremap ,cd :lcd %:p:h<CR>:pwd<CR>
" map <silent> <unique> <Leader>cd <Plug>RooterChangeToRootDirectoy
autocmd BufWriteCmd *.html,*.css,*.gtpl :call Refresh_firefox()
function! Refresh_firefox()
  if &modified
    write
    silent !echo  'vimYo = content.window.pageYOffset;
          \ vimXo = content.window.pageXOffset;
          \ BrowserReload();
          \ content.window.scrollTo(vimXo,vimYo);
          \ repl.quit();'  |
          \ nc -w 1 localhost 4242 2>&1 > /dev/null
  endif
endfunction

nnoremap <Leader>p :CtrlPTag<CR>
nmap <F8> :TagbarToggle<CR>

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" HTML, XML {{{
      augroup FTHtml
        au!
        autocmd FileType html,xhtml,wml,cf setlocal ai et sta sw=2 sts=2 " set indent size and stuff
        autocmd FileType xml,xsd,xslt setlocal ai et sta sw=2 sts=2 ts=2
        autocmd FileType html setlocal iskeyword+=~

      augroup END

" CSS, SCSS {{{
      augroup FTCss
        au!
        au BufRead,BufNewFile *.scss.erb set ft=scss " when erb-ing sccs, use scss code highlighting
        autocmd FileType css,scss silent! setlocal omnifunc=csscomplete#CompleteCSS " autocomplete function
        autocmd FileType css,scss setlocal iskeyword+=-
        autocmd FileType css,scss setlocal ai et sta sw=2 sts=2
      augroup END
" }}}
"
"

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" XML formatter
function! DoFormatXML() range
	" Save the file type
	let l:origft = &ft

	" Clean the file type
	set ft=

	" Add fake initial tag (so we can process multiple top-level elements)
	exe ":let l:beforeFirstLine=" . a:firstline . "-1"
	if l:beforeFirstLine < 0
		let l:beforeFirstLine=0
	endif
	exe a:lastline . "put ='</PrettyXML>'"
	exe l:beforeFirstLine . "put ='<PrettyXML>'"
	exe ":let l:newLastLine=" . a:lastline . "+2"
	if l:newLastLine > line('$')
		let l:newLastLine=line('$')
	endif

	" Remove XML header
	exe ":" . a:firstline . "," . a:lastline . "s/<\?xml\\_.*\?>\\_s*//e"

	" Recalculate last line of the edited code
	let l:newLastLine=search('</PrettyXML>')

	" Execute external formatter
	exe ":silent " . a:firstline . "," . l:newLastLine . "!xmllint --noblanks --format --recover -"

	" Recalculate first and last lines of the edited code
	let l:newFirstLine=search('<PrettyXML>')
	let l:newLastLine=search('</PrettyXML>')
	
	" Get inner range
	let l:innerFirstLine=l:newFirstLine+1
	let l:innerLastLine=l:newLastLine-1

	" Remove extra unnecessary indentation
	exe ":silent " . l:innerFirstLine . "," . l:innerLastLine "s/^  //e"

	" Remove fake tag
	exe l:newLastLine . "d"
	exe l:newFirstLine . "d"

	" Put the cursor at the first line of the edited code
	exe ":" . l:newFirstLine

	" Restore the file type
	exe "set ft=" . l:origft
endfunction
command! -range=% FormatXML <line1>,<line2>call DoFormatXML()

nmap <silent> <leader>x :%FormatXML<CR>
vmap <silent> <leader>x :FormatXML<CR>
