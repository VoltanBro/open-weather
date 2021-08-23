variable "instance_name" {
  description = "Instance for rails server"
  type        = string
  default     = "rails_server"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "open_weather"
}

variable "environment" {
  description = "environment"
  type        = string
  default     = "develop"
}
