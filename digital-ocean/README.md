## 1. Create your API token:
[Digital Ocean API token](https://cloud.digitalocean.com/account/api/tokens)

## 2. Get your SSH Key ID:
```bash
curl -X GET -H "Authorization: Bearer YOUR_DIGITALOCEAN_TOKEN" "https://api.digitalocean.com/v2/account/keys"
```
The id shloud be in: {"ssh_keys":[{"id":__010101010__,

## 3. Go to terraform folder
* 3.1 - Initiate terraform
```tf
terraform init
```
* 3.2 - Check changes
```tf
terraform plan
```
* 3.3 - After check all changes, apply changes
```tf
terraform apply
```
* 3.4 - To delete as resources from Digital Ocean Cloud
```tf
terraform destroy
```
