set nu
set expandtab
set relativenumber
set sw=2
set sts=2
let g:fuzzy_ignore = "gems/*"
set nocompatible
filetype off
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/syntastic'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'tpope/vim-rails'
Plug 'slim-template/vim-slim'
Plug 'isRuslan/vim-es6'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'elixir-lang/vim-elixir'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'wakatime/vim-wakatime'
Plug 'sebdah/vim-delve'
Plug 'posva/vim-vue'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-haml'
Plug 'styled-components/vim-styled-components'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'junegunn/goyo.vim'
call plug#end()
syntax enable
filetype plugin indent on
imap <F2> <Esc>:w<CR>
map <F2> <Esc>:w<CR>
imap <F3> <Esc>:q!<CR>
map <F3> <Esc>:q!<CR>
imap <F4> <Esc>:wq<CR>
map <F4> <Esc>:wq<CR>
imap <silent> <F5> <Esc>:noh<CR>
map <F5> <Esc>:noh<CR>
imap <F6> <Esc>:%d_ <CR>
map <F6> <Esc>:%d_ <CR>
imap <F7> <Esc>:FZF<CR>
map <F7> <Esc>:FZF<CR>
imap <F8> <Esc>:new<CR>:FZF<CR>
map <F8> <Esc>:new<CR>:FZF<CR>
nmap <F9> <Esc>:CarbonNowSh<CR>:CarbonNowSh<CR>
vmap <F9> <Esc>:CarbonNowSh<CR>:CarbonNowSh<CR>
map <C-p> :NERDTreeToggle<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
let g:neocomplete#enable_at_startup = 2
au BufRead,BufNewFile *.thor set syntax=ruby
au BufRead,BufNewFile *.simplecov set syntax=ruby
au BufRead,BufNewFile *.gemfile set syntax=ruby
au BufRead,BufNewFile *.axlsx set syntax=ruby
au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile *.vue set filetype=javascript
au BufRead,BufNewFile *.vue set syntax=javascript
au BufRead,BufNewFile *.babelrc set syntax=javascript
au BufRead,BufNewFile *.go set tabstop=2
au BufRead,BufNewFile Makefile set tabstop=2
au BufRead,BufNewFile Dockerfile* set syntax=dockerfile
au BufRead,BufNewFile .eslintrc set syntax=json
au BufRead,BufNewFile *.tsx set syntax=typescript
au BufRead,BufNewFile *.erdconfig set syntax=yaml
au BufRead,BufNewFile *.hbs set syntax=html
au BufNewFile,BufRead * if &syntax == '' | set syntax=sh | endif
au BufNewFile,BufRead template/*.rb set filetype=eruby
au BufRead,BufNewFile *.rb.tt set syntax=eruby
autocmd FileType vue noremap <buffer> <C-f> :%!vue-formatter<CR>
set hlsearch
if has("autocmd")
    autocmd FileType ruby set complete+=k/home/pavel/.vim/complete/custom.vim
endif " has("autocmd")
let g:deoplete#enable_at_startup = 1
autocmd FileType go set noexpandtab
set clipboard=unnamedplus
let g:codegpt_openai_api_key = $OPENAI_API_KEY
