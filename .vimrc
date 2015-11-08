" Modeline and Intro {
" vim: set sw=4 et ts=4 sts=4 ai nowrap nojs foldmarker={,} foldlevel=0 foldmethod=marker:
"
" sw        - shiftwidth
" et        - expandtab     - In 'Insert' mode use appropriate number of spaces to inser a <TAB>
" ts        - tabstop
" sts       - softtabstop
" ai        - autoindent
" nowrap    - vs 'wrap'
" nojs      - nojoinspaces
" tw        - textwidth     - A longer line will be broken after whitespace
" spell     - vs 'nospell'  - When on spellchecking will be done
"
" 09/10/2015 CZ: New Vim-Setup started
"
" References:
"
" }

" Initialisation {

    " Gotta be first
    set nocompatible

    "
    " 09/10/2015 CZ: Introducing $VIMHOME to deal with custom vim path {
    " To run vim from a custom directory set the VIMINIT environment variable.
    " Example:
    "   export VIMINIT='let $MYVIMRC="/home/chris/_vim/spf13/.vimrc" | source $MYVIMRC'
    "
    " TODO: !!! MAKE SURE TO USE AN ABSOLUTE PATH FOR NOW
    " until you have verified the related call on line 84
    " in .vim/bundle/Vundle.vim/autoload/vundle.vim
    "
    " TODO: Consider replacing the whole shebang with somthing like:
    "
    " let s:thisf = expand('<sfile>') " provides absolute path to this file
    "
    " VMINIT will not be set by default, so we can assume that we are supposed
    " to run from a set of configuration files in a non-standard path.
    " In this case we replace references to $HOME from the runtimepath
    " with the path we have been provided for to our custom vimrc file ($MYVIMRC)
        if exists('$VIMINIT') && exists('$MYVIMRC')
            let $VIMHOME=strpart($MYVIMRC,0,strridx($MYVIMRC,"/"))
            exe 'set rtp=' . substitute(&runtimepath,$HOME,$VIMHOME,"g")
        else
            let $VIMHOME = $HOME
        endif
    " }

" }

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on

" Vundle + Plugins {

    " source: https://github.com/VundleVim/Vundle.vim
    " set nocompatible
    filetype off

    " Check if we have Vundle - and try to fetch it if we don't
    " TODO: Add error handling and verify against hacks for custom path
    let hasVundle=1
    let vundle_readme=expand( $VIMHOME . "/.vim/bundle/Vundle.vim/README.md")
    if !filereadable(vundle_readme)
        echo "Missing Vundle. Will try to clone it from github..."
        echo ""
        silent !mkdir -p $VIMHOME/.vim/bundle
        silent !git clone https://github.com/VundleVim/Vundle.vim.git $VIMHOME/.vim/bundle/Vundle.vim
        let hasVundle=0
    endif

    set rtp+=$VIMHOME/.vim/bundle/Vundle.vim

"" ---> Funtkionier nicht. Fixen!
    call vundle#begin( expand( $VIMHOME . "/.vim/bundle") )

    Plugin 'VundleVim/Vundle.vim'
    Plugin 'altercation/vim-colors-solarized'   " Some colorschemes
    Plugin 'tomasr/molokai'
    Plugin 'lokaltog/vim-distinguished'
    Plugin 'bling/vim-airline'                  " A lighter 'Powerline' statusbar

    Plugin 'scrooloose/nerdtree'
    Plugin 'jistr/vim-nerdtree-tabs'            " NERDTree integration with Vim-Tabs
    Plugin 'kien/ctrlp.vim'                     " Fuzzy file finder (via <CTRL>-p
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'scrooloose/syntastic'               " Syntax checker - see
                                                " https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers
    Plugin 'nanotech/jellybeans.vim'

    call vundle#end()
    " If this is a new Vundle-install make sure all Plugins are installed as
    " well
    if hasVundle == 0
        echo "Executing PluginInstall..."
        echo ""
        :silent! PluginInstall
        :q
    endif

    filetype plugin indent on
    " To ignore plugin indent changes, instead use:
    " filetype plugin on

" }

" Temporary loading my must-haves into my own config-file {
    " Use local vimrc if available {
        if filereadable(expand( $VIMHOME . "/.vimrc.cz"))
            source $VIMHOME/.vimrc.cz
        endif
    " }

" }

