
terraform {
  backend "azurerm" {
    resource_group_name  = "Tikal-Terraform-States-RG" # output of the command 'terraform output resource_group_name'
    storage_account_name = "tikaltfacc"                # output of the command 'terraform output storage_account_name'
    container_name       = "tikal-tfstates"            # output of the command 'terraform output container_name'
    key                  = "tikal/tkctl.tfstate"       # path to the state file - change according to the project - customer/project.tfstate
  }
}

provider "azurerm" {
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = var.customer
  location = var.location
}

module "azurerm_network" {
  source              = "../../modules/azure/azurerm-network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = "10.0.0.0/16"
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]
  vnet_name           = join("-", [title("${var.customer}"), "VNet"])
  tags = {
    environment = var.env
  }
}

module "aks" {
  source                = "../../modules/azure/azurerm-aks"
  resource_group_name   = azurerm_resource_group.rg.name
  agents_size           = "Standard_B2s"
  agents_count          = 2
  client_id             = var.client_id
  client_secret         = var.client_secret
  prefix                = var.project
  public_ssh_key        = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDXFVIdODkLSkOax0jL8BMpJiL/FT6/JdL+eZukhRa99DB5RIpOYnvb4LWgQEIBbdISQoQuhaaO4GE7yOF9ilmmNWuX3pewL2vJCdbJsSSeUpHkKSRmCUF2Gh9+emgk+3N9iG8mdRW9KsFBGXmy/6/li5rlxAdqNVsMJ/PYKvWtWvJIRrHFR4eb3+VkwrGr+f/zBt33YYDzzHTXN9MR+oRQOhBRQjR5fixxu4+vDrqJcdKBPn+lmv7RMzPYHNmO2ZhR5E3o4rG33jI4/1HddMP84PH92EkditVBs9lcmYfJgDIh+Yq8uTujr3P8nlmkG1JKwhvS6UkMENuzj3UKFFMN tkctl@tikalk.com"
  tags = {
    environment = var.env
  }
}



