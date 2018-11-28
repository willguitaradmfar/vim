set encoding=utf-8
set number
set termguicolors!
syntax on

" invisible chars
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:.

" swap files far away from the project folders
set directory=$HOME/.vim/swapfiles//

" column markers
set cc=120

" fugitive
set diffopt+=vertical


let g:javascript_plugin_flow = 1

" VimPlug - Plugins
call plug#begin('~/.vim/plugged')

" autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugin' }
else
  Plug 'valloric/youcompleteme', { 'do': './install.py --tern-completer' }
endif

Plug 'arcticicestudio/nord-vim'
Plug 'kien/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'lepture/vim-velocity'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'maksimr/vim-jsbeautify'
Plug 'sirver/ultisnips'
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-unimpaired'
Plug 'jgallen23/runcode.vim'
Plug 'ervandew/ag'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'

call plug#end()

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set wildignore+=*/node_modules/*,*/dist/*,*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\node_modules\\*,*\\dist\\*,*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|node_modules)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:deoplete#enable_at_startup = 1

let g:airline#extensions#tabline#enabled = 1

colorscheme nord

if !has('nvim')
  " Salva quando fecha e carrega os trechos colapsados de cada arquivo quando
  " abre
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent loadview 
endif

nnoremap <C-B> :NERDTreeToggle<CR>

nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 10gt

nnoremap <C-t>     :tabnew<CR>:NERDTree<CR>
nnoremap <C-q>     :tabclose<CR>

nnoremap <F5>     :!npm start


nnoremap <C-j>     :cn<CR> :NERDTreeFind %<CR> <C-w>w
nnoremap <C-k>     :cp<CR> :NERDTreeFind %<CR> <C-w>w
nnoremap <C-h>     :Ag 