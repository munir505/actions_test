resource "google_compute_instance" "modules_test" {
  name         = var.machineName
  zone         = "europe-west2-c"
  machine_type = "n1-standard-2"

  network_interface {
    subnetwork = "projects/ops-munir-kakar/regions/europe-west2/subnetworks/default"
  }

  boot_disk {
    auto_delete = "false"
    source      = google_compute_disk.module_test_disk.self_link
  }
}

resource "google_compute_disk" "module_test_disk" {
  name  = var.bootDiskName
  type  = "pd-ssd"
  zone  = "europe-west2-c"
  size  = 100
  image = "debian-8-jessie-v20170523"
}