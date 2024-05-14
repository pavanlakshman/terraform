variable "instance_names" {
    type = map
    default = {
        db = "t3.small"
        backend = "t3.micro"
        frontend = "t3.micro"
    }
}

variable "common_tags" {
    type = map
    default = {
        Project = "Expense"
        Terraform = "true"
    }
}

#r53 variables
variable "zone_id" {
    default = "Z08560831QXM9E5IS7WT6"
}

variable "domain_name" {
    default = "pavandevops.online"
}