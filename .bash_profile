# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

JAVA_HOME=~/jdk/jre
export JAVA_HOME

PATH=$PATH:$HOME/bin:$JAVA_HOME/bin:~/Oracle/Middleware/asinst_1/OUD/bin
export PATH
