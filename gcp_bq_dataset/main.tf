
resource "google_bigquery_dataset" "dataset" {
  for_each                    = "${var.ds_list}" 
  project                     = "${var.project_id}" 
  dataset_id                  = "${lookup(var.ds_list, "ds_id")}"
  friendly_name               = "${lookup(var.ds_list, "ds_friendly_name")}"
  description                 = "${lookup(var.ds_list, "ds_description")}"
  location                    = "${lookup(var.ds_list, "ds_location")}"
  default_table_expiration_ms = "${lookup(var.ds_list, "ds_expiration")}"
  labels = {
    env                       = "${var.environnement}"
  }
  access {
    role                      = "OWNER"
    user_by_email             = "${lookup(var.ds_list, "ds_owner")}"
  }
  access {
    role                      = "READER"
    domain                    = "${lookup(var.ds_list, "ds_domain")}"
  }
}

