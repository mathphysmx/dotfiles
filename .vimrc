"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  General (no plugins, no application-specific) configuration  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number	   "shows line number
set relativenumber 

set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
set expandtab       " expand tabs to spaces. Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
set autoindent      " Copy indent from current line when starting a new line

"http://stackoverflow.com/questions/5477565/how-to-setup-vim-properly-for-editing-in-utf-8
if has("multi_byte")
	if &termencoding == ""
		let &termencoding = &encoding
	endif
	set encoding=utf-8				" better default than latin1
	setglobal fileencoding=utf-8	" change default file encoding when writing new files
endif

" http://vi.stackexchange.com/questions/5651/how-can-i-make-vim-download-spell-files
" Dictionary English, spanish, Brazilian portuguesse
"set spell
set spelllang=en,es,pt
"let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

set history=100

" to allow the plugins turn on based on file extension
filetype plugin on
syntax enable

filetype indent on		" Automatic indentation

set clipboard=unnamedplus     "copy and paste from system clipboard. http://stackoverflow.com/questions/11489428/how-to-make-vim-paste-from-and-copy-to-systems-clipboard

set hlsearch		" highlight search matches
set showmatch " highlight matching braces
set autoread " to automatically reload modified documents

set ignorecase     " ignore case when searching
set smartcase      " case sensitive when using capitals in search phrase

" vim keybindings remapping. I use Workman keyboard layout
" navigation
noremap k j
noremap j k
" windows navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>k
nnoremap <C-k> <C-w>j
nnoremap <C-l> <C-w>l

" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i

""http://stackoverflow.com/questions/6991638/how-to-auto-save-a-file-every-1-second-in-vim
"""autocmd TextChanged,TextChangedI <buffer> silent write
"""autocmd CursorHold,CursorHoldI <buffer> silent update
""	http://vi.stackexchange.com/questions/74/is-it-possible-to-make-vim-auto-save-files
"autocmd CursorHold,CursorHoldI * update

"http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

"""""""""""""""""""""""
"  Visual appearance  "
"""""""""""""""""""""""

set guifont=Monospace\ 13
"set guifont=Font\ Awesome\ 12 " use this to see fontAwsome glyphs display
"properly
set columns=92 " window width
set mouse=a "enable mouse for NerdTree and for clickable hyperlinks
" window size, position,...
" http://stackoverflow.com/questions/594838/is-it-possible-to-get-gvim-to-remember-window-size

""""""""""""""""""""""""""""
"  Plugins configuration   "
""""""""""""""""""""""""""""

" ******** utilSnips ********
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ****** Syntastic configuration *****

" basic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" disabled checkers
let g:syntastic_enable_latex_checker = 0
let g:syntastic_enable_tex_checker = 0
let g:syntastic_tex_checkers = []
let g:syntastic_enable_xml_checker = 0

" checker ---- C
let g:syntastic_c_checkers = ["clang_tidy"]

" checker ---- C++
let g:syntastic_cpp_checkers = ["clang_check"]

" ******   DoxygenToolKit   ************** 
let g:DoxygenToolkit_briefTag_pre=""
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return "
let g:DoxygenToolkit_startCommentTag = "/**"
let g:DoxygenToolkit_startCommentBlock = "/*"
let g:DoxygenToolkit_authorName="Francisco Mendoza Torres <mentofran@gmail.com>"
let g:DoxygenToolkit_interCommentTag = "* "

" ***** unblevable/quick-scope  **********
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

" ********* rst live preview *********
let g:instant_rst_browser='firefox'

"""""""""""""
"  Plugins  "
"""""""""""""

" PLUGGIN MANAGER
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'	"let Vundle manage Vundle, required
Plugin 'jalvesaq/Nvim-R'	" r cran statistical software
Plugin 'lervag/vimtex'		" LaTeX editor
"Plugin 'rhysd/nyaovim-markdown-preview'		" .md live preview

"" snipets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" -- code check
Plugin 'scrooloose/syntastic'

