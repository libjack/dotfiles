#!/bin/bash

# some bash binding (should be in .inputrc, no?)
# M-/ is bound to complete file, which I never use
bind '"\e\/":dynamic-complete-history'
# bind for M-p, M-n for history searching
bind '"\ep":history-search-backward'
bind '"\en":history-search-forward'

# some aliases
alias po=pp
alias pp=popd
alias pu=pd
alias pd=pushd
alias rm='/bin/rm -i'
alias rrm=/bin/rm
alias pwd='dirs -l'
alias ds='dirs -v'
alias mv='/bin/mv -i'
alias j='jobs -l'
alias cp='/bin/cp -i'
alias +x='chmod +x'
alias +r='chmod +r'
alias +w='chmod +w'
#alias ls='ls -F --color'
alias ls='ls -F'
alias ll='ls -l'
#alias lt='ls -lt --color=never'
alias lt='ls -lt'
#alias sqlplus='rlwrap -f ~/rlwrap/a2b-tables sqlplus'
#alias ldd='cygcheck'
#alias e='gnuclientw'
#
#eval `dircolors -b /etc/DIR_COLORS`
#alias xt='xterm -geom 80x60 -sl 1000 -sb -rightbar -ms red -fg yellow -bg black -e /usr/bin/bash -l'

# some functions
function genv()
{
  /usr/bin/env | grep "$@"
}

function hex()
{
  echo "16o$1[0x]Ppq" | dc
}
function lth()
{
  ls -lt $* | head
}

function hs()
{
  history | grep $*
}

function e()
{
  /usr/local/bin/emacsclient -n $*
}


