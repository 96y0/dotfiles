syntax on
set number
set expandtab
set shiftwidth=2
set tabstop=2
set ignorecase
set smartcase
set guifont=MesloLGS\ NF\ 12
set updatetime=100
set encoding=utf-8
set t_Co=256
set cursorline
set termguicolors
set laststatus=2
set background=dark
set mouse=a

call plug#begin('~/.vim/plugged')
Plug 'vim-test/vim-test'
Plug 'itchyny/lightline.vim' " Statusline
Plug 'derekwyatt/vim-protodef'
Plug 'sheerun/vim-polyglot'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'preservim/tagbar' " Tagbar
Plug 'mhinz/vim-signify'
Plug 'preservim/nerdtree' " NerdTree
Plug 'lunarwatcher/auto-pairs' " Auto-pairs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/goyo.vim'
Plug 'puremourning/vimspector'
Plug 'morhetz/gruvbox'
call plug#end()

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" fzf settings
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }

let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
let g:vimspector_enable_mappings = 'HUMAN'

" NerdTree keymap
nmap <leader>n :NERDTreeFocus<CR>
nmap <C-n>     :NERDTreeToggle<CR>
nmap <C-f>     :NERDTreeFind<CR>
nmap <F8>      :TagbarToggle<CR>

" compile C code
nmap   <silent>   <leader>r  :!gcc % -o %< && ./%<<CR>

" move lines
nmap <c-j> :m .+1<cr>==
nmap <c-k> :m .-2<cr>==
imap <c-j> <esc>:m .+1<cr>==gi
imap <c-k> <esc>:m .-2<cr>==gi
vmap <c-j> :m '>+1<cr>gv=gv
vmap <c-k> :m '<-2<cr>gv=gv

nmap <c-s> :w<CR>
nmap <c-p> :Explore<CR>

" Vim-test keymaps
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

imap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Pull in prototypes 
nmap <buffer> <silent> <leader> ,PP
" Pull in prototypes without namespace definition" 
nmap <buffer> <silent> <leader> ,PN

nmap <c-f> :FZF<CR>

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame
nmap <LocalLeader>B     <Plug>VimspectorBreakpoints
nmap <LocalLeader>D     <Plug>VimspectorDisassemble

let g:gruvbox_italic=1
colorscheme gruvbox

let g:lightline = {'colorscheme': 'gruvbox'}
