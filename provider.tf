provider "google" {
  project = "ops-munir-kakar"
  region  = "europe-west2"
}

terraform {
  backend "gcs" {
    bucket = "munir-terraform-state"
    prefix = "ops-munir-kakar"
  }
}