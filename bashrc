# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f /gem_base/etc/profile ]; then
    . /gem_base/etc/profile
fi

if command -v screen ; then
    screen -ls
else
    echo "*****"
    echo "'screen' cmd is not installed"
    echo "*****"
fi

# User specific aliases and functions
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

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
export PYTHONPATH=${HOME}/devel/python
export EPICS_CA_ADDR_LIST=172.16.2.255
export IOCSTATS=/gem_sw/prod/R3.14.12.4/support/iocStats/3-1-14-1/bin/linux-x86_64/../../op/adl/ioc_stats_rtems.adl
#source $GEM_ROOT/etc/profile
#PS1="\[\`if [[ \$? = "0" ]]; then echo '\e[32m\h\e[0m'; else echo '\e[31m\h\e[0m' ; fi\`:\$PWD\n\$ "
export PS1="\[\033[0;34m\]\u@\h \[\033[0m\]\[\033[32m\]\$PWD\n\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "

#. ~/work/vendor/git/contrib/completion/git-completion.bash
