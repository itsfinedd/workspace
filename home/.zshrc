# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/noreply/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 'ma=48;5;197;1'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:warnings' format "%B%F{red}No matches for:%f %F{magenta}%d%b"
zstyle ':completion:*:descriptions' format '%F{yellow}[-- %d --]%f'
zstyle ':vcs_info:*' formats ' %B%s-[%F{magenta}%f %F{yellow}%b%f]-'

#History
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000
# Bindkeys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

#SOURCES
#
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
#ALIAS
alias ls="lsd -a --group-directories-first"
alias ll="lsd -la --group-directories-first"
alias cat='bat --paging=never'
alias update="yay -Syu --combinedupgrade=false --noconfirm"
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Target commands
function cleartarget(){
        echo "" > /home/$USER/.config/polybar/scripts/target
}

function settarget(){
        echo $1 > /home/$USER/.config/polybar/scripts/target      
}
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Clear history
echo "" > ~/.zhistory

