
# Network Module
module "network" {
  source = "./modules/network"

  aws_region          = var.aws_region
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr

  tags = var.tags
}

# EC2 Module
module "ec2" {
  source = "./modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  instance_name = var.instance_name
  key_name      = var.key_name

  vpc_id     = module.network.vpc_id
  subnet_id  = module.network.public_subnet_id
  admin_cidr = var.admin_cidr

  tags = var.tags
}
