"author: Priyanshu Shrivastav (mr.convict)
"git clone https://github.com/convict-git/.vimrc/blob/master/.vimrc ~/.vimrc
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"https://github.com/cstrap/monaco-font and http://www.gringod.com/wp-upload/software/Fonts/Monaco_Linux.ttf
"set gfn=CMU\ Typewriter\ Text\ Bold\ 14
"set gfn=Ubuntu\ Mono\ 13
set gfn=Monaco\ 10
"set gfn=Terminus\ Medium\ 14
"set gfn=Fixed\ 11
set lines=50 columns=110
set rnu
set nu
set history=500
set autoindent
set smartindent
set noswapfile
set tabstop=3
set shiftwidth=2
set smarttab
set autowrite
set autoread
set wildmenu
set showcmd
set smartcase
set hlsearch
set ignorecase
set incsearch
set encoding=utf-8
set matchpairs=(:),{:},[:],<:>,':',":"
set noerrorbells
set mouse=a
set belloff=all
syntax enable
set statusline=%<%f%h%m%r%=char=%b=0x%B\ \ %l,%c%V\ %P
set t_Co=256
set cursorline
set gcr=n-v-c:hor30-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:hor10-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait0-blinkoff150-blinkon175
set guicursor+=a:blinkon0
set printoptions=paper:A4
set colorcolumn=80
set background=dark
"colorscheme default
"colorscheme sol
colorscheme blue2
"colorscheme jellybeans
"matching paren red
autocmd BufRead,BufNewFile,BufEnter * syn match parens /[(){}]/ | hi parens guifg=red ctermfg=white cterm=bold

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required

"****************************************************************************
"PLUGINS
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
"Plugin 'alvan/vim-closetag'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'ap/vim-css-color'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'lambdalisue/vim-fullscreen'
"Plugin 'lpenz/vimcommander'
Plugin 'cocopon/iceberg.vim'


Plugin 'rakr/vim-two-firewatch'
"for full screen ```sudo apt-get install wmctrl```

call vundle#end()

let g:cpp_concepts_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_scope_highlight = 1

"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:syntastic_mode="passive"

nnoremap <C-n> :NERDTreeToggle<CR>
let g:ctrlp_map = '<space>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '.viminfo\|exe\|out'

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

let g:YcmForceCompileAndDiagnostics = 0
let g:ycm_enable_diagnostic_signs = 0

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled = 1

"****************************************************************************
"codeforces vim
"
"****************************************************************************
"Man pages for cpp (doesn't works so nice in gvim)
"sudo apt-get install cppman
"autocmd FileType cpp set keywordprg=cppman
"****************************************************************************
"Compilers
"
autocmd filetype cpp nnoremap <C-c> :w <bar> e <bar> !xterm -e "g++ -std=gnu++14 -Wall -g -Wextra -Wshadow -Wfloat-equal -Wconversion -Wshift-overflow=2 -Wduplicated-cond -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=signed-integer-overflow -fsanitize=bounds -O2 -DCONVICTION % -o %:p:h/%:t:r.exe && ~/cplib/success.sh && cat ~/cplib/ast && echo -e \"Input file \" && cat in && cat ~/cplib/ast && echo -e \"\\e[1mOutput\\e[0m\" && ./%:r.exe  && cat ~/cplib/ast && echo -e \"\\e[1m\" && /usr/bin/time --format=\"Memory Used  : \%M kb\nTime Elapsed : \%e sec\" ./%:r.exe > out ;read"<CR>
autocmd filetype c nnoremap <C-c> :w <bar> e <bar> !xterm -e "gcc % -g -DCONVICTION -lm -o %:p:h/%:t:r.out && ./%:r.out && echo -e \"\\e[1m\" && /usr/bin/time --format=\"Memory Used  : \%M kb\nTime Elapsed : \%e sec\" ./%:r.out > out ; read"<CR>

