variable "infra_env" {
  type        = string
  description = "infrastructure environment"
}

variable "instance_size" {
  type        = string
  description = "The size of the instance"
  default     = "t3.small"
}

variable "instance_ami" {
  type        = string
  description = "server image use"
}

variable "instance_root_device_size" {
  type        = string
  description = "Root device size in GB"
  default     = 12
}
