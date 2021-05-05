terraform {
  backend "azurerm" {
    resource_group_name  = "jenkins-cicd"
    storage_account_name = "selaclass1020"
    container_name       = "terraform"
    key                  = "leon-jalfon/infrastructure.tfstate"
  }
}
