variable "username" {}

variable "password" {}

variable "user_tags" {
  type    = list(string)
  default = []
}

variable "permissions" {
  type = map(object({
    configure = string
    write     = string
    read      = string
  }))
  default = {
    "/" = {
      configure = ".*"
      write     = ".*"
      read      = ".*"
    }
  }
}