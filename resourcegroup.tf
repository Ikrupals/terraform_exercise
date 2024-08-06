resource "azurerm_resource_group" "iotrg" {
    name = "${var.Dev ? "${var.RGName}-dev" : "${var.RGName}-prod" }"
    location = var.Location
  
}