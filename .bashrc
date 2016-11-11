# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 6

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
alias IGV="/home/tim/IGV/IGV_current/igv.sh"
alias igv="/home/tim/IGV/IGV_current/igv.sh"
alias hpc="ssh ttriche@hpc-uec.usc.edu"
export EDITOR='vim'
export CUDA_HOME="/usr/local/cuda"
export LLVM_BIN="/scratch/llvm-build/Debug+Asserts/bin"
export LD_LIBRARY_PATH="${CUDA_HOME}/lib:${CUDA_HOME}/lib64:$LD_LIBRARY_PATH:/usr/lib64/R/library/Rcpp/lib/"
HOMER="$HOME/Dropbox/homer"

export MACHTYPE=`uname -m`
export PATH="${CUDA_HOME}/bin:${LLVM_BIN}:${PATH}:$HOMER/bin:$HOMER/weblogo:$HOME/bin/x86_64"
export PATH="~/.cabal/bin:$PATH"
export PATH="/home/tim/HAYSTACK/bin/:$PATH"


alias epigraph="ssh ttriche@epigraph.epigenome.usc.edu"
alias killssh="jobs -l | grep ssh | perl -ane 'print @F[1];' | xargs kill -9"
alias methdb='mysql methylation'
# alias methdb='mysql -h epifire2.epigenome.usc.edu -u methylation_user -pLQSmeth80 methylation'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# aliases suggested by huffshell:
alias c='cd'
alias c.='cd ..'
alias e='evince'
alias m='more'
alias rc='R CMD'
alias v='vim'
alias s='sudo'
alias sl='ls'

## github crap
alias g="git"
alias syncup="g fetch upstream && g checkout master && g merge upstream/master"

## cling: C++11 interpreter
alias cling='cling  -Wc++11-extensions -std=c++11'

export CLASSPATH=".:$HOME/jars:$HOME/jars/stdlib.jar:$HOME/jars/algs4.jar:$CLASSPATH"

### Below added by install script ###
export ARCHHOME=/home/tim/arch/Linux-x86_64
export PYTHONPATH=/home/tim/arch/Linux-x86_64/lib/python2.7:$PYTHONPATH
export PYTHONPATH=/home/tim/arch/Linux-x86_64/lib/python3.3:$PYTHONPATH
export PATH=/home/tim/arch/Linux-x86_64/bin:$PATH

# . /usr/lib/node_modules/meteorite/completions/mrt.bash
complete -C aws_completer aws
export AWS_CONFIG_FILE=/home/tim/Dropbox/AWS/aws_cli_config

## for ExaLT
## and ONLY for ExaLT 
#
# export PKG_CPPFLAGS=`Rscript -e "Rcpp:::CxxFlags()"`
# export PKG_CPPFLAGS=" -I. -lpthread "$PKG_CPPFLAGS
# export PKG_LIBS=`Rscript -e "Rcpp:::LdFlags()"`
export PATH=$PATH:/home/tim/domino:/home/tim/homer/bin:/home/tim/bin
export PATH="$PATH:/usr/lib/jvm/java-8-openjdk-amd64/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/tim/homer/weblogo"
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64'
export LD_LIBRARY_PATH=$JAVA_HOME/jre/lib/amd64:$JAVA_HOME/jre/lib/amd64/jli


## python crap

# update your python path by adding $HOME/src/genome/python/lib to the end
# this tells python where to find the genome library 
export PYTHONPATH=$PYTHONPATH:$HOME/src/genome/python/lib

alias  ipynb="ipython notebook --matplotlib=inline"
alias  irnb="ipython notebook --KernelManager.kernel_cmd=\"['R', '-e', 'IRkernel::main()', '--args', '{connection_file}']\""
alias  epynb="ssh -N -f -L localhost:6000:localhost:7000 ttriche@epigraph.epigenome.usc.edu"

# The next line updates PATH for the Google Cloud SDK.
source '/home/tim/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/home/tim/google-cloud-sdk/completion.bash.inc'
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# update your python path by adding $HOME/src/genome/python/lib to the end
# this tells python where to find the genome library 
export PYTHONPATH=$PYTHONPATH:$HOME/src/genome/python/lib

export ADAM_HOME="/home/tim/bigdatagenomics/adam"
alias piUp="sudo ifconfig eth0 192.168.1.1 netmask 255.255.255.0 up"
alias hadoopStart="sudo su - hduser -c ~hduser/start-hadoop.sh"
alias hadoopStop="sudo su - hduser -c ~hduser/stop-hadoop.sh"
alias adam="bash $ADAM_HOME/adam-cli/target/appassembler/bin/adam"
alias bedsort="sort -k1,1V -k2,2n -k3,3n"

## IGVtools 
alias igvtools=$HOME/IGV/IGVTools/igvtools

## skype
alias startskype="nohup skype > /dev/null 2>&1 &"

export LD_LIBRARY_PATH=$JAVA_HOME/jre/lib/amd64:$JAVA_HOME/jre/lib/amd64/client

cowthink `fortune`

# added by Miniconda2 3.18.3 installer
export PATH="$PATH:/home/tim/miniconda2/bin:/scratch/homer/bin:/scratch/homer/weblogo"
