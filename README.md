# databricks-cicd-workshop-terraform

**TLDR**; this repo contains a simple [Terraform](https://registry.terraform.io/providers/databricks/databricks/latest/docs) Infrastructure as Code (IaC) example, where we:

* Create an [Azure Databricks](https://azure.microsoft.com/en-us/products/databricks/) workspace
  * Create an [Instance Pool](https://learn.microsoft.com/en-us/azure/databricks/clusters/pools)
  * Create a [Cluster](https://learn.microsoft.com/en-us/azure/databricks/clusters/)

## Getting started

To get started, install Terraform and follow the steps below:

* Clone this repo locally
* From a terminal window, run `terraform init`
* Make sure to have setup the following environment variables: `DATABRICKS_HOST` and `DATABRICKS_TOKEN`
* Run `terraform plan`
* Run `terraform apply`

After some minutes, you should see you resources deployed to Databricks.

## Tidying up

* Run `terraform destroy` after you finish testing to delete the resources you created
