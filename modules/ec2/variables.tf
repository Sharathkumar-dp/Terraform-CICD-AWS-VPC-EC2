
variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "admin_cidr" {
  type = string
}

variable "tags" {
  type = map(string)
}
variable "key_name" {
  type = string
}

variable "admin_cidr" {
  description = "Trusted public IP CIDR allowed to access SSH and RDP. Use your public IP/32."
  type        = string
}