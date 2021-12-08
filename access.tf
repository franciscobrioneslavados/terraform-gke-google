resource "google_project_access_approval_settings" "project_access_approval" {
  project_id          = var.project_id
  notification_emails = ["fbriones@mits.cl"]

  enrolled_services {
      cloud_product = "all"
      enrollment_level = "BLOCK_ALL"
  }
}