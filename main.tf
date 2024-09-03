module "appVPC" {
  source  = "./modules/network/vpc"
  cidr_block = "172.32.0.0/16"
  tags = "appVPC"
}

module "bastionVPC" {
  source = "./modules/network/vpc"
  cidr_block = "192.168.0.0/16"
  tags = "bastionVPC"
}

module "appSubnet" {
  source = "./modules/network/subnet"
  cidr_block = "172.32.1.0/24"
  tags = "appSubnet1"
  vpc_id = module.appVPC.vpc_id
}
module "bastionSubnet" {
  source = "./modules/network/subnet"
  cidr_block = "192.168.1.0/24"
  tags = "bastionSubnet1"
  vpc_id = module.bastionVPC.vpc_id 
}

module "bastionRoute" {
    source = "./modules/network/routeTable"
    vpc_id = module.bastionVPC.vpc_id
    cidr_block = "192.168.0.0/16"
    name = "bastionRoute"
    gateway_id = "local"
}

module "BastionAndApp" {
  source = "./modules/network/transitGateway"
  transitName = "BastionAndApp"  
  appSubnetIds =  [module.appSubnet.subnet_id]
  appVPCId =   module.appVPC.vpc_id
  bastionSubnetIds = [module.bastionSubnet.subnet_id]
  bastionVPCId = module.bastionVPC.vpc_id
}

module "bastionInstance" {
  source = "./modules/compute/ec2"
  Name = "bastionInstance"
  subnetId = module.bastionSubnet.subnet_id
  public_ip = true
}

