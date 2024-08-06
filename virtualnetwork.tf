# Virtual Network
resource "azurerm_virtual_network" "iot_vnet" {
    name = var.VNET_name
    location = azurerm_resource_group.iotrg.location
    resource_group_name = azurerm_resource_group.iotrg.name
    address_space = var.VNET_addrspace
  
}

# IoT Network Security Group
# resource "azurerm_network_security_group" "apim_subnet_nsg" {
#   name = "${var.VNET_name}-apim-nsg"
#   location            = azurerm_resource_group.iotrg.location
#   resource_group_name = azurerm_resource_group.iotrg.name
  

#   security_rule {
#     name                       = "ssh"
#     priority                   = 1001
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "*"
#     source_port_range          = "*"
#     destination_port_ranges     = ["443","80"]
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
#   security_rule {
#     name                       = "ApiManagement_1"
#     priority                   = 1000
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_ranges     = ["3000","3443"]
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }

# resource "azurerm_network_security_group" "db_subnet_nsg" {
#   name                = "${var.RGName}-db-nsg"
#   location            = azurerm_resource_group.iotrg.location
#   resource_group_name = azurerm_resource_group.iotrg.name

#   security_rule {
#     name                       = "DB_Rules"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }


resource "azurerm_network_security_group" "aks_subnet_nsg" {
  name = "${var.VNET_name}-aks-nsg"
  location            = azurerm_resource_group.iotrg.location
  resource_group_name = azurerm_resource_group.iotrg.name
}


# AKS subnet
resource "azurerm_subnet" "aks_subnet" {
  name                 = "${var.RGName}-aks-subnet"
  resource_group_name  = azurerm_resource_group.iotrg.name
  virtual_network_name = azurerm_virtual_network.iot_vnet.name
  address_prefixes     = var.aks_subnet_range
}


# Application Gateway subnet
# resource "azurerm_subnet" "appgw_subnet" {
#   name                 = "${var.RGName}-appgw-subnet"
#   resource_group_name  = azurerm_resource_group.iotrg.name
#   virtual_network_name = azurerm_virtual_network.iot_vnet.name
#   address_prefixes     = var.appgw_subnet_range

# }

# API Management Subnet
# resource "azurerm_subnet" "apim_subnet" {
#   name                 = "${var.RGName}-apim-subnet"
#   resource_group_name  = azurerm_resource_group.iotrg.name
#   virtual_network_name = azurerm_virtual_network.iot_vnet.name
#   address_prefixes     = var.apim_subnet_range
# }

# Database Subent
# resource "azurerm_subnet" "db_subnet" {
#   name                 = "${var.RGName}-db-subnet"
#   resource_group_name  = azurerm_resource_group.iotrg.name
#   virtual_network_name = azurerm_virtual_network.iot_vnet.name
#   address_prefixes     = var.db_subnet_range
#   service_endpoints    = ["Microsoft.Storage"]

#   delegation {
#     name = "fs"

#     service_delegation {
#       name = "Microsoft.DBforPostgreSQL/flexibleServers"

#       actions = [
#         "Microsoft.Network/virtualNetworks/subnets/join/action",
#       ]
#     }
#   }
# }

# AKS subnet NSG association
resource "azurerm_subnet_network_security_group_association" "aks_nsg_asso" {
  subnet_id                 = azurerm_subnet.aks_subnet.id
  network_security_group_id = azurerm_network_security_group.aks_subnet_nsg.id
}

# APIM subnet NSG association
# resource "azurerm_subnet_network_security_group_association" "apim_nsg_asso" {
#   subnet_id                 = azurerm_subnet.apim_subnet.id
#   network_security_group_id = azurerm_network_security_group.apim_subnet_nsg.id
# }

# resource "azurerm_subnet_network_security_group_association" "db_nsg_asso" {
#   subnet_id                 = azurerm_subnet.db_subnet.id
#   network_security_group_id = azurerm_network_security_group.db_subnet_nsg.id
# }

# resource "azurerm_private_dns_zone" "iot_db_dns" {
#   name                = "${var.db_name}-pdz.postgres.database.azure.com"
#   resource_group_name = azurerm_resource_group.iotrg.name

#   depends_on = [azurerm_subnet_network_security_group_association.apim_nsg_asso]
# }