autocmd filetype javascript nnoremap <C-c> :! node %<CR>
autocmd filetype html nnoremap <C-c> :!google-chrome %<CR>
autocmd filetype java nnoremap <C-c> :w <bar> !javac % && xterm -e "time java -enableassertions %:t:r ;read" <CR>
autocmd filetype python nnoremap <C-c> :w <bar> !xterm -e "python %; read"<CR
autocmd filetype perl nnoremap <C-c> :w <bar> !perl % <CR>
autocmd filetype go nnoremap <C-c> :w <bar> !go build % && ./%:p <CR>
autocmd filetype sh nnoremap <C-c> :!xterm -e "chmod +x % && ./%;read"<CR>
"
"****************************************************************************
"Key bindings
"
"space for ctrlp (file explorer)
"<C-c> for compiling
nnoremap <C-j> :tabNext<CR>
nnoremap <C-k> :tabnext<CR>
"<C-n> for nerdtree (file tree)
nnoremap <C-t> :tabnew<CR>
"<C-x> for running
nnoremap <F2> :normal "+gP<CR>"
nnoremap <F3> :!xterm -e "checker out ex_out; read"
autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=gnu++14 -Wall -Wextra -Wshadow -Wfloat-equal -Wconversion -Wshift-overflow=2 -Wduplicated-cond -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=signed-integer-overflow -fsanitize=bounds -O2 -DCONVICTION % -o %:p:h/%:t:r.exe && time ./%:r.exe
nnoremap <F5> :!xterm -e "./main.exe && time ./main.exe > out && echo Task completed; read"<CR><CR>
nnoremap <S-F5> :ha > %:t:r <bar> !ps2pdf %:t:r && rm -rf %:t:r<CR>
nnoremap <S-F6> :!nautilus %<CR>
autocmd filetype c nnoremap <F6> :!xterm -e "valgrind --leak-check=full --show-leak-kinds=all ./%:r.out; read"<CR>
autocmd filetype cpp nnoremap <F6> :!xterm -e "valgrind --leak-check=full --show-leak-kinds=all ./%:r.exe; read"<CR>
autocmd filetype cpp nnoremap <F7> :!xterm -e "gdb ./%:r.exe; read"<CR>
autocmd filetype c nnoremap <F7> :!xterm -e "gdb ./%:r.out; read"<CR>
autocmd filetype c,cpp nnoremap <F8> :colorscheme blue <bar> set gfn=Fixed\ 14<CR>
autocmd filetype c,cpp nnoremap <F9> :set gfn=Ubuntu\ Mono\ 13<CR>
autocmd filetype cpp nnoremap <C-x> :cd %:p:h <bar> call RunTest()<CR>
nnoremap <C-g> :Explore %:p:h<CR>
nnoremap <C-d> :call ShellMe()<CR>
nnoremap <C-z> :cd %:p:h <bar> call Parse()<CR>
autocmd filetype cpp nnoremap <C-a> :cd %:p:h <bar> call TestCase()<CR>
nnoremap <S-F9> :silent exec '!gedit % &'<CR>
nnoremap <F10> :source ~/.vimrc<CR>
"<F11> for toggling toolbar and menubar
nnoremap <F12> :%y+<CR>
autocmd filetype c,cpp nnoremap <F12> :call Mrconvict() <bar> !xterm -e "~/cplib/warn.sh; read"<CR>
autocmd filetype c,cpp nnoremap <S-F12> :call AssumeDead() <bar> !xterm -e "~/cplib/warn.sh; read"<CR>
nnoremap <S-CR> i<CR><Esc> " Needed for GVIm

autocmd filetype c,cpp nnoremap <leader>stree :read ~/cplib/st.cpp<CR>
autocmd filetype c,cpp nnoremap <leader>fast :read ~/cplib/fastio.cpp<CR>
autocmd filetype c,cpp nnoremap <leader>ext :read ~/cplib/ext.cpp<CR>
autocmd filetype c,cpp nnoremap <leader>err :read ~/cplib/fprintf.cpp<CR>
nnoremap <leader>cd :Explore ~/Desktop/3xc3pt10n/3xc3pt10n<CR>
nnoremap <leader>sb :call Submit()<CR>
nnoremap <leader>my :silent exec 'terminal w3m https://codeforces.com/submissions/mr.convict'<CR>
"****************************************************************************

