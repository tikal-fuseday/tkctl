terraform {
  backend "azurerm" {
    resource_group_name  = "Tikal-Terraform-States-RG" # output of the command 'terraform output resource_group_name'
    storage_account_name = "tikaltfacc"                # output of the command 'terraform output storage_account_name'
    container_name       = "tikal-tfstates"            # output of the command 'terraform output container_name'
    key                  = "tikal/tkctl.tfstate"       # path to the state file - change according to the project - customer/project.tfstate
  }
}