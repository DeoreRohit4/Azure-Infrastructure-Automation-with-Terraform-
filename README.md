# Azure-Infrastructure-Automation-with-Terraform
## Blog 1: https://rohitexplainstech.hashnode.dev/azure-infrastructure-automation-with-terraform
![Business (3)](https://github.com/user-attachments/assets/db8ab588-1124-40e6-bd61-c4fbc28dc25c)

## Resources to be Created
### Azure Resource Groups
- azurerm_resource_group: This resource group will serve as a container for all the Azure resources.
Networking Components
- azurerm_virtual_network: The virtual network to house all subnets and network interfaces.
- azurerm_subnet: Subnets within the virtual network.
- azurerm_network_security_group: Network Security Groups to manage and control inbound and outbound traffic.
- azurerm_subnet_network_security_group_association: Association of Network Security Groups with specific subnets.
- azurerm_network_security_rule: Security rules to allow or deny specific network traffic.
- azurerm_public_ip: Public IP addresses for external communication.
- azurerm_network_interface: Network interfaces for the virtual machines.
- azurerm_network_interface_security_group_association: Association of Network Security Groups with network interfaces.
  
### Virtual Machines
- azurerm_linux_virtual_machine: Azure Linux Virtual Machines with custom data for initialization.
## Terraform Features and Functions
### Meta-arguments and Blocks
- Terraform Local Block for Security Rule Ports: Definition of local variables to manage security rule ports.
- Terraform for_each Meta-argument: Efficient creation of multiple similar resources using loops.
- Terraform Local Block for Custom Data: Defining custom data scripts to initialize the Azure Linux Virtual Machine.
### Terraform Functions
- file: Reads the contents of a file.
- filebase64: Reads the contents of a file and encodes it to base64.
- base64encode: Encodes a string to base64.
### Outputs
- Terraform Outputs for the created Azure resources, including details like resource IDs, public IP addresses, and network configurations.

-----------------------------------------------------------------------------

## Blog 2: https://rohitexplainstech.hashnode.dev/azure-infrastructure-automation-with-terraform-part-2

![image data](<Business (4).png>)

### Azure Resources to be Created

- Terraform Input Variables

- azurerm_public_ip

- azurerm_network_interface

- azurerm_linux_virtual_machine

- Terraform Null Resource null_resource

- Terraform File Provisioner

- Terraform remote-exec Provisioner

- azurerm_bastion_host

- Azure Bastion Service

- Terraform Output Values

![img data](image.png)

![img data](image-1.png)

![img data](image-2.png)

-------------------------------------------------------------------------------

## Blog 3: https://rohitexplainstech.hashnode.dev/azure-infrastructure-automation-with-terraform-part-3

![img data](<Business (5).png>)

### Azure Standard Load Balancer Resources

1. azurerm_public_ip

2. azurerm_lb

3. azurerm_lb_backend_address_pool

4. azurerm_lb_probe

5. azurerm_lb_rule

6. azurerm_network_interface_backend_address_pool_association

7. Comment Azure Bastion Service as we are already using Azure Bastion Host approach with Linux VM

![alt text](image-3.png)

![alt text](image-4.png)

![alt text](image-5.png)

![alt text](image-6.png)

-------------------------------------------------------------------------------------------

## Blog 4: https://rohitexplainstech.hashnode.dev/azure-infrastructure-automation-with-terraform-part-4

![img data](<Business (6).png>)

### Inbound NAT Rule for Standard Load Balancer

1. azurerm_lb_nat_rule

2. azurerm_network_interface_nat_rule_association

3. Verify the SSH Connectivity to Web Linux VM using Load Balancer Public IP with port 1022

![alt text](image-7.png)

![alt text](image-8.png)

![alt text](image-9.png)