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
alias lt='ls -lht'
alias l.='ls -d .* --color=auto'

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

function gb()
{
  echo "4k$1 1024/1024/1024/n[GB]P[]pq" | dc
}


function lth()
{
  ls -lht $* | head
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

function dt ()
{
  local units=days
  local offset=0
  if [[ $# > 1 ]]; then
    units=$2
    offset=$1
  elif [[ $# > 0 ]]; then
    offset=$1
  fi
  if (( $offset > 0 )) ; then offset=$((- $offset)); fi
  date -d "$offset $units" "+%Y%m%d"
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
	aliasfile=~/.bash.d/aliases/custom.aliases.bash
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


## look for some git things, can find these files at
# https://github.com/git/git/tree/master/contrib/completion
# mkdir ~/.bash.d
# curl -o ~/.bash.d/git-prompt.sh https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
# curl -o ~/.bash.d/git-completion.bash https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
if [[ -r ~/.bash.d/git-prompt.sh ]] ; then
  source ~/.bash.d/git-prompt.sh
fi
if [[ -r ~/.bash.d/git-completion.bash ]] ; then
  source ~/.bash.d/git-completion.bash
fi


## handle the prompt
## export PS1='\[\033]0;\u@\h:\w\007\033[0;33m\]: \!,$?(\j) ;\[\033[0m\] '


xxx_prompt_command () {
    if [ $? -eq 0 ]; then # set an error string for the prompt, if applicable
        ERRPROMPT=" "
    else
        ERRPROMPT="->($?) " # original of this used ', not sure why...
    fi
    if [ "\$(type -t __git_ps1)" ]; then # if we're in a Git repo, show current branch
        BRANCH="\$(__git_ps1 '[ %s ] ')"
    fi
    local TIME=`fmt_time` # format time for prompt string
    local LOAD=`uptime|awk '{min=NF-2;print $min}'`
    local GREEN="\[\033[0;32m\]"
    local CYAN="\[\033[0;36m\]"
    local BCYAN="\[\033[1;36m\]"
    local BLUE="\[\033[0;34m\]"
    local GRAY="\[\033[0;37m\]"
    local DKGRAY="\[\033[1;30m\]"
    local WHITE="\[\033[1;37m\]"
    local RED="\[\033[0;31m\]"
    # return color to Terminal setting for text color
    local DEFAULT="\[\033[0;39m\]"
    # set the titlebar user@host + to the last 2 fields of pwd
    local TITLEBAR='\[\e]2;\u@\h: `pwdtail`\a'
    export PS1="\[${TITLEBAR}\]${CYAN}[ ${BCYAN}\u${GREEN}@${BCYAN}\
\h${DKGRAY}(${LOAD}) ${WHITE}${TIME} ${CYAN}]${RED}$ERRPROMPT${GRAY}\
\w\n${GREEN}: \!,\j ${BRANCH};${DEFAULT} "
}

prompt_command () {
    local _status=$?

    local GREEN="\[\033[0;32m\]"
    local CYAN="\[\033[0;36m\]"
    local BCYAN="\[\033[1;36m\]"
    local BLUE="\[\033[0;34m\]"
    local GRAY="\[\033[0;37m\]"
    local DKGRAY="\[\033[1;30m\]"
    local WHITE="\[\033[1;37m\]"
    local RED="\[\033[0;31m\]"

    local DEFAULT="\[\033[0;39m\]"

    if [ "\$(type -t __git_ps1)" ]; then # if we're in a Git repo, show current branch
        BRANCH="\$(__git_ps1 '[ %s ] ')"
    else
      BRANCH=
    fi

    #local TIME=$(fmt_time) # format time for prompt string
    #local LOAD=`uptime|awk '{min=NF-2;print $min}'`
    if [ $_status -eq 0 ]; then # set an error string for the prompt, if applicable
        STATUS="$_status"
    else
        STATUS="${RED}$_status${DEFAULT}" # original of this used ', not sure why...
    fi

    # return color to Terminal setting for text color
    # set the titlebar user@host + to the last 2 fields of pwd
    local TITLEBAR='\[\e]2;\u@\h: \w\a'
    export PS1="\[${TITLEBAR}\]${GREEN}: \!,${STATUS}${DKGRAY}#${GREEN}\j ${BRANCH};${DEFAULT} "
}
PROMPT_COMMAND=prompt_command

fmt_time () { #format time just the way I likes it
    if [ `date +%p` = "PM" ]; then
        meridiem="pm"
    else
        meridiem="am"
    fi
    date +"%l:%M:%S$meridiem"|sed 's/ //g'
}
pwdtail () { #returns the last 2 fields of the working directory
    # avoid any aliases
    /bin/pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}
chkload () { #gets the current 1m avg CPU load
    local CURRLOAD=`uptime|awk '{print $8}'`
    if [ "$CURRLOAD" > "1" ]; then
        local OUTP="HIGH"
    elif [ "$CURRLOAD" < "1" ]; then
        local OUTP="NORMAL"
    else
        local OUTP="UNKNOWN"
    fi
    echo $CURRLOAD
}

# keep these last
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

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon
