# .bashrc
[[ $- == *i* ]] || return

# Enable all auto completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f /gem_base/etc/profile ]; then
    . /gem_base/etc/profile
fi

# List all the screen sessions available
if command -v screen ; then
    screen -ls
else
    echo "*****"
    echo "'screen' cmd is not installed"
    echo "*****"
fi

# Allow .vimrc setting to work inside a screen session
if [ "$TERM" = "screen" ]; then
    export TERM=screen-256color
fi

# Show name of active branch on a git tracked directory
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# User specific aliases and functions
alias ls='ls --color=auto'
alias ll='ls -alF'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias egrep-ioc='egrep -rI --color=auto --exclude-dir={.svn,O.*,bin,*.old,*.new,documentation,tmp} --exclude=*.log'
alias tdcts='tdct -cfg ./tdct.cfg -i'
alias medmStats='medm -x -noMsg -attach -macro'
alias iocwork='cd /gem_sw/work/${EPICS_RELEASE}/ioc' 
alias iocprod='cd /gem_sw/prod/${EPICS_RELEASE}/ioc' 
alias suppwork='cd /gem_sw/work/${EPICS_RELEASE}/support' 
alias suppprod='cd /gem_sw/prod/${EPICS_RELEASE}/support' 

#export GEM_ROOT=/gem_sw
export PYTHONPATH=${PYTHONPATH}:${HOME}/devel/python
export EPICS_CA_ADDR_LIST=172.16.2.255
export IOCSTATS=/gem_sw/prod/R3.14.12.4/support/iocStats/3-1-14-1/bin/linux-x86_64/../../op/adl/ioc_stats_rtems.adl

#This section is to configure the prompt
export USER_HOSTp='\[\e[0;34m\]\u@\h\[\e[m\] '
export FULL_DIRp='\[\e[0;32m\]$PWD\[\e[m\]\n'
export GIT_BRNCHp='\[\e[0;33m\]$(parse_git_branch)\[\e[m\]'
export ENDp='$ '
#PS1="\[\`if [[ \$? = "0" ]]; then echo '\e[32m\h\e[0m'; else echo '\e[31m\h\e[0m' ; fi\`:\$PWD\n\$ "
#export PS1="\[\033[0;34m\]\u@\h \[\033[0m\]\[\033[32m\]\$PWD\n\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "
export PS1=$USER_HOSTp$FULL_DIRp$GIT_BRNCHp$ENDp

#. ~/work/vendor/git/contrib/completion/git-completion.bash
#source $GEM_ROOT/etc/profile
cd $HOME
