variable "region" {
  description = "Location: London (LON1)"
  region = "lon1"
}

variable "size" {
  description = "2 vCPUs, 2GB RAM"
  size = "s-2vcpu-2gb"
}

variable "image" {
  description = "You can change this to any available image (e.g., Ubuntu, CentOS)"
  image  = "ubuntu-24-04-x64"
}
