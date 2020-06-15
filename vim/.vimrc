" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

call plug#begin('~/.vim/plugins')

" vim colorscheme
Plug 'arcticicestudio/nord-vim' 
" asciidoc text editing
Plug 'habamax/vim-asciidoctor'
" automatic bracket matching
Plug 'jiangmiao/auto-pairs'
" fuzzy file finding
Plug 'junegunn/fzf.vim'
" distraciton free text editing
" Plug 'junegunn/goyo.vim'
" another vim colorscheme
Plug 'micha/vim-colors-solarized'
" efficient code search
Plug 'mileszs/ack.vim'
" enable seamless code commenting
Plug 'preservim/nerdcommenter'
" display filetree in vim split
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
" efficient text editing
Plug 'reedes/vim-pencil'
" seamless integration of vim with git
Plug 'tpope/vim-fugitive'
" efficient code block boundry management
Plug 'tpope/vim-surround'
" beautify vim statusline
Plug 'vim-airline/vim-airline'
" themes for vim airline
Plug 'vim-airline/vim-airline-themes'
" an efficient code completion engine
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

call plug#end()

" python support for neovim
let g:python_host_prog = '/Users/sidharthsharma/.pyenv/versions/py2neovim/bin/python'
let g:python3_host_prog = '/Users/sidharthsharma/.pyenv/versions/py3neovim/bin/python'

let mapleader = "\<Space>"

" Set terminal to 256 colors
set t_Co=256

" Return to the last position where the file was closed
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Enable syntax
syntax enable

" Enable syntax highlighting.
syntax on

" Switch buffers without closing them
set hidden

" Automatically indent when adding a curly bracket, etc.
set smartindent

" Tabs should be converted to a group of 4 spaces.
" This is the official Python convention
" (http://www.python.org/dev/peps/pep-0008/)
" I didn't find a good reason to not use it everywhere.
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set smartcase
" a saner ( albiet non vim ) backspace behaviour
set backspace=indent,eol,start

" Display line numbers
" set number

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=999

" Use UTF-8.
set encoding=utf-8

" Set color scheme that I like.
if has("gui_running")
    set background=light
else
    set background=dark
endif
colorscheme nord

" Set vim-airline theme
let g:airline_theme='nord'
let g:airline#extensions#tabline#enabled=1
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Status line
" set laststatus=2
" set statusline=
" set statusline+=%-3.3n\ " buffer number
" set statusline+=%f\ " filename
" set statusline+=%h%m%r%w " status flags
" set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
" set statusline+=%= " right align remainder
" set statusline+=0x%-8B " character value
" set statusline+=%-14(%l,%c%V%) " line, character
" set statusline+=%<%P " file position

" Show line number, cursor position.
set ruler

" Display incomplete commands.
set showcmd

" Search as you type.
set incsearch

" Highlight search
set hlsearch

" Ignore case when searching.
set ignorecase

" Show autocomplete menus.
set wildmenu

" Show editing mode
set showmode

" Error bells are displayed visually.
" set visualbell

" set indent based folding
set foldmethod=indent
set foldlevel=99

" NERDTree configuration
" let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeIgnore=[]
let g:NERDTreeStatusline=''
" Toggle
" Open NERDTree by default
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ycm configuration

let g:ycm_global_ycm_extra_conf='/Users/sidharthsharma/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
" 
let g:ycm_register_as_syntastic_checker=1 "default 1
let g:Show_diagnostics_ui=1 "default 1
" will put icons in Vim's gutter on lines that have a diagnostic set.
" Turning this off will also turn off the YcmErrorLine and YcmWarningLine
" highlighting
let g:ycm_enable_diagnostic_signs=1
let g:ycm_enable_diagnostic_highlighting=0
let g:ycm_always_populate_location_list=1 "default 0
let g:ycm_open_loclist_on_ycm_diags=1 "default 1
 
let g:ycm_complete_in_strings=1 "default 1
let g:ycm_collect_identifiers_from_tags_files=0 "default 0
let g:ycm_path_to_python_interpreter='' "default ''
 
