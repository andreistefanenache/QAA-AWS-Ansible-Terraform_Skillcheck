output "ci_public_ip" {
  value = aws_instance.ci.public_ip
}
output "deployment_public_ip" {
  value = aws_instance.deployment.public_ip
}
output "bucket_domain" {
  value = aws_s3_bucket.my_bucket.bucket_domain_name
}


output "security_group_id" {
  value = aws_security_group.rds_sg.id
}
output "db_instance_endpoint" {
  value = aws_db_instance.myinstance.endpoint
}

resource "local_file" "ansibleinventory" {
  content  = <<-EOT
all:
  children:
    ci:
      hosts:
        ${aws_instance.ci.public_ip}
      vars:
        ansible_user: ubuntu
        ansible_ssh_private_key_file: ~/.ssh/host1.pem
    deployment:
      hosts:
        ${aws_instance.deployment.public_ip}
      vars:
        ansible_user: ubuntu
        ansible_ssh_private_key_file: ~/.ssh/host1.pem
EOT
  filename = "inventory.yaml"
}
