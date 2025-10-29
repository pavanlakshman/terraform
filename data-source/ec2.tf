# resource <resource-type> <resource-name>

resource "aws_instance" "db" {

  ami                    = data.aws_ami.ami_id.id # RHEL-9-DevOps-Practice ami-09c813fb71547fc4f
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  instance_type          = "t3.small"
  #user_data = file("jenkishns.")

  tags = {
    Name = "db"
  }
}