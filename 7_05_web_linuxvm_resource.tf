# Locals Block for custom data
locals {
  webvm_custom_data = <<CUSTOM_DATA
      #!/bin/sh
      # Update the package list
      sudo apt-get update -y
      
      # Install Apache
      sudo apt-get install -y apache2
      
      # Enable and start Apache service
      sudo systemctl enable apache2
      sudo systemctl start apache2
      
      # Stop and disable the firewall
      sudo ufw disable
      
      # Set permissions for the web root
      sudo chmod -R 777 /var/www/html
      
      # Create the index.html file with a welcome message
      echo "Welcome to stacksimplify - WebVM App1 - VM Hostname: $(hostname)" | sudo tee /var/www/html/index.html
      
      # Create app1 directory
      sudo mkdir /var/www/html/app1
      
      # Create hostname.html in app1 directory
      echo "Welcome to stacksimplify - WebVM App1 - VM Hostname: $(hostname)" | sudo tee /var/www/html/app1/hostname.html
      
      # Create status.html in app1 directory
      echo "Welcome to stacksimplify - WebVM App1 - App Status Page" | sudo tee /var/www/html/app1/status.html
      
      # Create a custom index.html in app1 directory
      echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Stack Simplify - WebVM APP-1 </h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
      
      # Fetch metadata and save it to metadata.html in app1 directory
      sudo curl -H "Metadata:true" --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2020-09-01" -o /var/www/html/app1/metadata.html
      
  CUSTOM_DATA
}

# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "web_linuxvm" {
  name = "${local.resource_name_prefix}-web-linuxvm"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  size = "Standard_DS1_v2"
  admin_username = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.web_linuxvm_nic.id
  ]

  admin_ssh_key {
    username = "azureuser"
    public_key = file("/home/rohit/Documents/terraform_with_azure/Project-TF-AZ/azure_tf_project/manifests/ssh-keys/terraform-azure.pub")
  }

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
 }

  custom_data = base64encode(local.webvm_custom_data)
}
