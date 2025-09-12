output "instance_id" {
  value = aws_instance.k8s_node.id
}

output "public_ip" {
  value = aws_eip.k8s_eip.public_ip
}
