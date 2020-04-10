data "aws_region" "current" {}

data "aws_alb_listener" "http" {
  count = "${var.alb_listener_http == "__NOT_DEFINED__" ? 0 : 1}"
  arn = "${var.alb_listener_http}"
}

data "aws_alb_listener" "https" {
  count = "${var.alb_listener_http == "__NOT_DEFINED__" ? 0 : 1}"
  arn = "${var.alb_listener_https}"
}

#data "aws_route53_zone" "service" {
#  count = "${var.route53_primary_zone_id == "__NOT_DEFINED__" ? 0 : 1}"
#  zone_id = "${var.route53_primary_zone_id}"
#}
