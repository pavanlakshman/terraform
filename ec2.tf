# resource <resource-type> <resource-name>

resource "aws_instance" "docker" {

  ami                    = "ami-09c813fb71547fc4f" # RHEL-9-DevOps-Practice ami-09c813fb71547fc4f
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type          = "t3.small"
  #user_data = file("jenkishns.")
  user_data = file("docker.sh")

  tags = {
    Name = "docker"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "allowing ssh access"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0 # from 0 to 0 means opening all ports
    to_port     = 0
    protocol    = "-1" # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "allow_ssh"
    CreatedBy = "Pavan"
  }
}





