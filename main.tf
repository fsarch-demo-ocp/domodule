terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

# Create a web server, nyc1, sfo3
resource "digitalocean_droplet" "web" {
  image  = "ubuntu-18-04-x64"
  name   = "${var.do_name}"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
}

output "do_id" {
  value = "${digitalocean_droplet.web.id}"
}

output "do_money" {
  value = "${digitalocean_droplet.web.price_hourly}"
}

output "do_lock" {
  value = "${digitalocean_droplet.web.locked}"
}

output "do_volume" {
  value = "${digitalocean_droplet.web.volume_ids}"
}
