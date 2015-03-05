filetype plugin on

let g:syntastic_python_pylint_args="-d C0326 C0111 -f parsable -r n -i y"
let g:syntastic_php_checkers=['php']

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

autocmd! bufreadpost * set noexpandtab | retab! 4

autocmd! bufwritepre * set expandtab | retab! 4

autocmd! bufwritepost * set noexpandtab | retab! 4

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
