" vim:foldmethod=marker

"" [N] <leader>.f -- Jump: to a character above [easymotion]
"" [N] <leader>.F -- Jump: to a character below [easymotion]

if exists(':NERDTreeFind')
  nnoremap - :NERDTreeFind<CR>
endif

if exists(':GFiles')
  "" [N] <C-p> -- Project: open file [fzf]
  nnoremap <C-p> :FZF<cr>
endif
" }}}

if has("nvim")
  " :h terminal-emulator-input
  tnoremap <C-]> <C-\><C-n>
  tnoremap <C-[> <C-\><C-n>
endif

if exists(':Ag')
  nnoremap <leader>/ :Ag<CR>
  nnoremap <leader>* :Ag <C-r><C-w><CR>
  vnoremap <leader>* y:Ag <C-r>"<C-b><CR>
endif
" }}}

" Fugitive {{{
  "" [Fugitive] D -- Fugitive: diff
  "" [Fugitive] dv -- Fugitive: diff vertically
  "" [Fugitive] cc -- Fugitive: commit
  "" [Fugitive] ca -- Fugitive: commit amend
  "" [Fugitive] cA -- Fugitive: commit amend no message
" }}}

" `, m` - Major mode {{{
  "" [N] <leader>mr -- Major: rename this symbol [languageclient]

  if exists(':LanguageClientStart')
    nnoremap <silent> <leader>mr :call LanguageClient#textDocument_rename()<CR>
  endif
" }}}

" `g` - Go to {{{
"" [N] gh -- Go: get hint [languageclient]
"" [N] gd -- Go: go to definition [languageclient]
"" [N] gJ -- Go: join multiline statement (like J) [splitjoin]
"" [N] gS -- Go: split multiline statement [splitjoin]

  if exists(':SplitjoinJoin')
    nmap gJ :SplitjoinJoin<cr>
    nmap gS :SplitjoinSplit<cr>
  endif

  if exists(':LanguageClientStart')
    nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  endif
" }}}

" Misc: emacs {{{
" [NI] <C-s> -- Misc-emacs: Save file
inoremap <C-s> <Esc>:w<CR>a
nnoremap <C-s> :w<CR>

" [N] <CR> -- Misc: Open fold
nnoremap <CR> za
" }}}

" Misc {{{
  "" [N] <leader>T -- Misc: open a new tab
  "" [N] - -- Misc: Open tree
  "" [N] <Enter> -- Misc: Open fold
  "" [N] <S-Enter> -- Misc: Open fold recursively
  "" [N] <C-Enter> -- Misc: Close fold recursively
  "" [N] <leader><TAB> -- Misc: complete commands [fzf]
  "" [I] <C-e> -- Misc: expand abbreviation [emmet]
  "" [V] <C-e> -- Misc: expand abbreviation [emmet]
  
  if globpath(&rtp, "plugin/emmet.vim") != ""
    imap <C-e> <C-y>,
    vmap <C-e> <C-y>,
  endif
  
  if exists(':NERDTreeFind')
    nnoremap - :NERDTreeFind<CR>
  endif
  
  nnoremap <Enter> za
  nnoremap <S-Enter> zO
  nnoremap <C-Enter> zC

"" [I] <c-x><c-f> -- FZF: complete file
"" [I] <c-x><c-j> -- FZF: complete file (via ag)

if exists(':Files')
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)
  inoremap <expr> <c-x><c-n> fzf#vim#complete#path("git ls-files \| xargs realpath")
endif

"" [N] <C-h> -- Misc: move to left pane
"" [N] <C-l> -- Misc: move to right pane
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"" [N] =oas -- Misc: toggle signify
nnoremap =oas :SignifyToggle<CR>
" }}}
