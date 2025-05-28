# Output the project ID
output "project_id" {
  value = digitalocean_project.k8s_from_scratch  # Output the project ID
}

# Output the droplet IP address (Control Plane)
output "droplet_ip_control_plane" {
  value = digitalocean_droplet.k8s_from_scratch_control_plane.ipv4_address  # Output the droplet's IPv4 address
}

# Output the droplet IP address (Worker Node 1)
output "droplet_ip_worker_node_1" {
  value = digitalocean_droplet.k8s_from_scratch_worker_node_1.ipv4_address  # Output the droplet's IPv4 address
}

# Output the droplet IP address (Worker Node 2)
output "droplet_ip_worker_node_2" {
  value = digitalocean_droplet.k8s_from_scratch_worker_node_2.ipv4_address  # Output the droplet's IPv4 address
}
