variable "key_name" {
        description = "SSH keypair you've created"
        default = "smartcity"
}

variable "subnet_id" {
  description = "The VPC subnet the instance(s) will go in"
  default = "subnet-6931a423"
}

variable "ami_id" {
  description = "AMI used to spin-up this EC2 Instance"
  default = "ami-0ff8a91507f77f867"
}
variable "name" {
        default = "Elb"
}