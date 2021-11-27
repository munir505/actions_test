resource "google_storage_bucket" "gcs_bucket" {
  name     = "test-bucket-munir-actions"
  location = "EU"
}

resource "google_compute_instance" "actions_test" {
  name         = "actions-test"
  machine_type = "n1-standard-1"
  zone         = "europe-west2-c"
}