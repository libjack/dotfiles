
export HISTFILESIZE=7500
export HISTSIZE=5000
# if we're already setup for SQLPATH, let it ride... else get home (in windows)
#if [ -z "$SQLPATH" ]; then
#    # we want this in windows for for sqlplus
#    export SQLPATH=`cygpath -w $HOME`
#fi
#want to append as much as we can (not override)
shopt -s histappend


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


# Remove ':' from the the COMP_WORDBREAKS variable to change
# readline's completion behavior so it does not break words to be
# completed at colons. This allows completion of native windows paths
# (i.e. C:/Prog<tab>).
#if [ -n "${COMP_WORDBREAKS}" ]; then COMP_WORDBREAKS=${COMP_WORDBREAKS//:/}; fi


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

[[ -r ~/.bashrc ]] && . ~/.bashrc

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/jliberty/.gvm/bin/gvm-init.sh" ]] && source "/Users/jliberty/.gvm/bin/gvm-init.sh"
