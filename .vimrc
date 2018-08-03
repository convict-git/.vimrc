"author: Priyanshu Shrivastav (mr.convict)
"git clone https://github.com/convict-git/.vimrc/blob/master/.vimrc ~/.vimrc
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

"set gfn=Ubuntu\ Mono\ 12
"set gfn=Terminus\ Medium\ 12
set gfn=Fixed\ 11
set lines=62 columns=110
set rnu
set nu
set history=500
set autoindent
set smartindent
set noswapfile
set tabstop=4
set shiftwidth=4
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
set mouse=c
set belloff=all
syntax enable
set statusline=%<%f%h%m%r%=char=%b=0x%B\ \ %l,%c%V\ %P
set t_Co=256
set cursorline
colorscheme jellybeans


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
Plugin 'alvan/vim-closetag'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ap/vim-css-color'
Plugin 'jiangmiao/auto-pairs'
Plugin 'lambdalisue/vim-fullscreen'
"for full screen ```sudo apt-get install wmctrl```

call vundle#end()

let g:cpp_concepts_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_scope_highlight = 1

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

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

"Man pages for cpp (doesn't works so nice in gvim)
"sudo apt-get install cppman
"autocmd FileType cpp set keywordprg=cppman
"****************************************************************************
"Compilers
"
autocmd filetype cpp nnoremap <C-c> :w <bar> !g++ -std=gnu++14 -DCONVICTION % -o %:p:h/%:t:r.exe && ./%:r.exe && ./%:r.exe > out<CR>
autocmd filetype cpp nnoremap <C-x> :!./%:r.exe && ./%:r.exe > out<CR>
autocmd filetype c nnoremap <C-c> :w <bar> !gcc -lm % -o %:p:h/%:t:r.out && ./%:r.out && ./%:r.out > out<CR>
autocmd filetype c nnoremap <C-x> :!./%:r.out && ./%:r.out > out<CR>
autocmd filetype javascript nnoremap <C-x> :! node %<CR>
autocmd filetype html nnoremap <C-x> :!google-chrome %<CR>
autocmd filetype java nnoremap <C-c> :w <bar> !javac % && java -enableassertions %:p <CR>
autocmd filetype python nnoremap <C-c> :w <bar> !python % <CR>
autocmd filetype perl nnoremap <C-c> :w <bar> !perl % <CR>
autocmd filetype go nnoremap <C-c> :w <bar> !go build % && ./%:p <CR>
autocmd filetype bash nnoremap <C-x> :!chmod +x % && ./%<CR>
"
"****************************************************************************
"Key bindings
"
"space for ctrlp (file explorer)
"<C-c> for compiling
nnoremap <C-k> :tabNext<CR>
"<C-l> for seeing the parameters
"<C-n> for nerdtree (file tree)
nnoremap <C-t> :tabnew<CR>
"<C-x> for running
nnoremap <F2> :normal "+gP<CR>"
nnoremap <F3> :visual "+y<CR>"
nnoremap <F5> :!./main.exe && ./main.exe > out <CR>
nnoremap <F7> :cd ~/Desktop/3xc3pt10n/3xc3pt10n <CR>
nnoremap <F8> :set lines=37 columns=81<CR>
nnoremap <F9> :!gedit %<CR>
nnoremap <F10> :source ~/.vimrc<CR> "
"<F11> for toggling toolbar and menubar
nnoremap <F12> :%y+<CR>

"****************************************************************************
"templates and other Buffer features
if has("autocmd")
  augroup templates_"
		autocmd BufEnter *.cpp,*.c colorscheme far
		autocmd BufEnter *.js,*.php,*.html,*.py,in colorscheme jellybeans
		"autocmd BufEnter *.sql,*.md colorscheme peachpuff
    autocmd BufNewFile *.cpp 0r ~/temp.cpp
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
endfunction
inoremap <Tab> <C-R>=My_Tab_Completion()<CR>

"/****************************************************************************/
"matching paren red
autocmd BufRead,BufNewFile,BufEnter * syn match parens /[(){}]/ | hi parens guifg=grey ctermfg=white cterm=bold

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
"To know the function parameters
:set cmdheight=2
nmap <C-l> :call CurrentFunc()<CR>
" side effect: register k and mark k will be changed

func! CurrentFunc()
  exec "normal mk"
  " c-type code have remarkable definitions from other OO code.
  let l:extension = expand("%:e")
  if l:extension == "c"
    exec "normal ][%b%b"
  else
    exec "?private\\|public\\|protected\\|procedure\\|function\\s\\+\.*("
  endif
  "TODO: maybe you need to open your closed fold at first
  exec "normal v$\"ky`k"
  exec "echo @k"
endfunc " CurrentFunc"
