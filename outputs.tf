output ip_publica {
  value = aws_instance.app_server.public_ip
}
output ip_privada {
  value = aws_instance.app_server.private_ip
}

