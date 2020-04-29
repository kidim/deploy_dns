
output "service_account_output" {
  value = "${google_service_account.service_account.email}"
}