" Autocompletion
Plugin 'Shougo/deoplete.nvim'
"https://www.semipol.de/2017/03/15/neovim-ipython-repl.html
Plugin 'zchee/deoplete-jedi'	"neovim with REPL
Plugin 'neomake/neomake'	"neovim with REPL
Plugin 'hkupty/iron.nvim'	"neovim with REPL
" Plugin 'ivanov/vim-ipython'
"Plugin 'bfredl/nvim-ipy'
"https://github.com/python-mode/python-mode

" Plugin 'vim-scripts/VOoM' "!!!! Requires python 2 enabled
" Plugin 'Valloric/YouCompleteMe'

Plugin 'tpope/vim-fugitive'	"git integration

" rst live preview
Plugin 'Rykka/InstantRst'
Plugin 'Rykka/riv.vim'

" Visual aids
" Highlights for faster navigation
Plugin 'unblevable/quick-scope'     " xor Vundle

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

Bundle 'DoxygenToolkit.vim'

""""""""""""""""
"  Othe stuff  "
""""""""""""""""

" VIM ISSUES
" Testing version of python. http://vimhelp.appspot.com/if_pyth.txt.html#python-2-and-3
"if has('python')
"          echo 'there is Python 2.x'
"        elseif has('python3')
"          echo 'there is Python 3.5.2'
"endif

"----- Python version
" http://vi.stackexchange.com/questions/779/how-do-i-get-vim-to-be-able-to-run-both-python-and-python3-on-a-linux-system-in
"http://stackoverflow.com/questions/10864042/how-to-check-python-version-that-vim-was-compiled-with
"http://stackoverflow.com/questions/32114378/how-to-specify-python-interpreter-version-in-vim
"https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
"----- http://stackoverflow.com/questions/9801360/install-multiple-version-of-vim-and-make-each-use-different-vimrc-file-respec

""""""""""""""""""""""""""""""""""""""""
"  Application specific configuration  "
""""""""""""""""""""""""""""""""""""""""

"" Markdown
"" http://vi.stackexchange.com/questions/9543/how-to-fold-markdown-using-the-built-in-markdown-mode
" let g:markdown_folding = 1

"" General latex instructions in vim (no plugin required)
"let g:tex_fold_enabled = 0		" folding
let g:tex_flavor='latex'
"let g:Tex_Flavor='latex'

"" LaTeX with VIMTEX pluggin
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'		"set zathura as default pdf viewer
let g:vimtex_compiler_latexmk = {
			\ 'background' : 1,
			\ 'continuous' : 1, 
			\}
let g:vimtex_quickfix_latexlog = {
			\ 'overfull' : 0,
			\ 'underfull' : 0,
			\ 'packages' : {
			\   'default' : 0,
			\ },
			\}
let g:vimtex_fold_manual=0
"" let g:vimtex_complete_close_braces 	"makes the completion include closing braces
""let g:vimtex_complete_img_use_tail	" :h vimtex-complete-images
""== :h vimtex_quickfix_latexlog

" R CRAN nvim-R
" Automatically open R. secction 9.1 of https://raw.githubusercontent.com/jalvesaq/Nvim-R/master/doc/Nvim-R.txt
autocmd FileType r if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
autocmd FileType rmd if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
autocmd FileType rnw if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
" quit R automatically when quiting Vim
autocmd VimLeave * if exists("g:SendCmdToR") && string(g:SendCmdToR) != "function('SendCmdToR_fake')" | call RQuit("nosave") | endif
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

nmap <LocalLeader>ri <Plug>RSaveClose "save on exit
syntax on
"let r_syntax_folding = 1 "folding at startup

"" c/c++ config
"" https://fatminmin.com/blog/compile-run-c-cpp-vim.html
if "cpp" == expand('%:e') || "c" == expand('%:e')
    " create doxygen comment
    map <F6> :!doxygen ../doc/<CR> 
    " compile
    noremap <F7> :! g++ -std=c++14 % -o ../bin/%< <CR>
    " execute binary
    noremap <F8> :! ../bin/%<
endif
"" https://gist.github.com/rocarvaj/2513367
"" https://github.com/wgurecky/nvim/blob/master/init.vim
