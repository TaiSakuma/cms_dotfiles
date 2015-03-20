#!/bin/bash

##____________________________________________________________________________||
# http://samrowe.com/wordpress/ssh-agent-and-gnu-screen/

##____________________________________________________________________________||
#
# How to use:
# run this shell before reattache the scrren
# $ grabssh.sh
# $ screen -d -r
#
# in the screen source fixssh.sh
# $ source ~/fixssh.sh
#
##____________________________________________________________________________||
SSHV="SSH_CLIENT SSH_TTY SSH_AUTH_SOCK SSH_CONNECTION DISPLAY"

for x in ${SSHV} ; do
    (eval echo $x=\$$x) | sed  's/=/="/
                                s/$/"/
                                s/^/export /'
done 1>$HOME/fixssh.sh

##____________________________________________________________________________||
