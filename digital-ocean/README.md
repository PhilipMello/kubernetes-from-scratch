## 1. Create your API token:
[Digital Ocean API token](https://cloud.digitalocean.com/account/api/tokens)

## 2. Get your SSH Key ID:
```bash
curl -X GET -H "Authorization: Bearer YOUR_DIGITALOCEAN_TOKEN" "https://api.digitalocean.com/v2/account/keys"
```
The id shloud be in: {"ssh_keys":[{"id":__010101010__,
