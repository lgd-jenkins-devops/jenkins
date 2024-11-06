vpc_name = "devops"

subnets = {
    "public-subnet" : {
        cidr_block : "10.2.0.0/16"
    },

    "private-subnet" : {
        cidr_block : "10.2.1.0/24"
    }
}

service_accounts : {

    "jenkins_vm" : {
        display_name : "jenkins",
        role : var.jenkins_role
    }
}