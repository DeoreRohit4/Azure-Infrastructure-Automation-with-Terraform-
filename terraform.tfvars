business_division = "hr"
environment = "dev"
resource_group_name = "rg"
resource_group_location = "eastus"

vnet_name = "vnet"
vnet_address_space = ["10.1.0.0/16"]

web_subnet_name = "websubnet"
web_subnet_address = ["10.1.1.0/24"]

app_subnet_name = "appsubnet"
app_subnet_address = ["10.1.11.0/24"]

db_subnet_name = "dbsubnet"
db_subnet_address = ["10.1.21.0/24"]

bastion_subnet_name = "bastionsubnet"
bastion_subnet_address = ["10.1.100.0/24"]

# Newly added
bastion_service_subenet_name = "AzureBastionSubnet"
bastion_service_address_prefixs = ["10.1.101.0/27"]