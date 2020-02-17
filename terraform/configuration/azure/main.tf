
terraform {
  backend "azurerm" {
    resource_group_name  = "Tikal-Terraform-States-RG" # output of the command 'terraform output resource_group_name'
    storage_account_name = "tikaltfacc"            # output of the command 'terraform output storage_account_name'
    container_name       = "tikal-tfstates"            # output of the command 'terraform output container_name'
    key                  = "tikal/tkctl.tfstate"     # path to the state file - change according to the project - customer/project.tfstate
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
    source              = "../../modules/azurerm-network"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    address_space       = "10.0.0.0/16"
    subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    subnet_names        = ["subnet1", "subnet2", "subnet3"]
    vnet_name           = join("-", [title("${var.customer}"), "VNet"])
    tags                = {
                            environment = var.env
                          }
}

# module "aks" {
#   source = "./modules/aks"
#   # version = "2.0.0"

#   CLIENT_ID          = "526c4950-4485-4dd0-9af5-20d5ad84732a"
#   CLIENT_SECRET      = "7d94ba45-adb6-4551-8d7b-ece36c91aa9f"
#   prefix             = "ddyy-k8s-test"
#   location           = "North Europe"
#   agents_size        = "Standard_B2s"
#   agents_count       = 2
#   kubernetes_version = "1.14.6"
#   public_ssh_key     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQChfZryPRwPcle2fzNjZkjzDiTLOLBvDAx+Vj1zyMEMkoTGA7e8t0p6uuuQaL1ifunjlN7WvhTbvJYy4YNU1/YCN8g99SvZHpJxRDq0qti9W2DUeSdagw6+wSL0ZLseLbDpT4QMJzuGM8y/nkJVUcxTg08GGhDzLdjLxQRI37CTsrt3mShEnf0wp+SYC0hYjKXdYQo27VBNIIsa/MuuOfhgvg7lqM2vvQhCD/8MjHtwOZe8ae342JbK6bzyfBscLbXhxIw2+cIV8MFmvG4DeMCg71h1xfNR8ic9XW9OeW6nJZz4Fm1uysSZnrc24jsoNRl1taWPoCY/S3EvGzM+Hlxz avi@langburd.com"
# }

