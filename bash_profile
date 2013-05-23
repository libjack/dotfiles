# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# set variables for Hadoop
export JAVA_HOME=/usr/local/java

# User specific environment and startup programs
export HADOOP_HOME=/usr/lib/hadoop
export HADOOP_PREFIX=/usr/lib/hadoop/
export HIVE_HOME=/usr/lib/hive
export HADOOP_CONF_DIR=/etc/hadoop/conf_prod
export HIVE_CONF_DIR=/etc/hive/conf_prod

PATH=$PATH:$HOME/bin

export PATH
