# remote_server_setup

## Objective
Set up a remote Linux server with secure SSH access using two different SSH key pairs and configure SSH client settings for convenient login.

## Steps

### 1. Server Provisioning
- I chose the cloud provider Hetzner because they have great pricing
- I created an Ubuntu node and noted the server's public IP address

### 2. Generated SSH Key Pairs
Generated two separate SSH key pairs:
```bash
# First SSH key pair
ssh-keygen -t ed25519 -f ~/.ssh/server_key1

# Second SSH key pair
ssh-keygen -t ed25519 -f ~/.ssh/server_key2
```

### 3. Configured Server SSH Access
- Added public keys to server's `~/.ssh/authorized_keys`
- Configured SSH server settings for key-based authentication

### 4. SSH Config Setup
Edited `~/.ssh/config`:
```bash
Host myserver
    HostName <server-ip>
    User <username>
    IdentityFile ~/.ssh/server_key1
    IdentityFile ~/.ssh/server_key2
```

## Verification
Verified SSH access using:
```bash
# Using specific key
ssh -i ~/.ssh/server_key1 user@server-ip

# Using SSH config alias
ssh myserver
```
https://roadmap.sh/projects/ssh-remote-server-setup
