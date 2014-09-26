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
if [ -f "~/.git_completion/git-completion.bash" ]; then
    source ~/.git_completion/git-completion.bash
fi

if [ -f "~/.git_completion/git-prompt.sh" ]; then
    source ~/.git_completion/git-prompt.sh
fi

#_______________________________________________________________________ ssh _||
# http://stackoverflow.com/questions/18880024/start-ssh-agent-on-login
# http://serverfault.com/questions/267154/protocol-version-mismatch-is-your-shell-clean
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

if shopt -q login_shell; then
    if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" > /dev/null
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
            start_agent;
	}
    else
	start_agent;
    fi
fi

#_____________________________________________________________________________||
export CLICOLOR=YES
eval `dircolors ~/.dircolors`

#_____________________________________________________________________________||
if [ -z "${CMS_PATH:-}" ]; then
    source /uscmst1/prod/sw/cms/shrc prod
fi

#_____________________________________________________________________________||
