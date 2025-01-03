## Steps Taken

- I logged into an Ubuntu server node on my home network and ran the install script for Netdata: `curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh && sh /tmp/netdata-kickstart.sh`
- After it finished installing, I navigated to http://NODEIP:19999 and found the Netdata dashboard web UI.
- I installed `iperf3` and `stress` to use in my `test_dashboard.sh` script.
- Upon running the test script, I was able to observe the CPU usage spike as well as the disk usage, RAM, and network I/O from the web UI.
