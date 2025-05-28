terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.54.0"
    }
  }
}

provider "digitalocean" {
  token = "your_digitalocean_token_here"
}

# Create a DigitalOcean Project
resource "digitalocean_project" "k8s_from_scratch" {
  name        = "k8s-from-scratch"    # Name of the project
  description = "Kubernetes from Scratch"   # Optional description
  purpose     = "Studying"    # Purpose of the project, such as "Web App", "Database", etc.
  environment = "Development"
}


