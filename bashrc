#!/bin/bash

# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


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
#alias e='gnuclientw'
#
#eval `dircolors -b /etc/DIR_COLORS`
#alias xt='xterm -geom 80x60 -sl 1000 -sb -rightbar -ms red -fg yellow -bg black -e /usr/bin/bash -l'

# some picked up from brettterpstra.com
# share history between terminal sessions
alias he="history -a" # export history
alias hi="history -n" # import history

# Get your current public IP
alias ip="curl icanhazip.com"

# list TODO/FIX lines from the current project
alias todos="ack -n --nogroup '(TODO|FIX(ME)?):'"



function vis()
{
  sp=$1
  shift
  vi +/$sp `grep -l $sp $*`
}

function = () { echo "$*" | bc -l; }

#
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

function dfscat ()
{
    hadoop dfs -cat $1/* | tr '\001\002\003' '|,='
}

# want to do special handling for OS as well as extra local customizations
#
platform=unknown
if [[ "$OSTYPE" == "darwin"* ]] ; then
  platform=osx
elif [[ "$OSTYPE" == "linux-gnu" ]] ; then
  platform=linux
fi
if [[ -r .bashrc.$platform ]] ; then 
  . .bashrc.$platform
fi

if [[ -r .bashrc.local ]] ; then
  . .bashrc.local
fi


