output "logging.group_name" {
  value = "${aws_cloudwatch_log_group.service.name}"
}

output "service.name" {
  value = "${var.name}"
}

output "service.environment" {
  value = "${var.environment}"
}

output "service.target_group" {
#  value = "${aws_alb_target_group.service.arn}"
  value = "${element(coalescelist(aws_alb_target_group.service.*.arn, list("")), 0)}"
}

output "service.role" {
  value = "${aws_iam_role.service.name}"
}

output "task_definition.arn" {
  value = "${var.image == "amazon/amazon-ecs-sample" ? replace(aws_ecs_task_definition.service.arn, "/:[0-9]+$/", "") : aws_ecs_task_definition.service.arn}"
}
