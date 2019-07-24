" Plugins
call plug#begin('~/.config/nvim/plugged')
  Plug 'jiangmiao/auto-pairs'
  Plug 'morhetz/gruvbox'
  Plug 'mattn/emmet-vim'
  Plug 'metakirby5/codi.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'w0rp/ale'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-surround'
  Plug 'junegunn/goyo.vim'
  Plug 'moll/vim-node'
  Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
  Plug 'othree/yajs.vim'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'HendrikPetertje/vimify'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
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
  nmap <CR> G
  nmap <BS> gg
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
  nmap <silent> <leader>d <Plug>DashSearch

" Ale ESLint and Prettier Config
  let g:ale_sign_error = '❌'
  let g:ale_sign_warning = '⚠️'
  highlight clear ALEErrorSign
  highlight clear ALEWarningSign


" airline config
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1

" Python config
  let g:python_host_prog="/Users/jake/.pyenv/versions/neovim2/bin/python"
  let g:python3_host_prog="/Users/jake/.pyenv/versions/neovim3/bin/python"

" fuzzy finding settings
  "set path+=**
  "set wildignore+=**/node_modules/**
  "set wildmenu
  nnoremap <C-p> :Files .<CR>

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

" netrw stuff
  let g:netrw_banner=0 " disable annoying netrw banner
  let g:netrw_liststyle=3 " tree view
" coc config
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
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
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
