export PATH="$HOME/bin:$PATH"

# Use Japanese
export LANG=ja_JP.UTF-8

# Colors
autoload -Uz colors
colors

# Completions
fpath=(/usr/local/share/zsh-completions $fpath)
autoload -U compinit
compinit -u
setopt nolistbeep
setopt auto_menu
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# KeyBinding
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
bindkey "^[[3~" delete-char
stty erase "^?"
stty erase ^H
setopt no_flow_control

# History
setopt share_history
setopt histignorealldups

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward

autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end

# cd
setopt auto_cd
chpwd() { ls -ltrG }
cdpath=(~)

autoload -Uz add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ":chpwd:*" recent-dirs-default true

function mkcd() {
  if [[ -d $1 ]]; then
    echo "$1 already exists!"
    cd $1
  else
    mkdir -p $1 && cd $1
  fi
}

# pushd
setopt auto_pushd
setopt pushd_ignore_dups

# Missed command
setopt correct

# select-word-style
autoload -Uz select-word-style
select-word-style default
zstyle ':zle:*' word-chars "_-./;@"
zstyle ':zle:*' word-style unspecified

# mv multiple files
autoload -Uz zmv
alias zmv='noglob zmv -W'

# PROMPT
PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color} at ${fg[blue]}%m${reset_color} in ${fg[green]}%~${reset_color} ${vcs_info_msg_0_}
%# "

source .zshrc.alias
source .zshrc.git

# direnv
eval "$(direnv hook zsh)"
export EDITOR=vim

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init - zsh)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# rbenv
eval "$(rbenv init -)"
