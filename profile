
#CVSROOT=:pserver:jliberty@a2b-echelon.roc.questra.com:/cvs;export CVSROOT
export HISTFILESIZE=1500
export HISTSIZE=500
# if we're already setup for SQLPATH, let it ride... else get home (in windows)
#if [ -z "$SQLPATH" ]; then
#    # we want this in windows for for sqlplus
#    export SQLPATH=`cygpath -w $HOME`
#fi
#want to append as much as we can (not override)
shopt -s histappend

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

# note the xterm escape sequences:
#    * ESC]0;stringBEL -- Set icon name and window title to string
#    * ESC]1;stringBEL -- Set icon name to string
#    * ESC]2;stringBEL -- Set window title to string
#  ESC is the escape character (\033), and BEL is the bell character (\007).
#
# the color sequences are enclosed in \[\033[ and \]:
#   and followed by a lowercase m.
# Black       0;30     Dark Gray     1;30
# Blue        0;34     Light Blue    1;34
# Green       0;32     Light Green   1;32
# Cyan        0;36     Light Cyan    1;36
# Red         0;31     Light Red     1;31
# Purple      0;35     Light Purple  1;35
# Brown       0;33     Yellow        1;33
# Light Gray  0;37     White         1;37
# reset to foreground by 0m


#
# set a default prompt of: user@host current_directory 
#export PS1='\[\033]0;\w\007\033[32m\]\u@\h \[\033[33m\w\033[0m\] \n: \! ; '
# puts the user@host in xterm title only, and brown history# & status
export PS1='\[\033]0;\u@\h:\w\007\033[0;33m\]: \!,$?(\j) ;\[\033[0m\] '
# puts the user@host in xterm title only, and  history# & status -- NO COLOR
#export PS1='\[\033]0;\u@\h:\w\007: \!,$? ; '
# only set the command line, no title
#export PS1='\[\033[0;33m\]: \!,$? ;\[\033[0m\] '
#export PS1='\033]0;\u@\h:\w\007\[\033[0;33m\]: \!,$? ;\[\033[0m\] '


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

# Remove ':' from the the COMP_WORDBREAKS variable to change
# readline's completion behavior so it does not break words to be
# completed at colons. This allows completion of native windows paths
# (i.e. C:/Prog<tab>).
#if [ -n "${COMP_WORDBREAKS}" ]; then COMP_WORDBREAKS=${COMP_WORDBREAKS//:/}; fi


## we always like some news
#fortune

# some bash binding (should be in .inputrc, no?)
# M-/ is bound to complete file, which I never use
bind '"\e\/":dynamic-complete-history'
# bind for M-p, M-n for history searching
bind '"\ep":history-search-backward'
bind '"\en":history-search-forward'

export DEVTOOLS=/DevTools


#export JAVA_HOME=/Library/Java/Home
export JAVA_HOME=`/usr/libexec/java_home`

#export GRAILS_HOME=$DEVTOOLS/grails-1.2.2
#export GRIFFON_HOME=$DEVTOOLS/griffon-0.9.4
#export GROOVY_HOME=$DEVTOOLS/groovy-1.8.1
#export GRADLE_HOME=$DEVTOOLS/gradle-1.0-milestone-4
##export SCALA_HOME=$DEVTOOLS/scala-2.8.0.final
#export TYPESAFE_STACK=$DEVTOOLS/typesafe-stack
#export AKKA_HOME=$TYPESAFE_STACK
#export SCALA_HOME=$TYPESAFE_STACK
#export PLAY_HOME=$DEVTOOLS/play-1.2.3

#export PATH=$PLAY_HOME:$TYPESAFE_STACK/bin:$GROOVY_HOME/bin:$GRAILS_HOME/bin:$GRIFFON_HOME/bin:$GRADLE_HOME/bin:$DEVTOOLS/bin:$PATH
#export PATH=$PLAY_HOME:$TYPESAFE_STACK/bin:$GROOVY_HOME/bin:$GRAILS_HOME/bin:$GRIFFON_HOME/bin:$GRADLE_HOME/bin:$DEVTOOLS/bin:$PATH
export PATH=$DEVTOOLS/bin:$PATH



#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/jliberty/.gvm/bin/gvm-init.sh" ]] && source "/Users/jliberty/.gvm/bin/gvm-init.sh"
