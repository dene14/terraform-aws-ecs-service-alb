variable "region" { default = "us-east-1" }

variable "name" {}

variable "cpu" { default = 10 }

variable "memory" { default = 512 }

variable "memory_reservation" { default = "__NOT_DEFINED__" }

variable "image" { default = "amazon/amazon-ecs-sample" }

variable "vpc_id" {}

variable "environment" {}

variable "log_retention_days" {
    default = "7"
}

variable "cluster_iam_role" {}

variable "cluster_id" {}

variable "port_mappings" {
  type = "list"
  default = [
    { "containerPort" = "80" }
  ]
}

variable "entrypoint" {
  default = ""
}

variable "cmd" {
  type = "list"
  default = []
}

variable "environment_vars" {
  type = "map"
  default = {
    "__NOT_DEFINED__" = "__NOT_DEFINED__"
  }
}

variable "mount_points" {
  type = "list"
  default = [
    {
      "hostPath" = "__NOT_DEFINED__",
      "containerPath" = "__NOT_DEFINED__",
      "readOnly" = "__NOT_DEFINED__"
    },
    {
      "hostPath" = "__NOT_DEFINED__",
      "containerPath" = "__NOT_DEFINED__",
      "readOnly" = "__NOT_DEFINED__"
    },
    {
      "hostPath" = "__NOT_DEFINED__",
      "containerPath" = "__NOT_DEFINED__",
      "readOnly" = "__NOT_DEFINED__"
    }
  ]
}

variable "ulimits" {
  type = "list"
  default = [
    {
      "name" = "__NOT_DEFINED__",
      "softLimit" = "__NOT_DEFINED__",
      "hardLimit" = "__NOT_DEFINED__"
    }
  ]
}

variable "alb_target_group" {
  default = "__NOT_DEFINED__"
}

variable "alb_listener_http" {
  default = "__NOT_DEFINED__"
}

variable "alb_listener_https" {
  default = "__NOT_DEFINED__"
}

variable "alb_listener_priority" {
  default = 0
}

variable "hostnames" {
  type = "list"
  default = []
}

variable "path-pattern" {
  default = "__NOT_DEFINED__"
}

variable "task_definition" {
  default = "__NOT_DEFINED__"
}

variable "task_count" { default = 1 }

variable "health_check_interval" { default = 30 }
variable "health_check_path" { default = "/" }
variable "health_check_port" { default = "traffic-port" }
variable "health_check_protocol" { default = "HTTP" }
variable "health_check_timeout" { default = 5 }
variable "health_check_healthy_threshold" { default = 5 }
variable "health_check_unhealthy_threshold" { default = 2 }
variable "health_check_matcher" { default = 200 }

#variable "add_dns" {
#  default = true
#}

#variable "route53_primary_zone_id" {default = "__NOT_DEFINED__"}

