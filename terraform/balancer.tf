resource "yandex_alb_load_balancer" "app-balancer" {
  name = "my-load-balancer"

  network_id = yandex_vpc_network.net.id

  allocation_policy {
    location {
      zone_id   = "ru-central1-a"
      subnet_id = yandex_vpc_subnet.subnet.id
    }
  }

  listener {
    name = "my-listener"
    endpoint {
      address {
        external_ipv4_address {

        }
      }
      ports = [3000]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.router.id
      }
    }
  }

  log_options {
    discard_rule {
      http_code_intervals = ["HTTP_ALL"]
      discard_percent     = 75
    }
  }
}

resource "yandex_alb_target_group" "target-group" {
  name      = "my-target-group"
  folder_id = var.yc_folder_id

  target {
    subnet_id  = yandex_vpc_subnet.subnet.id
    ip_address = yandex_compute_instance.vm-1.network_interface.0.ip_address
  }

  target {
    subnet_id  = yandex_vpc_subnet.subnet.id
    ip_address = yandex_compute_instance.vm-2.network_interface.0.ip_address
  }
}

resource "yandex_alb_backend_group" "backend-group" {
  name = "my-backend-group"

  http_backend {
    name             = "http-backend"
    weight           = 1
    port             = 3000
    target_group_ids = ["${yandex_alb_target_group.target-group.id}"]
  }
}

resource "yandex_vpc_network" "net" {
  name = "network"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = ["192.168.192.0/24"]
}
