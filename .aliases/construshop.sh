#!/usr/bin/zsh

alias scp="scp -O ${*}"

alias dep='vendor/bin/dep'

# Gerrit
alias wip="git push origin HEAD:refs/for/master%wip"
alias ready="git push origin HEAD:refs/for/master%ready"