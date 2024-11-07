locals {
  service_accounts = {
    "jenkins_vm" = {
      display_name = "jenkins"
      role         = var.jenkins_role
    }
  }
}

module "network" {
  source = "./modules/network"
  project_id = var.project_id
  region = var.region
  vpc_name = var.vpc_name
  subnets = var.subnets
}

module "service_account" {
  source = "./modules/service_account"

  for_each = local.service_accounts

  account_id = var.account_id
  project_id = var.project_id
  
  display_name = each.value.display_name
  role = each.value.role
}

module "vm" {
  
  source = "./modules/vm"
  vm_name = var.vms["jenkins"].vm_name
  type = var.vms["jenkins"].type
  subnet_id = module.network.subnet_ids["private-subnet"]
  email = module.service_account["jenkins_vm"].service_account_email

}

module "firewall" {
  source = "./modules/firewall"
  rules = var.firewall_rules
  network = module.network.vpc_network_name
}


module "load-balance" {
  source = "./modules/load_balancer"
  network = module.network.vpc_network_name
  jenkins_link = module.vm.vm_link
}