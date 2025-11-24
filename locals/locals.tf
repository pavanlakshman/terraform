locals {
    ami_id = "ami-090252cbe067a9e58"
    sg_id = "sg-05d4e66d0c4303ffa"
    instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro"
    tags = {
        Name = "locals"
    }
}