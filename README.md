# intern-deployment-tf

This repository contains Terraform modules that can be used to deploy infrastructure into Google Cloud Platform (GCP). The modules are designed to be reusable and can be used to deploy a variety of different types of infrastructure. 

## Features

The repository also contains a Cloud Build configuration file that can be used to automate the deployment of the infrastructure. The Cloud Build configuration file defines two pipelines: a plan pipeline and an apply pipeline.

The plan pipeline runs when there is an open pull request. The plan pipeline generates a Terraform plan that can be used to preview the changes that will be made to the infrastructure. The plan pipeline does not make any changes to the infrastructure.

The apply pipeline runs after a merge to the main branch. The apply pipeline applies the Terraform plan to the infrastructure. The apply pipeline makes changes to the infrastructure.

The apply pipeline must be manually approved through the Google Cloud console. This is done to prevent accidental deployments.

## Documentation

For more information on how to use this repository, please see the following documentation:

* [Terraform documentation](https://www.terraform.io/docs/)
* [Cloud Build documentation](https://cloud.google.com/build/docs/)
* [Google Cloud Platform documentation](https://cloud.google.com/docs/)
