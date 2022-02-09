/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
resource "google_compute_address" "fw-public-ip" {
  name = "${var.env_prefix}-fw-public-ip"
}
resource "google_compute_instance" "panorama-fw" {
  name           = "${var.env_prefix}-panorama-fw"
  machine_type   = var.fw_machine_type
  can_ip_forward = "true"
  zone           = element(var.zones, 0)
  tags           = ["allow-ssh", "allow-https", "allow-icmp"]
  timeouts {
    create = "10m"
  }

  boot_disk {
    initialize_params {
      image = "image=projects/dax-vpc/global/images/panorama-9-1-2"
      #image = "projects/dax-vpc/global/images/pano"
      type = "pd-ssd"
      size = 150
    }
  }

  metadata = {
    block-project-ssh-keys = "true"
    serial-port-enable     = "true"
    ssh-keys               = join("\n", [for key in var.ssh_keys : "${key.user}:${key.publickey}"])
  }
  service_account {
    scopes = var.scopes_fw
  }
  network_interface {
    subnetwork = google_compute_subnetwork.pan-test.name
    access_config {
      nat_ip = google_compute_address.fw-public-ip.address
    }
  }
  allow_stopping_for_update = true
}

