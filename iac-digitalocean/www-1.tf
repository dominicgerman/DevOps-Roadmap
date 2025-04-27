resource "digitalocean_droplet" "www-1" {
  image = "ubuntu-20-04-x64"
  name = "www-1"
  region = "nyc3"
  size = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.m2-air.id
  ]
  
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    agent = true
    timeout = "2m"
  }
  
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt update",
      "sudo apt install -y nginx"
    ]
  }
}
