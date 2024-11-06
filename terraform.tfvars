vpc_name = "devops"

subnets = {
    "public-subnet" : {
        cidr_block : "10.2.0.0/16"
    },

    "private-subnet" : {
        cidr_block : "10.2.1.0/24"
    }
}

account_id = "jenkins-vm"