terraform {
  required_version = "~> 0.11, < 0.12"
  credentials = "${file(".gce-account.json")}"
}

provider "google" {
  credentials = "${file(".gce-account.json")}"
  project = "${var.project}"
  region  = "${var.region}"
  zone    = "${var.zone}"
}
