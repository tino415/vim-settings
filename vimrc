filetype plugin on

set omnifunc=syntaxcomplete#Complete
set number
set tabstop=4
set autoindent

hi Comment ctermfg=LightBlue

execute pathogen#infect()

function Abbr_c()
	abbr mutx pthread_mutex_t mutex_<name> = PTHREAD_MUTEX_INITIALIZER;
	abbr semf sem_t sem_<name>;
endfun

command Abbrc call Abbr_c()
