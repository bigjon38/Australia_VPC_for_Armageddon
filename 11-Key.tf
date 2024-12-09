resource "tls_private_key" "mylinuxbox" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

data "tls_public_key" "mylinuxbox" {
  private_key_pem = tls_private_key.mylinuxbox.private_key_pem
}

output "private_key" {
  value     = tls_private_key.mylinuxbox.private_key_pem
  sensitive = true
}

output "public_key" {
  value = data.tls_public_key.mylinuxbox.public_key_openssh
}

