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
    "allow-jenkins-lb" : {
        name = "allow-jenkins-lb"
        protocol = "tcp"
        ports = ["8080"]
        tags = ["allow-jenkins"]
        type = "external"
         range = ["130.211.0.0/22", "35.191.0.0/16", "35.235.240.0/20"]
    },
    "allow-ssh" : {
        name = "allow-ssh"
        protocol = "tcp"
        ports = ["22"]
        tags = ["allow-ssh-jenkins"]
        type = "external"
        range = ["35.235.240.0/20"]
    }
}