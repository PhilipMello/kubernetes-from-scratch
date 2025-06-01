terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.54.0"
    }
  }
}

provider "digitalocean" {
  token = "YOUR_DIGITALOCEAN_TOKEN_HERE"
}

# Create a DigitalOcean Project
resource "digitalocean_project" "k8s_from_scratch" {
  name        = "k8s-from-scratch"          # Name of the project
  description = "Kubernetes from Scratch"   # Optional description
  purpose     = "Studying"                  # Purpose of the project, such as "Web App", "Database", etc.
  environment = "Development"
  resources = [
    digitalocean_droplet.k8s_from_scratch_control_plane.urn, 
    digitalocean_droplet.k8s_from_scratch_worker_node_1.urn, 
    digitalocean_droplet.k8s_from_scratch_worker_node_2.urn
    ]

}


