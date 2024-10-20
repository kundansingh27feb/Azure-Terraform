rg = {
    rg1 = {
        name = "myrg1"
        location = "westus"
    }
    rg2 = {
        name = "myrg2"
        location = "eastus"
    }
}

subnet = {
    sub1 = {
        name = "subnet1"
        address_prefixes = ["10.0.1.0/24"]
    }
    rg2 = {
        name = "subnet2"
        address_prefixes = ["10.0.2.0/24"]
    }
}