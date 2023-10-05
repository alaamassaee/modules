output "public_ip" {
  value = aws_instance.webserver_instance.public_ip
}
