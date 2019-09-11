#!/bin/bash
SHELL=/bin/bash
VERSION=0.0.1
usage() {
        cat <<EOF
start-tmux $VERSION
Usage: $0 [new-session|-v|--help]
EOF
        exit 1
} 

case "$1" in
        --help|help) usage;;
        -v|version) 
            echo "$VERSION"
        ;;
        new-session) 
          if [ $# -le 1 ]; then
                echo "No arguments supplied"
                exit -1
          fi

          args=("$@")
          NAME="${args[1]}"
          tmux new-session -s $NAME -d

          if [ $? -eq 0 ]; then
              tmux split-window -h -p 45 -t $NAME
              tmux select-pane -L
              tmux split-window -v -p 30 -t $NAME
              tmux send-keys -t $NAME:0.1 'cd ~' C-m
              tmux send-keys -t $NAME:0.2 'cd ~' C-m
              # tmux list-sessions
              tmux list-windows -a
          fi

        ;;
        # autossh) 
        #   source /home/pi/autossh-script/subtasks/_autossh.sh;
        #   autossh_fn $2;;
        *) usage;;
esac

# #source /home/pi/.profile
# #workon serial
