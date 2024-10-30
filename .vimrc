set nocompatible           " Vim defaults rather than vi ones. Keep at top.
filetype plugin indent on  " Enable filetype-specific settings.
syntax on                  " Enable syntax highlighting.
set backspace=2            " Make the backspace behave as most applications.
set autoindent             " Use current indent for new lines.
set display=lastline       " Show as much of the line as will fit.
set expandtab              " Use spaces instead of tabs for indentation.
set smarttab               " Backspace removes 'shiftwidth' worth of spaces.
set number                 " Show line numbers.
set nowrap                   " Wrap long lines.
set laststatus=2           " Always show the statusline.
set ruler                  " Show the ruler in the statusline.
set hlsearch               " Highlight the last used search pattern.
set ignorecase             " Searching with / is case-insensitive.
set smartcase              " Disable 'ignorecase' if the term contains upper-case.
set tabstop=4              " Size of a Tab character.
set shiftwidth=4           " Use same value as 'tabstop'.
set softtabstop=-1         " Use same value as 'shiftwidth'.
set relativenumber
set background=dark

colorscheme slate

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#LineNr#
set statusline+=\ %f

let mapleader=" "
nnoremap <SPACE> <Nop>

map <Leader>h :nohl<cr>
map <Leader>e :Lexplore 30<cr>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

command Comment execute ":normal I#"
command Uncomment execute ":normal F#x"

map <Leader>c :Comment<cr>
map <Leader>cc :Uncomment<cr>
