| ![Manual Installation](https://img.icons8.com/?size=100&id=cvzmaEA4kC0o&format=png&color=000000) | ![Bash Automation](https://img.icons8.com/?size=100&id=cvzmaEA4kC0o&format=png&color=000000)  | ![Ansible Automation](https://img.icons8.com/?size=100&id=cvzmaEA4kC0o&format=png&color=000000)  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |------------------------------------------------------------ |
| [Manual Installation](#manual-installation)                     | [Bash Automation](#bash-automation)  | [Ansible Automation](#bash-automation)  |

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

---

# 1- Manual installation:

* Enabling kernel modules for Containerd:
  ```bash
  cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
  overlay
  br_netfilter
  EOF
  ```
  * Apply changes:
    ```bash
    sudo modprobe overlay
    sudo modprobe br_netfilter
    ```

* Setting up sysctl parameters:
  ```bash
  cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
  net.bridge.bridge-nf-call-iptables  = 1
  net.ipv4.ip_forward                 = 1
  net.bridge.bridge-nf-call-ip6tables = 1
  EOF
  ```
  * Apply changes:
    ```bash
    sudo sysctl --system
    ```

* Update and Upgrade the system
  ```bash
  sudo apt update -y && apt upgrade -y
  ```

# 2- Bash Automation
__Under deployment__

# 3- Ansible Automation
__Under deployment__
