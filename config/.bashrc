# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
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

# some more ls aliases
alias ll='ls -al'
alias la='ls -A'
alias l='ls -CF'

alias sd='sudo /sbin/shutdown -h 0'
alias myapp='start_my_app'

alias cdwxc='cd ~/Documents/code/mycode/wxc'
alias xp='rdesktop -a 16 10.10.10.128 -u administrator -p jackstraw -K -g workarea -D &'
alias myxp='rdesktop -a 16 192.168.187.128 -u administrator -p jackstraw -g workarea -D &'
alias mywin7='rdesktop -a 16 192.168.22.49 -u a -p jackstraw -K -g workarea -D &'
alias centos='ssh -o GSSAPIAuthentication=no root@192.168.22.182'
alias xcode='ssh -o GSSAPIAuthentication=no 172.16.154.132'
alias dbs='sudo mount -t cifs -o username=wxc,password=wxc,uid=1000,gid=1000 //192.168.22.209/share /home/jackstraw/share'
alias tom='ssh -o GSSAPIAuthentication=no tom@192.168.31.116'

alias vm-kali-gui='rdesktop -a 16 192.168.22.116 -u root -p jackstraw -K -g workarea -D &'
alias vm-kali-cmd='ssh root@192.168.22.116'
alias add-kali-gui='rdesktop -a 16 192.168.22.49 -u root -p jackstrawxx -K -g workarea -D &'
alias add-kali-cmd='ssh root@192.168.22.49'
alias server52='ssh jackstraw@192.168.31.52'
alias ws='ssh wsjswy@192.168.22.35'

alias amazon='autossh -M 2345 -i ~/.ssh/jackstraw.pem ubuntu@ec2-52-68-181-14.ap-northeast-1.compute.amazonaws.com -N -D 1234'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# swap capsLock and right-ctrl
#xmodmap .Xmodmap

#NDK
#export NDK=/home/jackstraw/software/adt/adt-bundle-linux-x86_64-20140702/android-ndk-r9d
export NDK=/home/jackstraw/software/adt/adt-bundle-linux-x86_64-20140702/ndk-r10d

#JAVA
export JAVA_HOME=~/software/java/jdk1.8.0_25
#export JAVA_HOME=~/software/java/jdk1.6.0_45
export CLASSPATH=$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar:$JAVA_HOME/jre/lib

export WXC=/home/jackstraw/Documents/code/mycode/wxc


#easy pay
export EASY_PAY=/home/jackstraw/Documents/security/007EasyPay/002src_branch
#ANDROID_TOOLS=$EASY_PAY/tools
#export ANDROID_TOOLS


WORK_HOME=$EASY_PAY/002EasyPaySecLibWrap/adv_ppsec_lib
export WORK_HOME


LD_LIBRARY_PATH=/home/jackstraw/symbol/001FinancialSecLib/output/server/:$WXC/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH

export PATH=~/software/bin:$JAVA_HOME/bin:$PATH:/sbin

export PYTHONSTARTUP=/home/jackstraw/.pythonstartup