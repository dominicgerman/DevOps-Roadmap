# Custom Domain Setup Guide
---

### Step 1: Obtain Droplet’s Public IP
1. Log in to your [DigitalOcean account](https://cloud.digitalocean.com/).
2. Navigate to **Droplets** and note the public IP address of your droplet.

### Step 2: Configure DNS Records
1. Log in to your domain registrar's dashboard.
2. Locate the **DNS settings** for your domain.
3. Add the following DNS records:
   - **Type**: A
     - **Name**: `@`
     - **Value**: `<your-droplet-public-ip>`
   - **Type**: CNAME
     - **Name**: `www`
     - **Value**: `@`

### Step 3: Verify Configuration
1. Allow time for DNS propagation (up to 24 hours).
2. Visit your custom domain (e.g., `https://example.com`) to confirm it's pointing to your DigitalOcean Droplet.

---

## Notes

- Ensure your DNS records are correct and there are no conflicts.
- Use [DNS Checker](https://dnschecker.org/) to verify DNS propagation for your domain.
- If you encounter issues, check your web server and DNS configurations.

