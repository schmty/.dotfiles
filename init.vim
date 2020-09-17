" Plugins
call plug#begin('~/.config/nvim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'phanviet/vim-monokai-pro'
  Plug 'jiangmiao/auto-pairs'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-surround'
  Plug 'junegunn/goyo.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'scrooloose/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'airblade/vim-gitgutter'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
call plug#end()

set shell=/bin/sh
" Alignment Indentation & basic formatting
  set shiftwidth=2
  set tabstop=2
  set expandtab
  set foldmethod=indent
  set foldnestmax=10
  set foldlevel=2
  set nofoldenable
  set wrap
  set linebreak
  set nolist
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  " remove trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e

  " wildignore and other ignores
  set wildignore=node_modules/
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


" syntax and colorscheme
  syntax on
  filetype plugin on
  set termguicolors
  set number
  set relativenumber
  set background=dark
  colorscheme gruvbox

" general mappings
  let g:mapleader = "\<Space>"
  imap fd <Esc>
  nmap L $
  nmap H 0
  vmap L $
  vmap H 0
  nnoremap <Leader>w :w<CR>
  nnoremap <Leader>q :q!<CR>
  nnoremap <Leader>x :x<CR>
  nnoremap <Leader>rc :e ~/.config/nvim/init.vim<CR>
  nnoremap <Leader>rl :w<CR>:so %<CR>
  nnoremap <Leader>pi :PlugInstall<CR>
  nnoremap <Leader>pc :PlugClean<CR>
  nnoremap <Leader>co :Codi<CR>
  nnoremap <Leader>ls :ls<CR>
  nnoremap <Leader>sp :SpToggle<CR>
  nnoremap <Leader>spl :SpNext<CR>
  nnoremap <Leader>sph :SpPrevious<CR>
  nnoremap <silent> <Leader>z :Goyo<CR>
  nnoremap <silent> <Leader>nt :NERDTreeToggle<CR>
  nmap <silent> <leader>d <Plug>DashSearch

" nerdtree config
let NERDTreeShowHidden=1

" airline config
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1

" Python config
  let g:python_host_prog="/Users/jake/.pyenv/versions/neovim2/bin/python"
  let g:python3_host_prog="/Users/jake/.pyenv/versions/neovim3/bin/python"

" ctags stuff
  " - Use ^] to jump to tag under cursor
  " - Use g^] for ambiguous tags
  " - Use ^t to jump back up the tag stack
  command! MakeTags !ctags -R .

" AUTOCOMPLETE NOTES
  " While ncm2 is nice vim/neovim includes a lot of nice shortcuts
  " - ^x^n for JUST autocomplete in the file
  " - ^x^f for filenames
  " - ^x^] for tags only
  " - ^n for anything specified by the 'complete' option list

" coc config
let g:coc_blobal_extensions = [
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-json',
      \ 'coc-emmet',
      \ ]
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" Use <c-space> to trigger completion.


" snippet stuff
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Using CocList
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" easy tags config
let g:easytags_syntax_keyword = 'always'

" tree sitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

" control p for Files and FZF config
nnoremap <leader>s :<C-u>Files<CR>

