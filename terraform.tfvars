vpc_name = "devops"

subnets = {
    "public_subnet" : {
        cidr_block : "10.2.0.0/16"
    },

    "private_subnet" : {
        cidr_block : "10.2.1.0/24"
    }
}