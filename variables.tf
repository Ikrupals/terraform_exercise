variable "RGName"{
    description = "Resource Group Name"
    nullable = false
}

variable "Location"{
    description = "Location for Resource Group"
    default = "centralindia"
    nullable = false
}

variable "Dev"{
    description = "Deployment for Developer or Production.(True for Dev, False for Production)"
    default = true
    type = bool
}

variable "VNET_name" {
    description = "Name of the Virtual Network"
    type = string
    nullable = false
}

variable "VNET_addrspace" {
    description = "Address space for the Virtual Network"
    nullable = false
}

# variable "DBName" {
#     description = "Database name"
#     type = string
#     nullable = false
# }

# variable "apim_subnet_range" {
#     description = "APIM Subnet Range"
#     nullable = false
# }

# variable "appgw_subnet_range" {
#     description = "APIM Subnet Range"
#     nullable = false
# }

variable "aks_subnet_range" {
    description = "APIM Subnet Range"
    nullable = false
}

variable "k8sClusterName" {
  description = "Kubernetes cluster Name."
  type        = string
  nullable = false
}

# min_node_count and max_node_count should be commented as of now.
# variable "min_node_count" {
#   description = "Node count for Kubernetes cluster."
#   nullable    = true
# }

# variable "max_node_count" {
#   description = "Node count for Kubernetes cluster."
#   nullable    = true
# }

variable "aks_cidr" {
    description = "CIDR for PODs inside AKS"
    nullable = false
}

# variable "APIM_Name" {
#     description = "API Management Service Name"
#     nullable = false
# }

# variable "pub_name_apim" {
#     description = "API Management Service Publisher Name"
#     nullable = false
# }

# variable "pub_mail_apim" {
#     description = "API Management Service Publisher Email"
#     nullable = false
# }

# variable "apim_network_type" {
#     description = "APIM Network Type (Internal/ External)"
#     nullable = false
# }

# variable "publicip_gw_allocation" {
#   description = "Allocation for public IP gateway (Static/ Dynamic)"
#   nullable = false
# }

# variable "gw_capacity" {
#     description = "Gateway capacity count"
#     nullable = false
# }

# variable "db_name" {
#     description = "Postgres Flexible DB Name"
#     nullable = false
# }

# variable "db_subnet_range" {
#     description = "DB subnet IP"
#     nullable = false
# }

# variable "api_name"{
#     description = "Name of API to be created"
#     nullable = false
# }

# variable "db_zones_dev" {
#     description = "Zones for DB"
#     nullable = false
# }

# variable "db_zones_prod" {
#     description = "Zones for DB"
#     nullable = false
# }

# variable "db_admin_id" {
#     description = "Admin Login ID for DB"
#     nullable = false
#     sensitive = true
# }

# variable "db_admin_pass" {
#     description = "Admin Password for DB"
#     nullable = false
#     sensitive = true
# }
