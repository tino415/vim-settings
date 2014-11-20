filetype plugin on

set omnifunc=syntaxcomplete#Complete
set number
set tabstop=4
set autoindent
set tags=./tags;/

hi Comment ctermfg=LightBlue

execute pathogen#infect()

function Abbr_c()
	abbr mutx pthread_mutex_t mutex_<name> = PTHREAD_MUTEX_INITIALIZER;
	abbr semf sem_t sem_<name>;
endfun

command Abbrc call Abbr_c()

function Mn_c()
    echo "(ctrl + y) + n	In insert mode, go to next editable possition"
    echo "(ctrl + y) + N	In insert mode, go to previous editable possition"
    echo "(ctrl + y) + k	Remove tag in which is cursor"
    echo "(ctrl + y) + j	Change tag format onliner normal"
    echo "(ctrl + y) + /	Toggle html comment"
    echo "(ctrl + y) + a  Make anchor from url"
    echo "(ctrl + y) + A	Make quote from url"
    echo ""
    echo "ALIGN"
    echo "visual line select + Tab command "
    echo "ex '<, '>Tab /:	     - align by :"
    echo "ex '<, '>Tab/:\zs    - align by first character after :"
    echo "insert mode + Tab    - auto find aligning"
    echo ""
    echo ":rename[!] {newname} - Rename actual file"
    echo ""
    echo "FuziFinder - openning files/search "
    echo " :FufBuffer       - Buffer mode (|fuf-buffer-mode|)"
    echo " :FufFile         - File mode (|fuf-file-mode|)"
    echo " :FufCoverageFile - Coverage-File mode (|fuf-coveragefile-mode|)"
    echo " :FufDir          - Directory mode (|fuf-dir-mode|)"
    echo " :FufMruFile      - MRU-File mode (|fuf-mrufile-mode|)"
    echo " :FufMruCmd       - MRU-Command mode (|fuf-mrucmd-mode|)"
    echo " :FufBookmarkFile - Bookmark-File mode (|fuf-bookmarkfile-mode|)"
    echo " :FufBookmarkDir  - Bookmark-Dir mode (|fuf-bookmarkdir-mode|)"
    echo " :FufTag          - Tag mode (|fuf-tag-mode|)"
    echo " :FufBufferTag    - Buffer-Tag mode (|fuf-buffertag-mode|)"
    echo " :FufTaggedFile   - Tagged-File mode (|fuf-taggedfile-mode|)"
    echo " :FufJumpList     - Jump-List mode (|fuf-jumplist-mode|)"
    echo " :FufChangeList   - Change-List mode (|fuf-changelist-mode|)"
    echo " :FufQuickfix     - Quickfix mode (|fuf-quickfix-mode|)"
    echo " :FufLine         - Line mode (|fuf-line-mode|)"
    echo " :FufHelp         - Help mode (|fuf-help-mode|)"
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
