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

alias psgrep="ps -Aco pid,comm | sed 's/^ *//'| sed 's/:/ /'|grep -iE"



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

# some from brettterpstra.com

function console () {
  if [[ $# > 0 ]]; then
    query=$(echo "$*"|tr -s ' ' '|')
    tail -f /var/log/system.log|grep -i --color=auto -E "$query"
  else
    tail -f /var/log/system.log
  fi
}


# alias last and save
# use `als c NAME` to chop off the last argument (for filenames/patterns)
als() {
	local aliasfile chop x
	[[ $# == 0 ]] && echo "Name your alias" && return
	if [[ $1 == "c" ]]; then
		chop=true
		shift
	fi
	aliasfile=~/.bash_it/aliases/custom.aliases.bash
	touch $aliasfile
	if [[ `cat "$aliasfile" |grep "alias ${1// /}="` != "" ]]; then
		echo "Alias ${1// /} already exists"
	else
		x=`history 2 | sed -e '$!{h;d;}' -e x | sed -e 's/.\{7\}//'`
		if [[ $chop == true ]]; then
			echo "Chopping..."
			x=$(echo $x | rev | cut -d " " -f2- | rev)
		fi
		echo -e "\nalias ${1// /}=\"`echo $x|sed -e 's/ *$//'|sed -e 's/\"/\\\\"/g'`\"" >> $aliasfile && source $aliasfile
		alias $1
	fi
}


fp () { #find and list processes matching a case-insensitive partial-match string
		ps Ao pid,comm|awk '{match($0,/[^\/]+$/); print substr($0,RSTART,RLENGTH)": "$1}'|grep -i $1|grep -v grep
}

fk () { 
	IFS=$'\n'
	PS3='Kill which process? (1 to cancel): '
	select OPT in "Cancel" $(fp $1); do
		if [ $OPT != "Cancel" ]; then
			kill $(echo $OPT|awk '{print $NF}')
		fi
		break
	done
	unset IFS
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


