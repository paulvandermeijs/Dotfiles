export PATH=~/.composer/vendor/bin:~/Library/Android/sdk/platform-tools:$PATH

export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(docker git npm rust)

source $ZSH/oh-my-zsh.sh

prompt_context() {}

prompt_dir() {
  prompt_segment '#121926' '#99A4B8' '%c'
}

export WORKSPACE_HOME=~/Workspace
export HELIX_HOME=$WORKSPACE_HOME/helix

alias hx="HELIX_RUNTIME=$HELIX_HOME/runtime $HELIX_HOME/target/release/hx"
alias mr="glab mr create -fy -a god --remove-source-branch"
alias wrk="$WORKSPACE_HOME/wrk/target/release/wrk"
alias owrk='wrk -o'
alias twrk="wrk -x 'tmux new -As \$(pwd | awk -F/ \"{ print \\\$NF }\")'"
alias cwrk="wrk -x 'code .'"
alias jira='TERM=screen-256color jira'
alias htop='TERM=screen-256color htop'
alias ssh='TERM=screen-256color ssh'

tmux() {
  if [ "$#" -eq 0 ]
    then command tmux new -s $(pwd | awk -F/ '{ print $NF }')
    else command tmux "$@"
  fi
}

mf() {
  if [ $# -lt 1 ]; then
    echo "Error: Argument missing, please enter the filename with fullpath.";
    return 1;
  fi

  for file_path_info in "$@"; do
    mkdir -p -- "$(dirname -- "$file_path_info")"
    touch -- "$file_path_info"
  done
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load zsh-syntax-highlighting; should be last.
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
