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
- Removes trailing whitespaces

### Key-bindings
- **space** for opening ctrl-p file explorer
- **ctrl + k** for switching tabs
- **ctrl + t** for new tab
- use **tab** to auto-complete from the buffer itself
- **F2** for pasting from the global clipboard
- **F9** for opening the same file in gedit
- **F10** for applying the changes in .vimrc
- **F11** Toggling the toolbar and menu for gViM
- **F12** for yanking everything in the buffer to clipboard so as to paste elsewhere(for example pasting into codeforces submit)

### Colorschems
- Default colorscheme is peachpuff 
- C/C++ : far.vim (see the colors folder)
- JavaScript and php : slate
- html and python : jellybeans
- sql and markdown : peachpuff

### Installation

```ssh
git clone https://github.com/convict-git/.vimrc.git ~/vim_conf
cd ~/vim_conf
chmod 777 install.sh
./install.sh
```
Open gvim and in normal mode type and hit enter

**:PluginInstall**

### Screenshots
![cp](https://user-images.githubusercontent.com/34399448/43029496-6905210a-8ca4-11e8-9077-fe789462ab28.png)
![screenshot from 2018-07-21 04-58-38](https://user-images.githubusercontent.com/34399448/43029497-696967fa-8ca4-11e8-9ae7-64b74335b912.png)
![screenshot from 2018-07-21 05-14-11](https://user-images.githubusercontent.com/34399448/43029565-0a1c833a-8ca5-11e8-88cc-8b853583f1be.png)
![screenshot from 2018-07-21 04-59-54](https://user-images.githubusercontent.com/34399448/43029498-69c6fc4e-8ca4-11e8-9746-c18f2fac8536.png)
![screenshot from 2018-07-21 05-04-18](https://user-images.githubusercontent.com/34399448/43029499-6a23e5d0-8ca4-11e8-8447-0f53db827eed.png)
![screenshot from 2018-07-21 05-05-06](https://user-images.githubusercontent.com/34399448/43029500-6a869dba-8ca4-11e8-96e5-24e8326d060c.png)
![screenshot from 2018-07-21 05-05-52](https://user-images.githubusercontent.com/34399448/43029501-6aef8744-8ca4-11e8-8eed-62ad951ed48d.png)


**author** _Priyanshu Shrivastav_