"templates and other Buffer features
if has("autocmd")
  augroup templates_"
	"autocmd BufEnter *.cpp,*.c,*.cc colorscheme far
	"autocmd BufEnter *.js,*.php,*.html,*.py,in colorscheme jellybeans
	"autocmd BufEnter *.sql,*.md colorscheme peachpuff
	"autocmd BufEnter *.cpp :exec '1,25 fold'
	autocmd BufEnter * silent! lcd %:p:h
	autocmd BufEnter *.exe,*.out !xterm -e "./%; read"
	autocmd BufEnter *.pdf !evince %
	autocmd BufNewFile *.cpp 0r ~/cplib/temp.cpp
	autocmd BufNewFile *.cc 0r ~/temp.cc
	autocmd BufNewFile *.c 0r ~/temp.c
	autocmd BufNewFile *.html 0r ~/temp.html
	autocmd BufWrite *.sql %y+
  augroup END
endif
"****************************************************************************
"
"Cursor retains the position
autocmd BufReadPost *
	  \ if line("'\"") > 0 && line("'\"") <= line("$") |
	  \   exe "normal! g`\"" |
	  \ endif
"****************************************************************************
"My tab completion
function! My_Tab_Completion()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
	return "\<C-P>"
  else
	return "\<Tab>"
	endif
  endfunction
  inoremap <Tab> <C-R>=My_Tab_Completion()<CR>


  "/****************************************************************************/
  "Menu and Toolbar toggle
  function! ToggleGUICruft()
	if &guioptions=='i'
	  exec('set guioptions=imTrL')
	else
	  exec('set guioptions=i')
	endif
  endfunction

  map <F11> <Esc>:call ToggleGUICruft()<cr>

  " by default, hide gui menus
  set guioptions=i


  "/****************************************************************************/
  "Removes trailing whitespaces
  autocmd BufWritePre * %s/\s\+$//e

  "/****************************************************************************/
  "
  "My functions for gvim && competitive
  "
  "sudo mv parse.py /usr/bin/parse
  "nnoremap <C-z> :cd %:p:h <bar> call Parse()<CR>
  "self check test cases
  "autocmd filetype cpp nnoremap <C-a> :cd %:p:h <bar> call TestCase()<CR>
  "autocmd filetype cpp nnoremap <C-x> :cd %:p:h <bar> !xterm -e "./test.sh; read"<CR><CR>
  "

  "highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  "match OverLength /\%81v.\+/
  function! ShellMe()
	exec '!clear'
	exec 'shell'
  endfunction
  function! Mrconvict()
	exec '0r ~/cplib/mrconvict.cpp'
	exec '%y+'
	exec '1,7d'
  endfunction
  function! AssumeDead()
	exec '0r ~/cplib/assumedead.cpp'
	exec '%y+'
	exec '1,7d'
  endfunction

	function! RunTest()
	  if (!empty (glob ("test.sh")))
		exec '!xterm -e "./test.sh; read"'
	  else
		exec '!xterm -e "runTestCases; read"'
	  endif
	endfunction

	function! Parse()
	  let new_contest = input('Enter codeforces contest code (eg. 1009 --p A for problem A of 1009): ')
	  exec '!xterm -e "parse ' . l:new_contest. ';read"'
	endfunction"

	function! Submit()
	  let @+=expand("%:p")
	  echo expand("%:p")
	  let submit_contest = input('Enter codeforces contest code (eg. 1009/A for problem A of 1009): ')
	  let confirm = input ('Are you sure of submitting this file (y/n) : ')
	  if confirm == 'y'
		 silent exec '!gnome-terminal --tab -- w3m https://codeforces.com/problemset/submit/' . l:submit_contest. ' '
	  endif
	endfunction"

	function! TestCase()
	  let index = 1
	  while !empty(glob("input".index))
		let index += 1
	  endwhile
	  echo "Input case: " . index . " "
	  let in = input('Input case: ')
	  echo " "
	  let out = input('Output case: ')
	  echo " "
	  let confirm = input ('Are you sure of writing this test case (y/n) : ')
	  if confirm == 'y'
		silent exec '!echo "' . in . '" > input' . index
		silent exec '!echo "' . out . '" > output' . index
	  endif
	endfunction
