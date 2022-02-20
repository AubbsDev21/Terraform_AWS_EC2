variable "profile" {
  type    = string
  default = "default"
}

variable "main-region" {
  type    = string
  default = "us-east-2"
}


variable "external_ip" {
  type    = string
  default = "0.0.0.0/0"
}

variable "infra_env" {
  type        = string
  description = "This is the enviornment"
}

variable "instance_size" {
  type        = string
  description = "the default size of ec2"
  default     = "t3.small"
}
