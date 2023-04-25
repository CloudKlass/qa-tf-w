variable "backend_address_pool_name" {
    default = "qalabBackendPool"
}

variable "frontend_port_name" {
    default = "qalabFrontendPort"
}

variable "frontend_ip_configuration_name" {
    default = "qalabAGIPConfig"
}

variable "http_setting_name" {
    default = "qalabHTTPsetting"
}

variable "listener_name" {
    default = "qalabListener"
}

variable "request_routing_rule_name" {
    default = "qalabRoutingRule"
}

variable "redirect_configuration_name" {
    default = "qalabRedirectConfig"
}
