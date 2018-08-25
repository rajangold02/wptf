output "server_id" {
  value = "${aws_instance.ebizon.id}"
}
output "address" {
  value = "${aws_elb.ebizon.dns_name}"
}
