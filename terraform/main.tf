data "yandex_compute_image" "img" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "vm-1" {
  name        = "test"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.img.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh}"
  }
}

resource "yandex_compute_instance" "vm-2" {
  name        = "test-2"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.img.id
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh}"
  }
}

resource "yandex_vpc_address" "addr" {
  name = "exampleAddress"

  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}

resource "yandex_alb_http_router" "router" {
  name = "my-http-router"
}

output "vm-1_external_ip" {
  value = yandex_compute_instance.vm-1.network_interface[0].nat_ip_address
}

output "vm-2_external_ip" {
  value = yandex_compute_instance.vm-2.network_interface[0].nat_ip_address
}

# resource "yandex_organizationmanager_user_ssh_key" "ssh_key" {
#   organization_id = "some_organization_id"
#   subject_id      = "some_subject_id"
#   data            = var.ssh
# }


