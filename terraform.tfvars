vpc_name = "devops"

subnets = {
    "public-subnet" : {
        cidr_block : "10.10.0.0/24"
    },

    "private-subnet" : {
        cidr_block : "10.10.2.0/24"
    }
}

account_id = "jenkins-vm"

vms = {
    "jenkins" : {
        vm_name = "jenkins"
        type = "e2-small"
    }
}

firewall_rules = {
    "allow-jenkins" : {
        name = "allow-jenkins"
        protocol = "tcp"
        ports = ["8080"]
        tags = ["allow-jenkins"]
        type = "internal"
    },
    "allow-ssh" : {
        name = "allow-ssh"
        protocol = "tcp"
        ports = ["22"]
        tags = ["allow-ssh-jenkins"]
        type = "external"
        range = ["186.154.96.140/32"]
    }
}