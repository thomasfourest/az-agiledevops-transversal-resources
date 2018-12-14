# infra-transversal-resources

## object

This project create the transversal objects of the agile devops infrastructure on azure.

![alt text](https://github.com/thomasfourest/az-agiledevops-transversal-resources.git/blob/master/agile.devops.transversal.jpg)

Those resources :
 * continuous integration resource group,
 * continuous testing resource group,
 * continuous delivery resource group,
 * trnsversal resource group (portal and/or jump box services, ...etc),
 * transversal network (security, restrictions, ...etc).

## Install

##### 1 - Install Terraform
https://learn.hashicorp.com/terraform/getting-started/install.html

##### 2 - Install the Azure client - Azure CLI 2
https://docs.microsoft.com/fr-fr/cli/azure/install-azure-cli?view=azure-cli-latest

##### 3 - Log in Azure with your favorite terminal
* launch the following command : `az login`

![alt text](https://github.com/thomasfourest/az-agiledevops-transversal-resources.git/blob/master/az-log.png)

* manual login in azure with a connection to azure in a web browser and an azure client command prompt on windows

![alt text](https://github.com/thomasfourest/az-agiledevops-transversal-resources.git/blob/master/az.web.login.png)

##### 4 - Execute the terraform main script with the tenant information and the Azure resource groups
`terraform init --var-file=tenant.tfvars --var-file=rg.tfvars`

`terraform plan --var-file=tenant.tfvars --var-file=rg.tfvars`

`terraform apply --var-file=tenant.tfvars --var-file=rg.tfvars`

## Knowledge :
 * az cli documentation : https://docs.microsoft.com/en-us/cli/azure/reference-index?view=azure-cli-latest
 * az pricing :
   - https://azure.microsoft.com/fr-fr/pricing/details/virtual-machines/linux/
   - https://azure.microsoft.com/fr-fr/pricing/details/managed-disks/
 * az prinzing monitoring : https://portal.azure.com/#blade/Microsoft_Azure_Billing/ModernBillingMenuBlade/Overview
