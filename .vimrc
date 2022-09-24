"""""""""""""""" Install plug if not already installed """""""""""""""""""""""""""""

let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"""""""""""""""" Install plug if not already installed """""""""""""""""""""""""""""

"""""""""""""""" Load vim plugins """""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Colorscheme
if has('nvim')
  Plug 'ellisonleao/gruvbox.nvim'
else
  Plug 'gruvbox-community/gruvbox'
endif

" Syntax highlight
if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
else
  Plug 'sheerun/vim-polyglot'
endif

" Fuzzy finder 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Tags manager
Plug 'ludovicchabant/vim-gutentags'

" Intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Git integration manager
Plug 'tpope/vim-fugitive'

" Quote/Paranthesis manager
Plug 'tpope/vim-surround'

" Statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

" Comment manager
Plug 'preservim/nerdcommenter'

" Symbols/Tags sidebar
Plug 'liuchengxu/vista.vim'

" Snippets manager
Plug 'honza/vim-snippets'

call plug#end()

"""""""""""""""" Load vim plugins """""""""""""""""""""""""""""


if has('nvim')
"""""""""""""""" Treesitter configurations """""""""""""""""""""""""""""

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "cmake", "html", "css", "javascript", "json", "jsonc", "gitignore", "python", "vim", "yaml", "bash" } ,
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
EOF

" lua <<EOF
" require'nvim-treesitter.configs'.setup {
  " indent = {
    " enable = true
  " }
" }
" EOF

"""""""""""""""" Treesitter configurations """""""""""""""""""""""""""""
endif



"""""""""""""""" Miscellaneous vim settings """""""""""""""""""

set encoding=utf-8

set termguicolors

if !has('nvim')
  syntax on
endif

filetype plugin on

if has('nvim')
  set foldmethod=expr
  set foldexpr=nvim_treesitter#foldexpr()
else
  set foldmethod=indent
endif
set nofoldenable
set foldlevel=99

" jump to the tag if there's only one match or show list if there are multiple matches
nnoremap <C-]> g<C-]>

" open new split panes to right and below
set splitright
set splitbelow

" For enabling mouse and line numbers
set mouse=a
set number

" Smart case search
set ignorecase
set smartcase

" For incremental search & highlight
set incsearch
set hlsearch
if has('nvim')
  nnoremap <silent> <esc> :noh<cr><esc>
else
  nnoremap <silent> \/ :noh<CR>
endif

" Spacing and tab
autocmd Filetype javascript,html setlocal tabstop=2 shiftwidth=2
autocmd Filetype cpp setlocal tabstop=4 shiftwidth=4
set expandtab
set bs=2
autocmd FileType make setlocal noexpandtab softtabstop=0 

" Set filetype of files not recognized automatically
autocmd BufNewFile,BufRead .clangd setfiletype yaml

" use alt+hjkl to move between split/vsplit panels
tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" map <F3> and <S-F3> to jump between locations in a quickfix list, or
" differences if in window in diff mode
nnoremap <expr> <silent> <F4>   (&diff ? "]c" : ":cnext\<CR>")
nnoremap <expr> <silent> <F3> (&diff ? "[c" : ":cprev\<CR>")

"""""""""""""""" Miscellaneous vim settings """""""""""""""""""



""""""""""""""""""""""" Gutentags settings """"""""""""""""""""

let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', 'pipfile', 'requirements.txt', '.git', 'CMakeLists.txt']
let g:gutentags_ctags_extra_args = [
\ '--tag-relative=yes',
\ '--fields=+ailmnS',
\]
let g:gutentags_ctags_exclude = [
\ '*.git', '*.svg', '*.hg',
\ '*/tests/*',
\ 'build', 'dist', 'bin', 'node_modules', 'bower_components', 'cache', 'compiled', 'docs', 'example', 'bundle', 'vendor',
\ '*sites/*/files/*',
\ '*.md',
\ '*-lock.json', '*.lock',
\ '*bundle*.js', '*build*.js',
\ '.*rc*',
\ '*.json',
\ '*.min.*',
\ '*.map',
\ '*.bak',
\ '*.zip',
\ '*.pyc',
\ '*.class',
\ '*.sln',
\ '*.Master',
\ '*.csproj', '*.csproj.user',
\ '*.tmp',
\ '*.cache',
\ '*.vscode',
\ '*.pdb',
\ 'tags*',
\ 'cscope.*',
\ '*.css',
\ '*.less',
\ '*.scss',
\ '*.exe', '*.dll', '*.bin',
\ '*.mp3', '*.ogg', '*.flac',
\ '*.swp', '*.swo',
\  '.DS_Store', '*.plist',
\ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
\ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
\ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
\ '*.txt'
\]

""""""""""""""""""""""" Gutentags settings """"""""""""""""""""



