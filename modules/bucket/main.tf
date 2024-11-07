resource "random_id" "suffix" {
  byte_length = 4  
}

locals {
  random_name = "${var.name}-${random_id.suffix.hex}"
}

resource "google_storage_bucket" "static-site" {
  name          = local.random_name
  location      = var.location
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["*"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
  public_access_prevention = "enforced"
}