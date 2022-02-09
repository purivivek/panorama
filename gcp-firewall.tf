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

resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.env_prefix}-allow-ssh"
  network = google_compute_network.management.name
  allow {
    protocol = "tcp"
    ports    = ["22"]

  }
  source_ranges = ["${var.allow_ip}"]
  target_tags   = ["allow-ssh"]
}
resource "google_compute_firewall" "https" {
  name    = "${var.env_prefix}-allow-https"
  network = google_compute_network.management.name
  allow {
    protocol = "tcp"
    ports    = ["443"]

  }
  source_ranges = ["${var.allow_ip}"]
  target_tags   = ["allow-https"]
}
resource "google_compute_firewall" "icmp" {
  name    = "${var.env_prefix}-allow-icmp"
  network = google_compute_network.management.name
  allow {
    protocol = "icmp"
  }
  source_ranges = ["${var.allow_ip}"]
  target_tags   = ["allow-icmp"]
}