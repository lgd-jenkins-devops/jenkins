module "network" {
  source = "./modules/network"
  project_id = var.project_id
  region = var.region
  vpc_name = var.vpc_name
  subnets = var.subnets
}

module "service_account" {
  source = "./modules/service_account"

  for_each = var.service_accounts

  account_id = var.account_id
  project_id = var.project_id
  
  display_name = each.value.display_name
  role = each.value.role
}