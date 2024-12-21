resource "null_resource" "generate_inventory" {
  provisioner "local-exec" {
    command = <<EOT
cat > ../ansible/inventory.ini <<EOF
[servers]
server1 ansible_host=${yandex_compute_instance.vm-1.network_interface[0].nat_ip_address} ansible_user=ubuntu
server2 ansible_host=${yandex_compute_instance.vm-2.network_interface[0].nat_ip_address} ansible_user=ubuntu
EOF
EOT
  }
  depends_on = [
    yandex_compute_instance.vm-1,
    yandex_compute_instance.vm-2
  ]
}
