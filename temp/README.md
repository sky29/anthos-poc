# Set environment variables:
export TF_DATA_DIR=/Users/sky/Projects/project-scrap/labs-and-docs/labs/08_anthos_labs/01_anthos-test-deployment/workspace/output (this will change .terraform folder to output folder)

# Terraform Commands
terraform init
terraform plan -var-file=./input-vars.tfvars
terraform apply -var-file=./input-vars.tfvars