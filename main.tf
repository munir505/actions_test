resource "google_storage_bucket" "gcs_bucket" {
  name     = "test-bucket-munir-actions"
  location = "EU"
}

resource "google_compute_instance" "actions_test" {
  name         = "actions-test"
  zone         = "europe-west2-c"
  machine_type = "n1-standard-2"

  network_interface {
    subnetwork = "projects/ops-munir-kakar/regions/europe-west2/subnetworks/default"
  }

  boot_disk {
    auto_delete = "false"
    source      = google_compute_disk.actions_test_disk.self_link
  }
}

resource "google_compute_disk" "actions_test_disk" {
  name  = "actions-test-disk"
  type  = "pd-ssd"
  zone  = "europe-west2-c"
  size  = 100
  image = "debian-8-jessie-v20170523"
}

module "module_test" {
  source = "./modules/instance"

  machineName  = "testmodule1"
  bootDiskName = "testModuleDisk"
}