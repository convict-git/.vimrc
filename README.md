# .vimrc and my cpp template for competitive programming
##### Features
  - Compile and run for C++, C, java, python, perl, go from editor itself by pressing **ctrl + c**
	- Run for C/C++ (given .exe or .out exist) **ctrl+x**
  - Automatically inserts the **template** file on recognizing the extension for C/C++/html(can be extended for other languages)
  - Retains cursor position for indivisual file
	- On saving a sql file yanks it automatically to the global clipboard (for testing sql queries on CLI mysql)
	- Special highlight (red) to match parenthesis
	- Line numbers and relative numbering too
	- Smart indentation
	- Automatic close tags for html files
	- Autoclose brackets and inverted commas
	- Autocomplete feature (extended for javascript) using YouCompleteMe
	- Nerdtree plugin for file tree
	- Enhanced highlighting for C/C++
	- Highlighting colors for css files

## Key-bindings
	- **space** for opening ctrl-p file explorer
  - **ctrl + k** for switching tabs
  - **ctrl + t** for new tab
  - use **tab** to auto-complete from the buffer itself
  - **F2** for pasting from the global clipboard
  - **F9** for opening the same file in gedit
  - **F10** for applying the changes in .vimrc
  - **F11** Toggling the toolbar and menu for gViM
  - **F12** for yanking everything in the buffer to clipboard so as to paste elsewhere(for example pasting into codeforces submit)

## Colorschems
	- Default colorscheme is peachpuff 
	- C/C++ : far.vim (see the colors folder)
	- JavaScript and php : slate
	- html and python : jellybeans
	- sql and markdown : peachpuff

### Installation
```ssh
https://github.com/convict-git/vim_conf.git ~/vim_conf
cd ~/vim_conf
chmod 777 install.sh
./install.sh
```
Open gvim and in normal mode type and hit enter
**:PluginInstall**

**author** _Priyanshu Shrivastav_

