#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# chinese
#export LC_ALL=zh_CN.UTF-8
#export LANG=zh_CN.UTF-8

# fix gnome ibus bug
export XMODIFIERS="@im=fcitx"

# emacs deamon
alias ec='emacsclient -t -a ""'
alias ecw='emacsclient -c -a ""'
export EDITOR='emacsclient -t -a""'
export slib_root='/home/sowicm/projects/slib/'

export PATH="$PATH:/home/sowicm/bin"
