# .bash_profile

#_____________________________________________________________________________||
read_bash_profile=yes
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
unset read_bash_profile

#_____________________________________________________________________________||
export LESS="-X -Q -R"

#_____________________________________________________________________________||
export HISTFILE=~/.bash_history
export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTCONTROL=ignoreboth
shopt -s histappend

#_______________________________________________________________________ git _||
if [ -f "$HOME/.git_completion/git-completion.bash" ]; then
    source $HOME/.git_completion/git-completion.bash
fi

if [ -f "$HOME/.git_completion/git-prompt.sh" ]; then
    source $HOME/.git_completion/git-prompt.sh
fi

#_____________________________________________________________________________||
export CLICOLOR=YES
eval `dircolors ~/.dircolors`

#_____________________________________________________________________________||
if [ -z "${CMS_PATH:-}" ]; then
    source /cvmfs/cms.cern.ch/cmsset_default.sh
fi

#_____________________________________________________________________________||
