# If repeated blocks of code is there, then we use this dynamic block. Here I'm trying to allow multiple ports like 22, 80, 8080, 3306. In this case we have to write ingress rules for every port. Then the code will repeated. To overcome this issue use dynamic blocks. Reduce the code is the best standers of coding.

resource "aws_security_group" "allow_ports" {
    name = "allow_ports"
    description = "allowing 22,80,8080,3306 access"

    #terraform block
    dynamic "ingress" {
        for_each = var.inbound_rules
        content{
            from_port        = ingress.value["port"] #each.value[<key-name>]
            to_port          = ingress.value["port"]
            protocol         = ingress.value["protocol"]
            cidr_blocks      = ingress.value["allowed_cidr"]
        }
    }

    egress {
        from_port        = 0 # from 0 to 0 means, opening all protocols
        to_port          = 0
        protocol         = "-1" # -1 all protocols
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ports"
        CreatedBy = "Pavan"
    }
}