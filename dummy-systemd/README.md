## Steps Taken

- I created the dummy.sh script, made it executable, and moved it to `/usr/local/bin/`
- I then created the systemd service: 
`/etc/systemd/system/dummy.service`
```ini
[Unit]
Description=Dummy Service
After=network.target

[Service]
ExecStart=/usr/local/bin/dummy.sh
Restart=always
RestartSec=5
User=root
StandardOutput=append:/var/log/dummy.log
StandardError=append:/var/log/dummy.log

[Install]
WantedBy=multi-user.target
```
- Then I reloaded the daemon, enabled the service, and started it:
```bash
sudo systemctl daemon-reload
sudo systemctl enable dummy.service
sudo systemctl start dummy.service
```

- I checked the status and verified the logs:
```bash
sudo systemctl status dummy.service
cat /var/log/dummy.log
```
