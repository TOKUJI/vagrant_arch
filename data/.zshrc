# path setting
HISTFILE=$HOME/.zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
LISTMAX=1000

autoload -U compinit
compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

umask 022

bindkey -e    # emacs

# history incremental search
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
#setopt extended_history
#unsetopt extended_history
setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space

setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store

unsetopt menu_complete

setopt auto_list
setopt auto_menu
setopt auto_param_keys
setopt auto_resume
#unsetopt no_clobber
#setopt no_unset
setopt nobeep

# prompt & color
autoload -Uz colors
colors
local p_rhst=""
if [[ -n "${REMOTEHOST}${SSH_CONNECTION}" ]]; then
	local rhost='who am i|sed 's/.*(\(.*\)).*/\1/''
	rhost=${rhost#localhost:}
	rhost=${rhost%%.*}
	p_rhst="%B%F{yello}($rhost)%f%b"
fi
local p_cdir="%B%F{blue}[%~]%f%b"$'\n'
local p_info="%n@%m${WINDOW:+"[$WINDOW]"}"
local p_mark="%B%(?,%F{green},%F{red})%(!,#,>)%f%b"
PROMPT=" $p_cdir$p_rhst$p_info $p_mark "

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
function _update_vcs_info_msg() {
	psvar=()
	LANG=en_US.UTF-8 vcs_info
	[[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT="%1(v|%1v|)"

# alias
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -GF"
  ;;
linux*)
  alias ls="ls -F --color"
  ;;
esac
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'

# environment
export LANG=ja_JP.UTF-8
export PATH=./bin:$PATH
export DISPLAY=localhost:0.0

# functions
