#!/usr/bin/env bash
# Author
author="Philip Mello <@Microsoft>"
# Version
version="1.0"
# License
license="MIT"
# Date
current_date=$(date +'%b %d, %Y')
# GitHub
github='https://github.com/PhilipMello/kubernetes-from-scratch'

script="Kubernetes from scratch"
description="Automation bash script for Kubernetes from scratch"

echo "
 _  _____   _____   $version
| |/ / _ \ / ____|  $current_date
| ' / (_) | (___    $author
|  < > _ < \___ \   $license
| . \ (_) |____) |
|_|\_\___/|_____/ 
$github                         

# --------------------------------------------------------------
# Script     : $script
# Description: $description
# --------------------------------------------------------------
# How to use: Execute k8s-automation.sh
# Exemples:
# Manual: k8s-automation.sh -h OR k8s-automation.sh --h OR k8s-automation.sh --help
# --------------------------------------------------------------
"
WHITE=""
BLUE="\033[97;104m"
YELLOW="\033[97;103m"
CYAN="\033[97;106m"
MAGENTA="\033[97;45m"
GREEN="\033[97;102m"
RED="\033[97;41m"
ENDCOLOR="\e[0m"

# Step 1: Ensure the required kernel modules are loaded at boot for containerd
echo "Configuring required kernel modules..."
cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

# Step 2: Load the required kernel modules immediately
echo "Loading required kernel modules..."
sudo modprobe overlay && \
sudo modprobe br_netfilter

# Step 3: Configure sysctl settings for Kubernetes CRI
echo "Configuring sysctl settings for Kubernetes CRI..."
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

# Step 4: Apply sysctl settings to the system
echo "Applying sysctl settings..."
sudo sysctl --system

# Step 5: Add Docker's official GPG key
echo "Adding Docker's official GPG key..."
sudo apt-get update && \
sudo apt-get install ca-certificates curl && \
sudo install -m 0755 -d /etc/apt/keyrings && \
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Step 6: Add the Docker repository to Apt sources
echo "Adding Docker repository to APT sources..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
sudo apt-get update

# Step 7: Install containerd package
echo "Installing containerd..."
sudo apt update && sudo apt install containerd.io -y

# Step 8: Generate containerd default configuration
echo "Generating containerd default configuration..."
sudo mkdir -p /etc/containerd && containerd config default | sudo tee /etc/containerd/config.toml

# Step 9: Enable SystemdCgroup in containerd configuration
echo "Enabling SystemdCgroup in containerd configuration..."
sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml

# Step 10: Restart containerd to apply configuration changes
echo "Restarting containerd service..."
sudo systemctl restart containerd

# Step 11: Add Kubernetes APT repository GPG key
echo "Adding Kubernetes APT GPG key..."
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.33/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Step 12: Add Kubernetes repository to sources list
echo "Adding Kubernetes repository to APT sources list..."
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.33/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Step 13: Install Kubernetes components (kubelet, kubeadm, kubectl)
echo "Installing Kubernetes components..."
sudo apt-get update && \
sudo apt-get install -y kubelet kubeadm kubectl && \
sudo apt-mark hold kubelet kubeadm kubectl

# Step 14: Initialize Kubernetes master node
echo "Initializing Kubernetes master node with kubeadm..."
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 | tee /root/kubeadm-init-output.log

# Step 15: Save the kubeadm join command to a file (for worker nodes to join)
echo "Saving join command for worker nodes..."
kubeadm token create --print-join-command > /root/join.txt
