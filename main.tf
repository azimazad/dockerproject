provider "aws" {
  region = "us-east-1"  
}

resource "aws_instance" "example_instance" {
  ami           = "ami-xxxxxxxxxxxxxxxxx"  
  instance_type = "t2.micro"               
  key_name      = "your_keypair_name"      

  tags = {
    Name = "Example-Linux-Instance"
  }
  user_data = <<-EOT
              #!/bin/bash
              # Install Ansible
              apt update
              apt install -y ansible
              EOT
}
  

output "public_ip" {
  value = aws_instance.example_instance.public_ip
}
