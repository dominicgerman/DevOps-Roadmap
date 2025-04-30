The goal of this project is to introduce you to the basics of IaC using Terraform. You will create a DigitalOcean Droplet and configure it using Terraform.
Requirements

If you have been doing the previous projects, you should already have a Linux server running. If not, setup a Linux server on DigitalOcean, AWS or another cloud provider.

You are required to write a Terraform script that will create a Droplet on DigitalOcean. The Droplet should have a public IP address, and SSH access. You should also be able to SSH into the Droplet using the private key.

You can use this guide from Digital Ocean and Digital Ocean provider documentation to get started.
Stretch goal

Write Ansible playbook that will configure the server. You can use the same playbook from the previous project.

## Usage

> used this [tutorial](https://www.digitalocean.com/community/tutorials/how-to-use-terraform-with-digitalocean)

1. Verify that Terraform is installed on your Mac or PC by running `terraform`
2. Run `terraform init` to initialize a project from the `provider.tf` configuration
3. Run the following command to see the execution plan of what Terraform will attempt based on `www-.tf`:

```sh
terraform plan \
  -var "do_token=${DO_PAT}"
```

4. Then run the following to provision the server:

```sh
terraform apply \
  -var "do_token=${DO_PAT}"
```

5. Run `terraform show terraform.tfstate` to see the state of your environment.
6. Run the following command to destroy the environment:

```sh
terraform destroy \
  -var "do_token=${DO_PAT}"
```
