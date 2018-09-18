# Handling host-based routing w/o path-pattern
resource "aws_alb_listener_rule" "http" {
  count = "${(var.alb_listener_http == "__NOT_DEFINED__" ? 0 : length(var.hostnames)) * (var.path-pattern == "__NOT_DEFINED__" ? 1 : 0)}"
  listener_arn = "${var.alb_listener_http}"
  priority     = "${var.alb_listener_priority * 100 + count.index}"

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.service.arn}"
  }

  condition {
    field  = "host-header"
    values = ["${var.hostnames[count.index]}"]
  }
}

resource "aws_alb_listener_rule" "https" {
  count = "${(var.alb_listener_https == "__NOT_DEFINED__" ? 0 : length(var.hostnames)) * (var.path-pattern == "__NOT_DEFINED__" ? 1 : 0)}"
  listener_arn = "${var.alb_listener_https}"
  priority     = "${var.alb_listener_priority * 100 + count.index}"

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.service.arn}"
  }

  condition {
    field  = "host-header"
    values = ["${var.hostnames[count.index]}"]
  }
}


# Handling host-based routing with path-pattern
resource "aws_alb_listener_rule" "http-with-path" {
  count = "${(var.alb_listener_http == "__NOT_DEFINED__" ? 0 : length(var.hostnames)) * (var.path-pattern == "__NOT_DEFINED__" ? 0 : 1)}"
  listener_arn = "${var.alb_listener_http}"
  priority     = "${var.alb_listener_priority * 100 + count.index}"

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.service.arn}"
  }

  condition {
    field  = "host-header"
    values = ["${var.hostnames[count.index]}"]
  }

  condition {
    field  = "path-pattern"
    values = ["${var.path-pattern}"]
  }
}

resource "aws_alb_listener_rule" "https-with-path" {
  count = "${(var.alb_listener_https == "__NOT_DEFINED__" ? 0 : length(var.hostnames)) * (var.path-pattern == "__NOT_DEFINED__" ? 0 : 1)}"
  listener_arn = "${var.alb_listener_https}"
  priority     = "${var.alb_listener_priority * 100 + count.index}"

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.service.arn}"
  }

  condition {
    field  = "host-header"
    values = ["${var.hostnames[count.index]}"]
  }

  condition {
    field  = "path-pattern"
    values = ["${var.path-pattern}"]
  }
}

