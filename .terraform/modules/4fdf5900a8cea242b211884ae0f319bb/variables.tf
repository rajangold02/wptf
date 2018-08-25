variable "instance_class" {
        description = "Type of instance"
        default = "db.t2.micro"
}
variable "security_group_name" {
        description = "Security Group you've created"
        default = "sg_rds"
}