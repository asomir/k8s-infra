resource "google_compute_instance" "k8s_master" {
  name         = "k8s-master"
  machine_type = "n1-standard-2"
  tags         = ["k8s-master"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {
    }
  }

  metadata {
    ssh-keys = "k8s-user:${file(var.public_key_path)}"
  }
}

resource "google_compute_instance" "k8s_worker_cri_o" {
  name         = "k8s-worker-cri-o"
  machine_type = "n1-standard-2"
  tags         = ["k8s-worker-cri-o"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {
    }
  }

  metadata {
    ssh-keys = "k8s-user:${file(var.public_key_path)}"
  }
}

resource "google_compute_instance" "k8s_worker_docker" {
  name         = "k8s-worker-docker"
  machine_type = "n1-standard-2"
  tags         = ["k8s-worker-docker"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {
    }
  }

  metadata {
    ssh-keys = "k8s-user:${file(var.public_key_path)}"
  }
}

resource "google_compute_instance" "k8s_worker_containerd" {
  name         = "k8s-worker-containerd"
  machine_type = "n1-standard-2"
  tags         = ["k8s-worker-containerd"]

  boot_disk {
    initialize_params {
      image = "ubuntu-1604-lts"
    }
  }

  network_interface {
    network = "default"

    access_config {
    }
  }

  metadata {
    ssh-keys = "k8s-user:${file(var.public_key_path)}"
  }
}

resource "null_resource" "ansible" {
  depends_on = ["google_compute_instance.k8s_master", "google_compute_instance.k8s_worker_cri_o", "google_compute_instance.k8s_worker_docker", "google_compute_instance.k8s_worker_containerd"]

  provisioner "local-exec" {
    command = "ansible-playbook ansible/cluster.yml"
  }
}
