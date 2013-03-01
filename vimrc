call pathogen#infect()
syntax on
filetype plugin indent on
set nu
set ts=2
set bs=2
set shiftwidth=2
set autoindent
set smarttab
set expandtab
set showmatch
set laststatus=2
color plazora
" color Tomorrow-Night
" color solarized
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

" Show the autocomplete options above the command line
set wildmenu

" Move a line with Alt+[jk]
nmap <C-k> :m-2<CR>
nmap <C-j> :m+1<CR>

" Apply substitutions globally
set gdefault
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

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
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>

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

map <leader>gr :topleft :split config/routes.rb<CR>

" Clojure
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=0

" Start ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" set cc=80