let g:ycm_server_use_vim_stdout=0 "default 0 (logging to console)
let g:ycm_server_log_level='info' "default info
 
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf=1

let g:ycm_goto_buffer_command='same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist={ '*': 1 }
let g:ycm_key_invoke_completion='<C-Space>'
let g:ycm_autoclose_preview_window_after_completion=1
 
" 
" nerdcommenter
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
" let g:NERDDefaultAlign = 'left'
" let g:NERDAltDelims_java = 1
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDToggleCheckAllLines=1

" special syntax highlighting for q programming language
" hi Special ctermfg=red " for query specific keywords
" hi Underlined ctermfg=magenta cterm=bold " for local variables
set tags=tags;

" use fzf with vim
set runtimepath+=/usr/local/opt/fzf

" function! s:goyo_enter()
"     " if executable('tmux') && strlen($TMUX)
"     "     silent !tmux set status off
"     "     silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
"     " endif
"     set noshowmode
"     set noshowcmd
"     set spell
"     set complete+=kspell
"     " ...
"     "
"     let b:quit = 0
"     let b:quit_bang = 0
"     autocmd QuitPre <buffer> let b:quit = 1
"     cabbrev <buffer> q! let b:quit_bang = 1 <bar> q!
"     " vim-pencil on
"     " Pencil
" endfunction
" 
" function! s:goyo_leave()
"     " if executable('tmux') && strlen($TMUX)
"     "     silent !tmux set status on
"     "     silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
"     " endif
"     set showmode
"     set showcmd
"     set nospell
"     set complete-=kspell
"     " ...
"     if b:quit && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
"         if b:quit_bang
"             qa!
"         else
"             qa
"         endif
"     endif 
"     " vim-pencil off
"     " PencilOff 
" endfunction
" 
" autocmd User GoyoEnter nested call <SID>goyo_enter()
" autocmd User GoyoLeave nested call <SID>goyo_leave()
"
function! s:enter_writer_space()
    set noshowmode
    set noshowcmd
    setlocal spell
    setlocal complete+=kspell
    " ...
    "
    " vim-pencil on
    set number relativenumber
    " ignore trailing #.* characters in jumping to file with gf
    set isfname-=#
    endfunction

function! s:exit_writer_space()
    set showmode
    set showcmd
    setlocal nospell
    setlocal complete-=kspell
    " ...
    " vim-pencil off
    set invnumber invrelativenumber
    " resest to searching file with # in name
    set isfname+=#
endfunction

augroup writers_space
    autocmd!
    autocmd BufNewFile,BufReadPre,BufEnter *.markdown,*.mkd,*.md,*.text,*.txt,*.asciidoc,*.adoc call <SID>enter_writer_space()
    autocmd BufNewFile *.asciidoc,*.adoc 0r ~/.vim/templates/asciidoc.template
    autocmd BufLeave *.markdown,*.mkd,*.md,*.text,*.txt,*.asciidoc,*.adoc call <SID>exit_writer_space()
augroup END

" load language specific configurations
" python
" autocmd bufenter *.py :source ~/.vim/filetypes/python.vim

" custom mappings
" toggle hybrid line numbering
nnoremap <leader>n :set invnumber invrelativenumber<CR>
" toggle nerd tree ( turn the file [t]ree on/off )
nnoremap <leader>t :NERDTreeToggle<CR>
" youcompleteme go to [d]efinitions
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
" search in source code
nnoremap <C-f> :Ack!<Space>
" fuzzy file find
nnoremap <C-p> :Files<CR>
" get youcompleteme diagnostics
nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>
" buffer navigation mappings
" goto previous buffer
nnoremap bp :bp<CR>
" goto next buffer
nnoremap bn :bn<CR> " list all buffers and input buffer to navigate to on prompt 
" list buffer and wait for user input to navigate
nnoremap bs :ls<CR>:b<Space>
