# Configure the Google Cloud provider
provider "google" {
  project = "gentle-dominion-245803"
  region  = "asia-northeast1"
}

# Create a GKE cluster
resource "google_container_cluster" "primary" {
  name     = "hello-world-cluster-tokyo"
  location = "asia-northeast1-a"
  
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  # Specify the control plane version
  min_master_version = "1.29.4-gke.1043002"

  # Network configuration
  network    = "default"
  subnetwork = "default"

  # IP allocation policy
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/14"
    services_ipv4_cidr_block = "/20"
  }

  # Disable some features to match the image
  vertical_pod_autoscaling {
    enabled = false
  }

  # Enable Workload Identity
  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }
}

# Create a separately managed node pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = "asia-northeast1-a"
  cluster    = google_container_cluster.primary.name
  node_count = 2

  node_config {
    preemptible  = false
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

# Create a service account for the nodes
resource "google_service_account" "default" {
  account_id   = "gke-node-sa"
  display_name = "GKE Node Service Account"
}

# Grant necessary permissions to the service account
resource "google_project_iam_member" "node_sa_permissions" {
  project = var.project_id
  role    = "roles/container.nodeServiceAccount"
  member  = "serviceAccount:${google_service_account.default.email}"
}

# Variables
variable "project_id" {
  description = "The project ID to deploy to"
  default     = "gentle-dominion-245803"
}
