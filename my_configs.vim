colorscheme snazzy
let g:lightline = {
\ 'colorscheme': 'snazzy',
\ 'active': {
\ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
\   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ],
\  }
\ }
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
let g:terminal_ansi_colors = [
                \ "#373c40", "#ff5454", "#8cc85f", "#e3c78a",
                \ "#80a0ff", "#ce76e8", "#7ee0ce", "#de935f",
                \ "#f09479", "#f74782", "#42cf89", "#cfcfb0",
                \ "#78c2ff", "#ae81ff", "#85dc85", "#e2637f"
                \]
setlocal foldmethod=manual
set nocompatible
set mouse=a
set number
set foldlevel=99999
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

highlight clear SpellBad
highlight SpellBad ctermfg=0 ctermbg=217

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
