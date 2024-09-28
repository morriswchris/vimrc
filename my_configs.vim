colorscheme dracula
let g:lightline = {
\ 'colorscheme': 'snazzy',
\ 'active': {
\ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
\   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ],
\  }
\ }
let g:terminal_ansi_colors = [
                \ "#373c40", "#ff5454", "#8cc85f", "#e3c78a",
                \ "#80a0ff", "#ce76e8", "#7ee0ce", "#de935f",
                \ "#f09479", "#f74782", "#42cf89", "#cfcfb0",
                \ "#78c2ff", "#ae81ff", "#85dc85", "#e2637f"
                \]

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

if &term =~ "screen"
    let &t_BE = "\e[?2004h"
    let &t_BD = "\e[?2004l"
    exec "set t_PS=\e[200~"
    exec "set t_PE=\e[201~"
endif

""""""""""""""""""""""""""""""
" => FZF
""""""""""""""""""""""""""""""
set rtp+=/opt/homebrew/opt/fzf
let g:ctrlp_map = ''
nnoremap <C-f> :Files<Cr>
nmap <Leader>o :Buffers<CR>
nnoremap <Leader>g :Rg<CR>
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_preview_window = []

" setlocal foldmethod=manual
set nocompatible
set mouse=a
set number
set foldlevel=20
set shiftwidth=2
set tabstop=2
set nofoldenable
set cursorline
set termguicolors
set guioptions+=k
let &t_8f = "\e[38;2;%lu;%lu;%lum"
let &t_8b = "\e[48;2;%lu;%lu;%lum"
map <Leader>d :bufdo bd!<CR>
map <C-W>` gg=G<C-o><C-o>
autocmd FileType vue syntax sync fromstart

filetype plugin on
syntax on


function! SetVimScriptConfig(index, path)
  return {'syntax': 'markdown', 'ext': '.md', 'path': a:path}
endfunction

let vim_wiki_default_config = {'syntax': 'markdown', 'ext': '.md'}
let vim_wiki_config = [vim_wiki_default_config] 

if $VIM_WIKI_PATHS != ""
  let vim_wiki_config = []
  let vim_wiki_paths = split($VIM_WIKI_PATHS, ",")
  let  vim_wiki_config = map(vim_wiki_paths, function("SetVimScriptConfig"))
endif
let g:vimwiki_list = vim_wiki_config

" imap <silent><script><expr> <C-g> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true

let b:copilot_enabled = v:false
let g:codeium_no_map_tab = 1
imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <C-e>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-r>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x>   <Cmd>call codeium#Clear()<CR>
map <Leader>a <Cmd>call codeium#Chat()<CR>

highlight clear SpellBad
highlight clear SpellLocal
highlight clear SpellRare
highlight clear SpellCap
hi SpellBad cterm=underline  gui=Undercurl ctermbg=103  guibg=#8787af
hi SpellLocal cterm=underline gui=Undercurl ctermbg=103  guibg=#8787af
hi SpellRare cterm=underline gui=Undercurl ctermbg=103  guibg=#8787af
hi SpellCap cterm=underline  gui=Undercurl ctermbg=103  guibg=#8787af

