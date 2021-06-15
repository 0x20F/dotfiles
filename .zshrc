#: ix-config
#: prefix: &
#: to: $HOME



plugins=(
    git 
    colored-man-pages 
    #zsh-syntax-highlighting 
    #zsh-autosuggestions
    nix-shell
)



ZSH_CUSTOM=$HOME/.config/oh-my-zsh
ZSH_THEME="af-magic"



# Load oh-my-zsh as well
source "$ZSH/oh-my-zsh.sh"
# Source the normal .profile
source "$HOME/.profile"



# Aliases
# ========================= 
alias cat="bat"
alias ls="exa -ah --icons"
alias l="exa -halm --git --icons"





# Useful functions
# =========================
function shell() {
    nix-shell "&{{ paths.shells }}/$1.nix"
}


function flag() {
    alias $1="cd '$PWD'";
}


function showerThought {
    curl -s --connect-timeout 1 -A '/u/A858DE45F56D9BC9' \
        'https://www.reddit.com/r/showerthoughts/top.json?sort=top&t=week&limit=100' | \
        jq -c -r '.d = .data.children['$((RANDOM%100))'].data | "\"\(.d.title)\" \n - u/\(.d.author)" '
}


function banner {
    NAME="$(figlet -f slant 'snowwhite')"
    DATE="$(date)"

    echo "\n\t\t$DATE\n$NAME\n\n" | lolcat -F 0.4
    echo "$(showerThought)"
}





# Enable the starship prompt
eval "$(starship init zsh)"
