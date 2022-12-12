call plug#begin('~/.vim/plugged')
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
" Tools
Plug 'junegunn/goyo.vim'
Plug 'vifm/vifm.vim'
Plug 'junegunn/limelight.vim'
Plug 'ctrlpvim/ctrlp.vim'
" Syntax
Plug 'tpope/vim-markdown'
Plug 'ap/vim-css-color' "Displays a preview of colors with CSS 
Plug 'vim-scripts/fountain.vim'
" Color-schemes
Plug 'morhetz/gruvbox' "My favorite theme
call plug#end()

"General Settings
set encoding=UTF-8
filetype plugin indent on  "Enabling Plugin & Indent
syntax on  "Turning Syntax on
set autoread wildmode=longest,list,full
set spell spelllang=en_us
set backspace=indent,eol,start confirm
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab  
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set hls is ic
set laststatus=2 cmdheight=1
au BufRead,BufNewFile *.fountain set filetype=fountain
set splitbelow splitright 
set nobackup nowritebackup

"Color Settings

colorscheme gruvbox
"let g:gruvbox_contrast_dark = 'hard'
"let g:gruvbox_invert_tabline = 1
"let g:background_transparent_bg = 1
set background=dark cursorline 
hi clear Cursorline
set termguicolors

hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

"Goyo settings
function! s:goyo_enter()
    set noshowmode
    set noshowcmd
    set nocursorline
    CocDisable
    Limelight
endfunction

function! s:goyo_leave()
    set showmode
    set showcmd
    set cursorline
    CocEnable
    Limelight!
endfunction

"Airline Theme
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

syntax enable   
set number relativenumber
let g:rehash256 = 1
set clipboard=unnamedplus

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

" Minimum setting for deoplte
let g:deoplete#enable_at_startup = 1

" Keymapping

" ESC
inoremap jk <Esc>
inoremap kj <Esc>

" Alternative way to save
noremap <C-s> :w<CR>
" Alternative way to quit
noremap <C-Q> :wq!<CR>

