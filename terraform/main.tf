resource "google_compute_instance" "vm_instance" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  //scratch_disk {
  //  interface = "SCSI"
  //}

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    ssh-keys = "vanegas1234:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDUYpVUkOwXleUDBk8M6A6a1pqCNv0u0LXcre6pBz/7mlSNmZYP098Z4eDxRxkZFBtsYGDu2vPQl9TXZE4v1F7Wsx0Nuoo6qoZPzMf4qz7j0Vb6I+2flxh08JR+Wyi8xjqfz2GONqYEySLwigiqjBf6+zkr3pH6C/f7f1uBogMDezHVI/0F8oAydLZ40gIyQkBpqhy73MWdLCYYkGTVBFoY0pKpxT/DxhIqjkXhhNLXc2vh5SuDKUZBVn2WR9q6k8sW06IZp7Zk2F7sr3P1CR0EEm3vcVWkSt3+issRpG2x1DDdp9Lve0r6YB0NI2+CzeDMSoNKEcJZrpGAzq3wHOFT vanegas1234"
  }

  metadata_startup_script = "echo hi > /test.txt"

}