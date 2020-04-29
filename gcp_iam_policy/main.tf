
data "google_iam_policy" "iam_policies" {
  binding {
    for_each     = "${var.iam_policies}" 
    role         = "${lookup(var.iam_policies, "iam_role")}"
    members      = "${lookup(var.iam_policies, "iam_members")}"
  }
  // binding {
  //   for_each     = "${var.service_account_output}" 
  //   role         = "${element(var.service_account_output, *)}"
  //   members      = "${lookup(var.service_account_output, *)}"
  // }
  #audit_config {}
}