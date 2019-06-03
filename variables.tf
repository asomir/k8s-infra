variable public_key_path {
  description = "Path to the public key used to connect to instance"
  default     = "/Users/vegas/.ssh/id_rsa.pub"
}

variable private_key_path {
  description = "Path to the private key used to connect to instance"
  default     = "/Users/vegas/.ssh/id_rsa"
}

variable project {
  description = "Project"
  default     = "k8s-sandbox-241113"
}

variable region {
  description = "Region"
  default     = "europe-west2"
}

variable zone {
  description = "Zone"
  default     = "europe-west2-b"
}
