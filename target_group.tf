resource "aws_alb_target_group" "service" {
  count    = "${var.alb_target_group == "__NOT_DEFINED__" ? 1 : 0}"
  name     = "${var.environment}-${var.name}"
  port     = "${ lookup(var.port_mappings[0], "containerPort") }"
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"

  # Parametrize that
  health_check {
    interval            = "${ var.health_check_interval }"
    path                = "${ var.health_check_path }"
    port                = "${ var.health_check_port }"
    protocol            = "${ var.health_check_protocol }"
    timeout             = "${ var.health_check_timeout }"
    healthy_threshold   = "${ var.health_check_healthy_threshold }"
    unhealthy_threshold = "${ var.health_check_unhealthy_threshold }"
    matcher             = "${ var.health_check_matcher }"
  }

}
