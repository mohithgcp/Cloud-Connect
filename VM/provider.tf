terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.39.0"
    }
  }
}

provider "google" {
  # Configuration options
  project ="terraform-playground-364808"
  region="us-central1"
  zone="us-central1-a"
  credentials = "keys.json"
}

