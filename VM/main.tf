resource "google_compute_instance" "vm-from-tf" {
  name = "vm-from-tf"
  zone = "asia-southeast1-a"
  machine_type = "e2-standard-2"
  allow_stopping_for_update = true
  network_interface {
    network = "custom-vpc-tf"
    subnetwork = "sub-sg"
  }
  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20220920"
      size = 20
    }
  }
  labels = {
    "env" = "tflearning"
  }
  lifecycle {
    ignore_changes = [
      attached_disk   
    ]
  }
}

resource "google_compute_disk" "disk-from-tf" {
  name="disk-from-tf"
  size = 16
  zone = "asia-southeast1-a"
  type = "pd-ssd"
}
resource "google_compute_attached_disk" "adisk" {
  disk = google_compute_disk.disk-from-tf.id
  instance = google_compute_instance.vm-from-tf.id
}
