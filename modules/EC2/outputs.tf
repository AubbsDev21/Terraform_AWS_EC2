output "server_instance" {
  value = aws_instance.instance_server.id
}


output "server_eip" {
  value = aws_eip.instance_IP.public_ip
}
