# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

#Verifica script de git prompt
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
fi


get_ip() {
    # Obtiene la IP IPv4 de la interfaz principal (puedes cambiar 'ip route' para elegir otra)
    ip addr show $(ip route get 1.1.1.1 | awk '{print $5}') 2>/dev/null | 
    grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -1
}


PS1='\[\e[44;38m\]\u@$(get_ip):\w \[\e[45;32m\]$(__git_ps1 "(%s)")\[\e[0m\]\n >\$\[\e[0m\] '

export PATH=$PATH:/opt/gradle/gradle-8.14/bin

export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH=$JAVA_HOME/bin:$PATH
alias cls='clear; ls -al'
alias all='ls -al'
