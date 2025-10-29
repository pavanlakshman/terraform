variable "image_id" {
  type        = string
  default = "ami-09c813fb71547fc4f"
  description = "RHEL 9"
}

variable "instance_type"{
    type = string
    default = "t3.micro"
} 

variable "instance_name"{
    default = "backend"
}