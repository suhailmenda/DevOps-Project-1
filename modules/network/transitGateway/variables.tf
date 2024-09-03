variable "transitName" {
  type = string
}



variable "appVPCId" {
 type = string 
}

variable "appSubnetIds" {
  type = list(string)
}

variable "bastionSubnetIds" {
  type = list(string)
}

variable "bastionVPCId" {
  type = string
}