
variable "project" {
  type    = string
  default = "dax-vpc"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zones" {
  type    = list(string)
  default = ["us-central1-a"]
}
variable "fw_machine_type" {
  type    = string
  default = "e2-custom-6-24576"
}
variable "service_account_key" {
  type    = string
  default = "dax-vpc-5980167a67c1.json"
}

variable "env_prefix" {
  type = string
}
variable "management_cidr" {
  type        = string
  description = "cidr for management_cidr subnet"
  default     = "172.31.199.0/24"
}
variable "allow_ip" {
  type        = string
  description = "allow IP"
  default     = "24.24.24.24"
}

variable "scopes_fw" {
  default = ["https://www.googleapis.com/auth/cloud-platform"]
}
variable "ssh_keys" {
  type = list(object({
    publickey = string
    user      = string
  }))
  description = "list of public ssh keys that have access to the VM"
  default = [
    {
      user      = "admin"
      publickey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDj5a7rqeUPtxHZkGW+O7KdC8dH/B9xf6CiVhyK156Qhpxdt2HfsuKwc4E1FWA83XsOVl1eJ5YuZbI95wfIYNNTQM4c1VSzT/zo21VDdKGj/9XkvZVfspcRWrHlK9kY1bUo8GzyHEQtnfXoE72LdH3piOkItdZsT8OPFmKqsQ89Fn4nr/LBj8Af5Tc+Yyzw+clwL77k52YqiEHZNKU3EQDL8OqzhNrk36eWSY2bMRnUoh4L890JOiZrkBfutX9+IM3YUZt9tNFvxioSXfJ6A9bUSSRh2ua2zey54Ws408Bh0MGp9O8YkrAtPd18Vh4tc+GnSnXKjDOcP+toO+1O3Dxd admin"
    }
  ]
}
