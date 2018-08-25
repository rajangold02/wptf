resource "aws_instance" "ebizon" {
        ami = "${var.ami_id}"
        instance_type = "t2.micro"
        key_name = "${var.key_name}"
        subnet_id = "${var.subnet_id}"
        associate_public_ip_address = "true"
        tags {
         Name = "ec2-wordpress"
        }
        user_data = "${file("./module/ec2/wordpress.sh")}"
        }
resource "aws_elb" "ebizon" {
  name               = "${var.name}"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }
  instances                   = ["${aws_instance.ebizon.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "wordpress_elb"
  }
}
