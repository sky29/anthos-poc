# Set environment variables:
export TF_DATA_DIR=/Users/sky/Projects/project-scrap/labs-and-docs/labs/08_anthos_labs/01_anthos-test-deployment/workspace/output (this will change .terraform folder to output folder)

# Terraform Commands
terraform init OR terraform init -reconfigure
terraform plan -var-file=./input-vars.tfvars
terraform apply -var-file=./input-vars.tfvars



https://medium.com/the-telegraph-engineering/binding-gcp-accounts-to-gke-service-accounts-with-terraform-dfca4e81d2a0
https://cloud.google.com/blog/topics/anthos/using-terraform-to-enable-config-connector-on-a-gke-cluster
https://cloud.google.com/anthos/docs/setup/cloud

https://betterprogramming.pub/managing-multiple-environments-in-terraform-5b389da3a2ef
https://stackoverflow.com/questions/66024950/how-to-organize-terraform-modules-for-multiple-environments
https://kasna.com.au/using-terraform-to-create-secure-iap-tunnels-on-gcp-with-conditional-iam-policies/

https://twitter.com/plajo/status/1442897077835468802
https://twitter.com/rseroter/status/1428053085113380865
https://sreeninet.wordpress.com/

https://cloud.google.com/kubernetes-engine/docs/how-to/workload-identity#authenticating_to