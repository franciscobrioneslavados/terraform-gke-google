terraform {
  backend "gcs" {
    credentials = "./terraform-gkecluster-keyfile.json"
    bucket      = "tf-state-st"
    prefix      = "terraform/state"
  }
}