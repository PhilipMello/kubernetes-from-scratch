variable "region" {
  description = "Location: London (LON1)"
  type = string
  default = "lon1"
}

variable "size" {
  description = "2 vCPUs, 2GB RAM"
  type = string
  default = "s-2vcpu-2gb"
}

variable "image" {
  description = "You can change this to any available image (e.g., Ubuntu, CentOS)"
  type = string
  default = "ubuntu-24-04-x64"
}

variable ssh_keys {
  description = "Replace with your actual SSH key ID or list of IDs"
  type = string
  default = "1234567890"
}
