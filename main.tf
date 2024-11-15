locals {
  service_accounts = {
    "jenkins_vm" = {
      display_name = "jenkins"
      role         = var.jenkins_role
    }
  }
}

module "network" {
  source = "git@github.com:lgd-jenkins-devops/terraform-modules.git//network?ref=v1.0.0"
  project_id = var.project_id
  region = var.region
  vpc_name = var.vpc_name
  subnets = var.subnets
}

module "service_account" {
  source = "git@github.com:lgd-jenkins-devops/terraform-modules.git//service_account?ref=v1.0.0"

  for_each = local.service_accounts

  account_id = var.account_id
  project_id = var.project_id
  
  display_name = each.value.display_name
  role = each.value.role
}

module "vm" {
  
  source = "git@github.com:lgd-jenkins-devops/terraform-modules.git//vm?ref=feature/dev-vm"
  vm_name = var.vms["jenkins"].vm_name
  type = var.vms["jenkins"].type
  subnet_id = module.network.subnet_ids["private-subnet"]
  email = module.service_account["jenkins_vm"].service_account_email
  auto_delete = var.vm_disk.auto_delete
  source_disk = var.vm_disk.source_disk
  scopes = var.scopes
  zone = var.zone
  tags = var.tags

}

module "firewall" {
  source = "git@github.com:lgd-jenkins-devops/terraform-modules.git//firewall?ref=v1.0.0"
  rules = var.firewall_rules
  network = module.network.vpc_network_name
}


module "load-balance" {
  source = "git@github.com:lgd-jenkins-devops/terraform-modules.git//load_balancer?ref=v1.0.0"
  network = module.network.vpc_network_id
  jenkins_id = module.vm.vm_id
  depends_on = [module.vm]
  path_cert = var.ssl.path_cert
  path_key = var.ssl.path_key
}

module "bucket" {
  source = "git@github.com:lgd-jenkins-devops/terraform-modules.git//bucket?ref=feature/set-backend"
  name = var.bucket.name
  location = var.bucket.location
  project_id = var.project_id
  bucket-type = "backend"
}