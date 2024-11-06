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