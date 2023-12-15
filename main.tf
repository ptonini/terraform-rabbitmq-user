resource "rabbitmq_user" "this" {
  provider = rabbitmq
  name     = var.username
  password = var.password
  tags     = var.user_tags
}

resource "rabbitmq_permissions" "this" {
  for_each = var.permissions
  user     = rabbitmq_user.this.name
  vhost    = each.key
  permissions {
    configure = each.value.configure
    write     = each.value.write
    read      = each.value.read
  }
}