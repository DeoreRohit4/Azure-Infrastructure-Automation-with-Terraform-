# Bastion linux vm input variables

variable "bastion_service_subenet_name" {
  description = "Bastion service subnet name"
  default = "AzureBastionSubnet"
}

variable "bastion_service_address_prefixs" {
  description = "Bastion Service address prefixs"
  default = ["10.0.101.0/27"]
}
