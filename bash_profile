# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

case "$TERM" in
xterm*|rxvt*)
    #PS1='\[\033]0;\u@\h:\w\007\033[0;33m\]: \!,$?(\j) ;\[\033[0m\] '
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    #PS1='\[\033]0;\u@\h:\w\007\033[0;33m\]: \!,$?(\j) ;\[\033[0m\] '
    #PS1='\[\033]0;\u@\h:\w\033[0;33m\]: \!,$?(\j) ;\[\033[0m\] '
    PS1='\[\033]0;\u@\h:\w\007\033[0;33m\]: \!,$?(\j) ;\[\033[0m\] '
    ;;
*)
    ;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

## some history customizations by jdl
export HISTCONTROL=ignoredups:ignorespace
export HISTFILE=~/.history
export HISTFILESIZE=2000
export HISTSIZE=2000
#want to append as much as we can (not override)
shopt -s histappend


# set variables for Hadoop
export JAVA_HOME=/usr/local/java

# User specific environment and startup programs
export HADOOP_HOME=/usr/lib/hadoop
export HADOOP_PREFIX=/usr/lib/hadoop/
export HIVE_HOME=/usr/lib/hive
export HADOOP_CONF_DIR=/etc/hadoop/conf_prod
export HIVE_CONF_DIR=/etc/hive/conf_prod

export NIS_HOME=/opt/nis

PATH=$PATH:$HOME/bin

export PATH
