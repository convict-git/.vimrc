"font Terminus Medium
"Bash colorscheme Linux Console
"Bash bgcolor = #090325

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
syntax enable
set statusline=%<%f%h%m%r%=char=%b=0x%B\ \ %l,%c%V\ %P
colorscheme convict

set cursorline 
autocmd InsertEnter * highlight CursorLine ctermbg=black cterm=bold gui=reverse
autocmd InsertLeave * highlight CursorLine ctermbg=black cterm=bold 

set cursorcolumn
autocmd InsertEnter * highlight CursorColumn ctermfg=White ctermbg=Black cterm=bold 
autocmd InsertLeave * highlight CursorLine ctermbg=White ctermbg=Black cterm=bold 

"****************************************************************************
"SWITCHING between tabs
nnoremap <C-k> :tabNext<CR>

"****************************************************************************
set nocompatible              " be iMproved, required
filetype off                  " required

"""VUNDLE-VIM Plugin Manager"""
"Git clone the vundle
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
"PLUGIN SETTINGS
filetype plugin indent on    " required
"*****WARNING DO NOT CHANGE THE POSITION OF THE ABOVE LINE*****
"It f*cks off the syntax highlighting
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Keep Plugin commands between vundle#begin/end.
Plugin 'VundleVim/Vundle.vim'
"Plugin 'tpope/vim-fugitive'
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'tpope/vim-vinegar'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Igorjan94/codeforces.vim'
Plugin 'Shougo/neocomplete.vim'

"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
"****************************************************************************
"
"""SETTINGS FOR HIGHLIGHT
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_scope_highlight = 1

"****************************************************************************
"SETTING FOR SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 1
"****************************************************************************
"
"SETTING FOR NEOCOMPLETE
"
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"****************************************************************************
"
""CALL NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

"****************************************************************************
"
""Compiler_g++(convict-git) ;)
"nnoremap <C-c> :!g++ -std=c++11 % -Wall -Werror -g -o %.out && chmod +x %.out && ./%.out<CR>
"Improved version
"Compile single cpp file without any non-standart headers
autocmd filetype cpp nnoremap <C-c> :w <bar> !g++ -Wall -g -std=c++11 -O2 % -o %:p:h/%:t:r.out && ./%:r.out < in<CR>
autocmd filetype cpp nnoremap <C-x> :w <bar> !g++ -Wall -g -std=c++11 -O2 % -o %:p:h/%:t:r.out && ./%:r.out<CR>
"Compilation in case when own header files are included 
autocmd filetype cpp nnoremap <F10> :wall <bar> !g++ -Wall -g -std=c++11 -O2 %:p:h/*.cpp -o %:p:h/%:p:h:t.out && ./%:r.out<CR>

"****************************************************************************
""Compiler_gcc(convict-git) ;)
"nnoremap <C-c> :!gcc -std=c99 % -Wall -Werror -o %.out && chmod +x %.out && ./%.out <CR>
"Improved version
autocmd filetype c nnoremap <C-c> :w <bar> !gcc -Wall -std=c99 -O2 % -o %:p.out && ./%:p:r.out<CR>

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
"****************************************************************************
""CALL CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <space> :CtrlPBookmarkDir<CR>
"
"****************************************************************************
"SETTING FOR CF-tooL
autocmd filetype cpp nnoremap <F2> :read ~/Desktop/convict-usbPC/code/vimrc/testcase.cpp<CR>
autocmd filetype cpp nnoremap <F5> :w <bar> !/bin/cf-tool %<CR>
nnoremap <F3> :!gedit ~/Desktop/convict-usbPC/code/vimrc/inp_out.txt<CR>
nnoremap <F4> :!/bin/cf-paste<CR>
nnoremap <F6> :!java -jar ~/Desktop/convict-usbPC/deb_setup/Hightail-v0.9.6.jar<CR>
"
"****************************************************************************
"
"CPP template and other required functions
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.cpp 0r ~/Desktop/convict-usbPC/code/vimrc/cpptemplate.cpp 
  augroup END
endif

autocmd filetype cpp nnoremap <F7> :read ~/Desktop/convict-usbPC/code/vimrc/printVec.cpp<CR>
"****************************************************************************
"
"Cursor retains the position
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
		 \ endif
"****************************************************************************
function! My_Tab_Completion()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-P>"
    else
        return "\<Tab>"
endfunction
inoremap <Tab> <C-R>=My_Tab_Completion()<CR>
:iab sep
\ /****************************************************************************/<CR>
autocmd BufRead,BufNewFile * syn match parens /[(){}]/ | hi parens ctermfg=red cterm=bold

