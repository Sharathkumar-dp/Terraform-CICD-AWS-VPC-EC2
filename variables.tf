
variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "ap-southeast-2"
}

variable "ami_id" {
  description = "AWS EC2 AMI ID for the selected region"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "Terraform-EC2"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR"
  type        = string
  default     = "10.0.2.0/24"
}

variable "admin_cidr" {
  description = "Trusted public IP CIDR allowed to access SSH and RDP. Use your public IP/32."
  type        = string

  validation {
    condition     = can(cidrhost(var.admin_cidr, 0))
    error_message = "Provide a valid CIDR, such as 203.0.113.10/32."
  }
}

variable "tags" {
  description = "Common AWS resource tags"
  type        = map(string)

  default = {
    Environment = "Development"
    ManagedBy   = "Terraform"
    Project     = "AWSEC2Terraform"
  }
}

variable "key_name" {
  description = "Existing AWS EC2 key pair name"
  type        = string
}