# Create a DigitalOcean Droplet (Control-Plane)
resource "digitalocean_droplet" "k8s_from_scratch_control_plane" {
  name   = "control-plane"  # Droplet Name (VM)
  region = var.region       # Location: London (LON1)
  size   = var.size         # 2 vCPUs, 2GB RAM
  image  = var.image        # You can change this to any available image (e.g., Ubuntu, CentOS)
  ssh_keys = [var.ssh_keys] # Replace with your actual SSH key ID or list of IDs
  tags = ["k8s", "kuberntes", "from-scratch", "control-plane"]

}

# Worker Node #1
resource "digitalocean_droplet" "k8s_from_scratch_worker_node_1" {
  name   = "worker-node-1"  # Droplet Name (VM)
  region = var.region       # Location: London (LON1)
  size   = var.size         # 2 vCPUs, 2GB RAM
  image  = var.image        # You can change this to any available image (e.g., Ubuntu, CentOS)
  ssh_keys = [var.ssh_keys] # Replace with your actual SSH key ID or list of IDs
  tags = ["k8s", "kuberntes", "from-scratch", "worker-node-1"]

}

# Worker Node #2               
resource "digitalocean_droplet" "k8s_from_scratch_worker_node_2" {
  name   = "worker-node-2"  # Droplet Name (VM)
  region = var.region       # Location: London (LON1)
  size   = var.size         # 2 vCPUs, 2GB RAM
  image  = var.image        # You can change this to any available image (e.g., Ubuntu, CentOS)
  ssh_keys = [var.ssh_keys] # Replace with your actual SSH key ID or list of IDs
  tags = ["k8s", "kuberntes", "from-scratch", "worker-node-2"]

}
