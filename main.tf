# var from external files
variable "subscription_id" {}
variable "tenant_id" {}
variable "client_id" {}
variable "client_secret" {}

variable "environment" {}
variable "location" {}
variable "transversal_rg" {}
variable "transversal_vnet" {}
variable "transversal_sa" {}
variable "transversal_sc" {}

variable "ci_rg" {}
variable "ct_rg" {}
variable "cd_rg" {}


# doesn't work
#variable "tfstatepath" {}
#
#terraform {
#  backend "local" {
#    path = "${var.tfstatepath}"
#  }
#}

terraform {
  backend "local" {
    path = "backendterraform/terraform.tfstate"
  }
}

# az provider with az tenant var
provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  tenant_id       = "${var.tenant_id}"
#  client_id       = "${var.client_id}"
#  client_secret   = "${var.client_secret}"
}

# provide transverse resource group
resource "azurerm_resource_group" "transversal" {
  name     = "${var.transversal_rg}"
  location = "${var.location}"

  tags {
    environment = "${var.environment}"
  }
}

# provide transversal network
resource "azurerm_virtual_network" "transversal_network" {
  name                = "${var.transversal_vnet}"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.transversal.location}"
  resource_group_name = "${azurerm_resource_group.transversal.name}"

  tags {
    environment = "${var.environment}"
  }
}

# provide transversal storage account
resource "azurerm_storage_account" "transversal_st_acc" {
  name                     = "${var.transversal_sa}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  location                 = "${azurerm_resource_group.transversal.location}"
  resource_group_name      = "${azurerm_resource_group.transversal.name}"

  tags {
    environment = "${var.environment}"
  }
}

# provide transversal storage container
resource "azurerm_storage_container" "transversal_st_cont" {
  name                  = "${var.transversal_sc}"
  resource_group_name   = "${azurerm_resource_group.transversal.name}"
  container_access_type = "private"
  storage_account_name  = "${azurerm_storage_account.transversal_st_acc.name}"
}

# provide resource group continuous integration
resource "azurerm_resource_group" "rg_ci" {
  name     = "${var.ci_rg}"
  location = "${var.location}"

  tags {
    environment = "${var.environment}"
  }
}

# provide resource group continuous testing
resource "azurerm_resource_group" "rg_ct" {
  name     = "${var.ct_rg}"
  location = "${var.location}"

  tags {
    environment = "${var.environment}"
  }
}

# provide resource group continuous delivery
resource "azurerm_resource_group" "rg_cd" {
  name     = "${var.cd_rg}"
  location = "${var.location}"

  tags {
    environment = "${var.environment}"
  }
}
