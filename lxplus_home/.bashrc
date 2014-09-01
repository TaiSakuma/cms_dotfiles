# .bashrc

#_____________________________________________________________________________||
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

#_____________________________________________________________________________||
if [ ! "$read_bash_profile" = "yes" ]; then
    . ~/.bash_profile
fi

#_____________________________________________________________________________||
if [ "$TERM" == "vt100" -o "$TERM" == "dumb" -o "$EMACS" == "t" ]; then
    true # do nothing
else 
    # PS1="\[\033[1;30m\]<\w>\n\[\033[01;00m\]\u@\[\033[01;33m\]\h\[\033[00m\]\$ "
    PS1="\[\033[1;30m\]<\w> "'$(__git_ps1 "(%s)")'"\n\[\033[01;00m\]\u@\[\033[01;33m\]\h\[\033[00m\]\$ "
    if [ -f "$HOME/.bash_ps1" ]; then
	. "$HOME/.bash_ps1"
    fi
fi


#_____________________________________________________________________________||
alias ls='ls -F --color=auto'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
#_____________________________________________________________________________||
calc(){ awk "BEGIN{ print $* }" ;}

#_____________________________________________________________________________||
