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

* Adding Docker Repo:
  ```bash
  # Add Docker's official GPG key:
  sudo apt-get update && \
  sudo apt-get install ca-certificates curl && \
  sudo install -m 0755 -d /etc/apt/keyrings && \
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
  sudo chmod a+r /etc/apt/keyrings/docker.asc
  
  # Add the repository to Apt sources:
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
  sudo apt-get update
  ```
  * Installing Containerd:
  ```bash
  sudo apt update && sudo apt install containerd.io -y
  ```

* Setting up default configuration for Containerd:
  ```bash
  sudo mkdir -p /etc/containerd && containerd config default | sudo tee /etc/containerd/config.toml 
  ```
* Configuring systemd cgroup driver:
  ```bash
  sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml
  ```
* Restating Containerd:
```bash
sudo systemctl restart containerd
```
---
* Downloading Kubernetes GPG Key:
```bash
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.33/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
```
* Adding Kubernetes Repo:
```bash
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.33/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
```
* Updaying Repo and installing Kubernetes Tools:
```bash
sudo apt-get update && \
sudo apt-get install -y kubelet kubeadm kubectl && \
sudo apt-mark hold kubelet kubeadm kubectl
```
---
## RUN ONLY ON CONTROL PLANE:
```bash
kubeadm init
```
COPY THE OUTPUT AND PASTE IN THE NODES TO JOIN THE CLUSTER:
```bash
RUN ONLY ON NODES:
Example: kubeadm join 99.999.999.99:6443 --token xxxx.xxxxxxxxx --discovery-token-ca-cert-hash sha256:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```
* Installing CNI - RUN ONLY ON CONTROL PLANE:
```bash
kubectl apply -f  https://raw.githubusercontent.com/projectcalico/calico/v3.30.0/manifests/calico.yaml
```

# DONE, YOUR KUBERNETES CLUSTER IS READY!!!
TESTING USING:
```bash
kubectl get nodes
```

# 2- Bash Automation
[Bash Automation](https://github.com/PhilipMello/kubernetes-from-scratch/blob/main/k8s-automation.sh)

# 3- Ansible Automation
__Under deployment__
