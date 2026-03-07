output "instance_public_ip" {
  description = "Public IP of worker node"
  value       = aws_instance.worker_node.public_ip
}

output "instance_url" {
  description = "URL to Nginx Server"
  value       = "https://${aws_instance.worker_node.public_ip}:443"
}