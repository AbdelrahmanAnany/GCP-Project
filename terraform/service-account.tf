resource "google_service_account" "service-account" {
  account_id   = "service-account"
  display_name = "Service Account"
}

resource "google_project_iam_binding" "service-account-binding" {
  project = "imposing-ratio-319309"
  role    = "roles/storage.objectViewer"
  members = ["serviceAccount:${google_service_account.service-account.email}"]

}

resource "google_project_iam_binding" "service-account-binding-2" {
  project = "imposing-ratio-319309"
  role    = "roles/container.admin"
  members = ["serviceAccount:${google_service_account.service-account.email}"]

}
