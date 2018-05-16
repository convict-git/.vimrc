set guifont=Monaco:h9:cANSI:qDRAFT
set rnu
set nu
set autoindent
set smartindent
set noswapfile
set tabstop=2
set shiftwidth=2
set smarttab
set autowrite
set autoread
set wildmenu
set showcmd
set smartcase
set ignorecase
set incsearch
set encoding=utf-8
set matchpairs=(:),{:},[:],<:>,':',":"
set mouse=a
set noerrorbells
set belloff=all
syntax enable
set statusline=%<%f%h%m%r%=char=%b=0x%B\ \ %l,%c%V\ %P
set t_Co=256

"set cursorline 
"autocmd InsertEnter * highlight CursorLine ctermbg=black cterm=bold gui=reverse
"autocmd InsertLeave * highlight CursorLine ctermbg=black cterm=bold 

"set cursorcolumn
"autocmd InsertEnter * highlight CursorColumn ctermfg=White ctermbg=Black cterm=bold 
"autocmd InsertLeave * highlight CursorLine ctermbg=White ctermbg=Black cterm=bold 

"****************************************************************************
"SWITCHING between tabs
nnoremap <C-k> :tabNext<CR>

"****************************************************************************
set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required
"****************************************************************************
"
""Compiler_g++(convict-git) ;)
"nnoremap <C-c> :!g++ -std=c++11 % -Wall -Werror -g -o %.out && chmod +x %.out && ./%.out<CR>
"Improved version
"Compile single cpp file without any non-standart headers
autocmd filetype cpp nnoremap <C-c> :w <bar> silent execute "!g++ -std=gnu++14 -O2 -DCONVICTION % -o %:p:h/%:t:r.exe"<CR>
autocmd filetype cpp nnoremap <F5>  :w <bar> !g++ -std=gnu++14 -O2 -DCONVICTION % -o %:p:h/%:t:r.exe<CR>
"autocmd filetype cpp nnoremap <C-x> :w <bar> !%:r.exe<CR>
autocmd filetype cpp nnoremap <C-x> :silent execute "!%:r.exe > out"<CR>
"Compilation in case when own header files are included 
autocmd filetype cpp nnoremap <F10> :wall <bar> !g++ -Wall -g -std=c++11 -O2 %:p:h/*.cpp -o %:p:h/%:p:h:t.out && ./%:r.out<CR>

"****************************************************************************
""Compiler_gcc(convict-git) ;)
autocmd filetype c nnoremap <C-c> :w <bar> !gcc -lm % -o %:p:h/%:t:r.out<CR>
autocmd filetype c nnoremap <C-x> :w <bar> !%:r.out < in > out<CR>
"Improved version
"autocmd filetype c nnoremap <C-c> :w <CR> <bar> !gcc -O2 % -o %:p:h/%:t:r.exe && ./%:r.exe<CR>
"autocmd filetype c nnoremap <C-c> :w <bar> !gcc -Wall -std=c99 -O2 % -o %:p.out && ./%:p:r.out<CR>>

"****************************************************************************
"
"Other Compilers
autocmd filetype java nnoremap <C-c> :w <bar> !javac % && java -enableassertions %:p <CR>
autocmd filetype python nnoremap <C-c> :w <bar> !python % <CR>
autocmd filetype perl nnoremap <C-c> :w <bar> !perl % <CR>
autocmd filetype go nnoremap <C-c> :w <bar> !go build % && ./%:p <CR>
"
"****************************************************************************
"FOR PASTING SOLUTIONS DIRECTLY
nnoremap <F12> :%y+<CR>
nnoremap <F9> :!gedit %<CR>
autocmd filetype cpp nnoremap <F4> :!%:r.exe < in<CR><CR>
autocmd filetype c nnoremap <F4> :!%:r.out < in<CR><CR>
nnoremap <F2> :normal "+gP<CR>"
"****************************************************************************
""CALL CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <space> :CtrlPBookmarkDir<CR>
"
"****************************************************************************
"SETTING FOR CF-tooL
nnoremap <F4> :!/bin/cf-paste<CR>
nnoremap <F6> :!java -jar ~/Desktop/convict-usbPC/deb_setup/Hightail-v0.9.6.jar<CR>
"
"****************************************************************************
"
"CPP template and other required functions
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.cpp 0r ~/temp.cpp
		autocmd BufNewFile *.c 0r ~/temp.c 
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
endfunction
inoremap <Tab> <C-R>=My_Tab_Completion()<CR>

:iab sep
\ /****************************************************************************/<CR>
"/****************************************************************************/
"matching paren red
autocmd BufRead,BufNewFile * syn match parens /[(){}]/ | hi parens ctermfg=red cterm=bold
