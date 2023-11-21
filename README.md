# mini-node-app-deployment
Ansible+Terraform to... hello world?

To run:
```
terraform init
terraform apply # Check and confirm

ansible-playbook -i inventory.yaml playbook.yaml
# Set up Jenkins manually, using password and IP provided in the folder ./initialAdminPassword. The above script will fail because Jenkins needs to be set up by hand.

ansible-playbook -i inventory.yaml playbook.yaml
# This time the script should succeed.
```

Side note: secret.auto.tfvars is an example secrets file, the secrets are random text.
