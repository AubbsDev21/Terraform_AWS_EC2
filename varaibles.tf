variable "profile" {
  type    = string
  default = "default"
}

variable "main-region" {
  type    = string
  default = "us-east-2"
}

variable "worker-region" {
  type    = string
  default = "us-west-2"
}

variable "external_ip" {
  type    = string
  default = "0.0.0.0/0"
}

variable "infra_env" {
  type        = string
  description = "This is the enviornment"
}
