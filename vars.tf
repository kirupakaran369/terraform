variable "REGION" {
  default = "us-east-1"
}
variable "ZONE1" {
  default = "us-east-1a"
}
variable "VPC_ID" {
  default = "vpc-0de3e8126648476cb"
}
variable "MY_IP" {
  default = "49.37.201.175/32"
}
variable "USER" {
  default = "ubuntu"
}
variable "AMI" {
  type = map(any)
  default = {
    us-east-1 = "ami-052efd3df9dad4825"
    us-east-2 = "Replace with ami_id"
  }
}
variable "PUB_KEY_PATH" {
  default = "task-1.pub"
}
variable "PRIV_KEY_PATH" {
  default = "task-1"
}
variable "aws_access_key" {
  default = "<your_access_key>"
}
variable "aws_secret_key" {
  default = "<your_secret_key>"
}