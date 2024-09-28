############################################################
####################  CUSTOM FUNCTIONS  ####################
############################################################

# Inner Module | Right Bar | Polybar
# Validate IP Address

validateIP () {
    local _IP=$1 _octet=
    [[ $_IP =~ ^[0-9]+(\.[0-9]+){3}$ ]] || return 1
    while read -rd '.' _octet
    do
        (( _octet > 255 )) && return 1
    done <<< "$_IP".
    return 0
}

# Inner Module | Right Bar | Polybar
# Set Target's IP and Hostname

setTarget () {
    local -- _IP=$1 _machineName=$2 \
             _targetFile=/home/al3xbb/.config/bin/target

    (( $# != 2 )) && {
        /bin/cat <<HELP 1>&2

  [!] This function requires two arguments: IP Addresss and Machine Name

    Syntax: setTarget XXX.XXX.XXX.XXX "Machine Name"
HELP
        return 1
    }
    validateIP "$_IP" || {
        printf "\n%s\n" '[!] First arg must be a valid IP Address' 1>&2
        return 1
    }
    [[ -n $_IP && -n $_machineName ]] || {
        printf "\n%s\n" '[!] Args cannot be an empty string' 1>&2
        return 1
    }
    printf "%s:%s\n" "$_IP" "$_machineName" > "$_targetFile"
}

# Inner Module | Right Bar | Polybar
# Clear Target Host's File

clearTarget () {
	local -- _targetFile=/home/al3xbb/.config/bin/target 
	[[ -s $_targetFile ]] && : '' > "$_targetFile" || return 1
}

# Clear Visible Screen and ScrollBack Bufer | Terminal
# https://unix.stackexchange.com/questions/517025/zsh-clear-scrollback-buffer#answer-531178
# Emulates Bash Functionality -> C + alt + L (Clears Screen and Scrollback Buffer)

clearScreenAndScrollback () {
  clear && printf '\e[3J'
  zle && zle .reset-prompt && zle -R
}

zle -N clearScreenAndScrollback       # Function Register as New Widget in ZLE (ZSH Line Editor)
bindkey '^L' clearScreenAndScrollback # Keybind -> C + L runs declared function (Buffer ScrollBack Clear)
#bindkey '^[^L' clearScrollbackBuffer # Keybind -> C + alt + L runs declared function (Buffer ScrollBack Clear)
