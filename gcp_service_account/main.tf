
resource "google_service_account" "service_account" {
  for_each     = "${var.sa_list}" 
  account_id   = "${lookup(var.sa_list, "sa_id)}"
  display_name = "${lookup(var.sa_list, "sa_disp_name)}"
  project      = "${var.project_id}" 
}

