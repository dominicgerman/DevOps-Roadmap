# configuration-management

The goal of this project is to write an Ansible playbook to configure a Linux server.

## Requirements

Write an Ansible playbook called setup.yml and create the following roles:

- base — basic server setup (installs utilities, updates the server, installs fail2ban, etc.)
- nginx — installs and configures nginx
- app — uploads the given tarball of a static HTML website to the server and unzips it.
- ssh - adds the given public key to the server

The inventory file (inventory.ini) should include the server you are going to configure When you run the playbook, it should run the roles above in sequence. You should also assign proper tags to the roles so that you can run only specific roles. I gitignored the inventory file with my actual servers IP.

Example:

```sh
# Run all the roles
ansible-playbook setup.yml

# Run only the app role
ansible-playbook setup.yml --tags "app"
```

I also set up an ansible vault but nothing is in it right now. However, it does mean you need to run the above commands with `--ask-vault-password` otherwise it will throw an error about not being able to decrypt the vault.

One other thing in case I ever reference this again -- the reloading of nginx wasn't working quite as expected. I just manually restarted nginx after the playbook finished as I wasn't seeing the new site.

[https://roadmap.sh/projects/configuration-management](https://roadmap.sh/projects/configuration-management)
