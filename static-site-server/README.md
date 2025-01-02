## Requirements

- Register and setup a remote linux server on any provider.
- Make sure that you can connect to your server using SSH.
- Install and configure nginx to serve a static site.
- Create a simple webpage with basic HTML, CSS and image files.
- Use rsync to update a remote server with a local static site.

## What I Did
- I set up a t2.micro EC2 instance via the AWS CLI. 
- I added two ssh key pairs, one for my mac one for my linux laptop.
- I set up nginx and created an html file at `var/www/html/index.html`
- Wrote a script `deploy.sh` which uses rsync to sync my local files to the server.
- I had to change some permissions on the ec2 instance so that rysnc could write to the html directory

```bash
sudo chown -R ec2-user:ec2-user /var/www/html
sudo chmod -R 755 /var/www/html
```

If you want to run `deploy.sh` yourself, you'll want to change those permissions on whatever vps you have. You'll also want a .env file with two variables ($SSH_KEY_PATH and $REMOTE_HOST) set to the ssh key path for your local machine and the the ip address for you remote server. 
