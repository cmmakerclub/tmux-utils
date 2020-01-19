# tmux-utils

```
@reboot /usr/local/bin/start-tmux.sh new-session api
*/5 * * * * /usr/bin/tmux send-keys -t api:0.0 'date;/home/nat/.nvm/versions/node/v8.16.0/bin/pm2 restart server' C-m
*/15 * * * * /usr/bin/tmux send-keys -t api:0.1 '/home/nat/restart-telegraf.sh'  C-m
```

# installation

```
curl "https://raw.githubusercontent.com/cmmakerclub/tmux-utils/master/start-tmux.sh" | bash -s install
```
