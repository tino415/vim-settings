filetype plugin on

let g:syntastic_python_pylint_args="-d C0326 C0111 -f parsable -r n -i y"
let g:syntastic_php_checkers=['php']

set clipboard+=unnamed  " use the clipboards of vim and win
set paste               " Paste from a windows or from vim
set go+=a               " Visual selection automatically copied to the clipboard

set omnifunc=syntaxcomplete#Complete
set number
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set tags=./tags;/
set list listchars=tab:»-,trail:·,extends:»,precedes:«

hi Comment ctermfg=LightBlue
set cursorline

let g:user_emment_setting = {
\   'indentation' : '   '
\}

execute pathogen#infect()

let fts = '*.php, *.py, *.css, *.c, *.js, *.tex, vimrc'

function Ft_tabs(set)
    if &ft != 'makefile' && &ft != 'make'
        if a:set == 'noexpand'
            set noexpandtab
        elseif a:set == 'expand'
            set expandtab
        endif
        retab! 4
    endif
endfun

autocmd! bufreadpost * call Ft_tabs('noexpand')
autocmd! bufwritepre * call Ft_tabs('expand')
autocmd! bufwritepost * call Ft_tabs('noexpand')

au BufRead,BufNewFile *.j2 set filetype="htmljinja"

map <C-f>f :FufFile<CR>
map <C-f>t :FufTag<CR>
map <C-f>b :FufBuffer<CR>

function Tb_f() range
    let deli = input('Delimiter : ')
    execute a:firstline.', '.a:lastline.' Tabularize /'.deli
endfun

vmap <C-t> :call Tb_f()<CR>

function Abbr_c()
    abbr mutx pthread_mutex_t mutex_<name> = PTHREAD_MUTEX_INITIALIZER;
    abbr semf sem_t sem_<name>;
endfun

command Abbrc call Abbr_c()

function Cp_c()
    set nolist
    set nonu
endfun

function Ncp_c()
    set list listchars=tab:»-,trail:·,extends:»,precedes:«
    set nu
endfun

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction

command! PrettyXML call DoPrettyXML()

function Mn_c()
    echo "Emmet"
    echo "(ctrl + y) + n    In insert mode, go to next editable possition"
    echo "(ctrl + y) + N    In insert mode, go to previous editable possition"
    echo "(ctrl + y) + k    Remove tag in which is cursor"
    echo "(ctrl + y) + j    Change tag format onliner normal"
    echo "(ctrl + y) + /    Toggle html comment"
    echo "(ctrl + y) + a    Make anchor from url"
    echo "(ctrl + y) + A    Make quote from url"
    echo ""
    echo "Move bytwe    n errors :lnext :lprev"
    echo ":Error    Print all errors window"
    echo ""
    echo "Aling"
    echo "(ctrl + t)           - in visual mode align by key"
    echo "insert mode + Tab    - auto find aligning"
    echo ""
    echo ":rename[!] {newname} - Rename actual file"
    echo ""
    echo "FuziFinder - openning files/search "
    echo " :FufBuffer || <C-f>b - Buffer mode (|fuf-buffer-mode|)"
    echo " :FufFile || <C-f>f   - File mode (|fuf-file-mode|)"
    echo " :FufCoverageFile     - Coverage-File mode (|fuf-coveragefile-mode|)"
    echo " :FufDir              - Directory mode (|fuf-dir-mode|)"
    echo " :FufMruFile          - MRU-File mode (|fuf-mrufile-mode|)"
    echo " :FufMruCmd           - MRU-Command mode (|fuf-mrucmd-mode|)"
    echo " :FufBookmarkFile     - Bookmark-File mode (|fuf-bookmarkfile-mode|)"
    echo " :FufBookmarkDir      - Bookmark-Dir mode (|fuf-bookmarkdir-mode|)"
    echo " :FufTag||<C-f>t      - Tag mode (|fuf-tag-mode|)"
    echo " :FufBufferTag        - Buffer-Tag mode (|fuf-buffertag-mode|)"
    echo " :FufTaggedFile       - Tagged-File mode (|fuf-taggedfile-mode|)"
    echo " :FufJumpList         - Jump-List mode (|fuf-jumplist-mode|)"
    echo " :FufChangeList       - Change-List mode (|fuf-changelist-mode|)"
    echo " :FufQuickfix         - Quickfix mode (|fuf-quickfix-mode|)"
    echo " :FufLine             - Line mode (|fuf-line-mode|)"
    echo " :FufHelp             - Help mode (|fuf-help-mode|)"
    echo ""
    echo "Multiple cursors"
    echo "(Ctrl + n)     - Select next word"
    echo "(Ctrl + p)     - Go to prewious selected"
    echo "(Ctrl + x)     - Skip"
    echo "(Ctrl + <ESC>) - Abort"
    echo ""
    echo "Windows"
    echo "(Ctrl + w) + s - or :sp ${height}sp "
    echo "(Ctrl + w) + v - or :vsp ${width}vsp"
    echo "(Ctrl + w) + j - go to down window"
    echo "(Ctrl + w) + h - go to left window"
    echo "(Ctrl + w) + k - go to up window"
    echo "(Ctrl + w) + l - go to right window"
endfun

command Mn call Mn_c()
command CP call Cp_c()
command NCP call Ncp_c()
