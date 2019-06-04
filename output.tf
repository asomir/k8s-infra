output "k8s-master-ip" {
  value = "${google_compute_instance.k8s_master.network_interface.0.access_config.0.nat_ip}"
}

output "k8s-worker-cri-o-ip" {
  value = "${google_compute_instance.k8s_worker_cri_o.network_interface.0.access_config.0.nat_ip}"
}

output "k8s-worker-docker-ip" {
  value = "${google_compute_instance.k8s_worker_docker.network_interface.0.access_config.0.nat_ip}"
}

output "k8s-worker-containerd-ip" {
  value = "${google_compute_instance.k8s_worker_containerd.network_interface.0.access_config.0.nat_ip}"
}
