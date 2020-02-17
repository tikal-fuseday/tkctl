resource "azurerm_resource_group" "rg" {
  name     = var.customer
  location = var.location
}

module "azurerm_network" {
  source              = "../../modules/azure/azurerm-network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.address_space
  subnet_prefixes     = var.subnet_prefixes
  subnet_names        = var.subnet_names
  vnet_name           = join("-", [title("${var.customer}"), "VNet"])
  tags = {
    environment = var.env
  }
}

module "aks" {
  source                = "../../modules/azure/azurerm-aks"
  resource_group_name   = azurerm_resource_group.rg.name
  agents_size           = var.agents_size
  agents_count          = var.agents_count
  client_id             = var.client_id
  client_secret         = var.client_secret
  prefix                = var.project
  public_ssh_key        = var.public_ssh_key
  tags = {
    environment = var.env
  }
}



