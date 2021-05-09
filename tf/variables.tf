variable "region" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnets" {
  type = list(string)
}
variable "cluster_name" {
}