""""""""""""""""""""""" Airline settings """"""""""""""""""""""

let g:airline#extensions#hunks#coc_git = 1
let g:airline_theme='dark'

""""""""""""""""""""""" Airline settings """"""""""""""""""""""



""""""""""""""""""""""" FZF settings """""""""""""""""""""""""

nnoremap <F5> :Rg<CR>
"nnoremap rg :Rg <C-R><C-W><CR>
vnoremap rg y :Rg <C-R>"<CR>
nnoremap <Leader>T :BTags<CR>
nnoremap <Leader>t :Tags<CR>

""""""""""""""""""""""" FZF settings """""""""""""""""""""""""



""""""""""""""""""""""" Nerdcommenter settings """"""""""""""" 

let g:NERDSpaceDelims = 1

""""""""""""""""""""""" Nerdcommenter settings """"""""""""""" 



""""""""""""""""""""""" Vista settings """""""""""""""""""""""

nmap <F8> :Vista!!<CR>
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1

""""""""""""""""""""""" Vista settings """""""""""""""""""""""



"""""""""""""""" COC Settings """""""""""""""""""""""""""""""""

let b:coc_root_patterns = ['package.json', 'pipfile', '.git', '.env', 'CMakeLists.txt']

let g:coc_global_extensions = [
\'coc-markdownlint',
\'coc-highlight',
\'coc-pyright',
\'coc-explorer',
\'coc-json', 
\'coc-yank',
\'coc-tabnine',
\'coc-snippets',
\'coc-prettier',
\'coc-lists',
\'coc-explorer',
\'coc-eslint',
\'coc-cssmodules',
\'coc-actions',
\'coc-yaml',
\'coc-vimlsp',
\'coc-tsserver',
\'coc-html',
\'coc-css',
\'coc-clangd',
\'coc-cmake',
\'coc-git',
\'coc-react-refactor',
\'coc-jest',
\]

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap<tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[d` and `]d` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Search workspace files.
nnoremap <silent><nowait> <C-p> :<C-u>CocList files<CR>
" Grep in workspace files.
nnoremap <silent><nowait> <space>g  :<C-u>CocList -I grep -S -F<cr>
" Grep word under cursor with interactive mode
nnoremap <silent><nowait> rg :exe 'CocList -I --input='.expand('<cword>').' grep -e'<CR>
" Search workspace tags
nnoremap <silent><nowait> <space>t :<C-u>CocList tags<CR>

" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"Show yank history
nnoremap <silent><nowait> <space>y  :<C-u>CocList -A --normal yank<cr>
"Show explorer
nnoremap <silent><nowait> <space>x  :<C-u>CocCommand explorer<CR>

" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)
" Undo current chunk
nnoremap gu :<C-u>CocCommand git.chunkUndo<CR>

" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')
" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])
" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>
" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')

" TODO: Fix below shortcuts
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

"""""""""""""""""""""""" COC Settings """""""""""""""""""""""""



"""""""""""""""""""""""" Terminal Settings """"""""""""""""""""

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open hsplit/vsplit terminal on ctrl+n/shift-n
function! OpenHTerminal()
  split term://zsh
  resize 15
endfunction
function! OpenVTerminal()
  vsplit term://zsh
endfunction
nnoremap <C-n> :call OpenHTerminal()<CR>
nnoremap <M-n> :call OpenVTerminal()<CR>

"""""""""""""""""""""""" Terminal Settings """"""""""""""""""""


"""""""""""""""""""""""" Neo vim provider settings """"""""""""

let g:python3_host_prog='/usr/bin/python3'

"""""""""""""""""""""""" Neo vim provider settings """"""""""""



"""""""""""""""""""""""" Apply colorscheme """"""""""""""""""""

set background=dark
colorscheme gruvbox
" autocmd vimenter * ++nested colorscheme gruvbox

"""""""""""""""""""""""" Apply colorscheme """"""""""""""""""""
