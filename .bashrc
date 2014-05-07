export EDITOR='vim'
export TERM=xterm-256color

alias ls='ls -FG'
alias tmux="tmux -2"
alias dnsreset='sudo killall -HUP mDNSResponder'
source ~/.git-prompt.sh
source /usr/local/opt/chruby/share/chruby/chruby.sh
function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi=32
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi=34
        else
            local ansi=33
        fi  
        echo -n '\[\e[0;33;'"$ansi"'m\]'"$(__git_ps1)"'\[\e[0m\]'
    fi
}

function _prompt_command() {
  PS1="[\[\033[32m\]\w\[\033[0m\]]\[\033[0m\]\n\[\033[1;36m\]\u@\[\033[0;37m\]\h]`_git_prompt`\[\033[1;33m\]-> \[\033[0m\]"
}

PROMPT_COMMAND=_prompt_command

