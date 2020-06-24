provider "azurerm" {
features {}
}


resource "azurerm_resource_group" "test" {
  name     = "AZureDevops-POC"
  location = "East US"
}


resource "azurerm_availability_set" "AVL1" {
  name                = "TI-PROD-SEC-API-AVAILSET"
  resource_group_name = "AZureDevops-POC"
  location            = "East US"
  platform_fault_domain_count = "2"
  platform_update_domain_count = "5"
  tags = {
    environment = "Visual Cargo Prod - Secondary"	
  }
}

resource "azurerm_availability_set" "AVL2" {
  name                = "TI-PROD-SEC-APP-AVAILSET"
  resource_group_name = "AZureDevops-POC"
  location            = "East US"
  platform_fault_domain_count = "2"
  platform_update_domain_count = "5"
  tags = {
    environment = "Visual Cargo Prod - Secondary"	
  }
}

resource "azurerm_availability_set" "AVL3" {
  name                = "TI-PROD-SEC-COMM-AVAILSET"
  resource_group_name = "AZureDevops-POC"
  location            = "East US"
  platform_fault_domain_count = "2"
  platform_update_domain_count = "5"
  tags = {
    environment = "Visual Cargo Prod - Secondary"	
  }
}

resource "azurerm_availability_set" "AVL4" {
  name                = "TI-PROD-SEC-FTP-AVAILSET"
  resource_group_name = "AZureDevops-POC"
  location            = "East US"
  platform_fault_domain_count = "2"
  platform_update_domain_count = "5"
  tags = {
    environment = "Visual Cargo Prod - Secondary"	
  }
}

resource "azurerm_availability_set" "AVL5" {
  name                = "TI-PROD-SEC-INT-AVAILSET"
  resource_group_name = "AZureDevops-POC"
  location            = "East US"
  platform_fault_domain_count = "2"
  platform_update_domain_count = "5"
  tags = {
    environment = "Visual Cargo Prod - Secondary"	
  }
}

resource "azurerm_availability_set" "AVL6" {
  name                = "TI-PROD-SEC-WEB-AVAILSET"
  resource_group_name = "AZureDevops-POC"
  location            = "East US"
  platform_fault_domain_count = "2"
  platform_update_domain_count = "5"
  tags = {
    environment = "Visual Cargo Prod - Secondary"	
  }
}


resource "azurerm_network_security_group" "test1" {
  name                = "TISEC-SOUTH-API-NSG"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  tags = {
    environment = "Visual Cargo Prod - Secondary"	
  }
}

resource "azurerm_network_security_group" "test2" {
  name                = "TISEC-SOUTH-APP-NSG"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  tags = {
    environment = "Visual Cargo Prod - Secondary"	
  }
}

resource "azurerm_network_security_group" "test3" {
  name                = "TISEC-SOUTH-COMM-NSG"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  tags = {
    environment = "Visual Cargo Prod - Secondary"	
  }
}

resource "azurerm_network_security_group" "test4" {
  name                = "TISEC-SOUTH-FTP-NSG"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  tags = {
    environment = "Visual Cargo Prod - Secondary"	
  }
}

resource "azurerm_network_security_group" "test5" {
  name                = "TISEC-SOUTH-INT-NSG"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  tags = {
    environment = "Visual Cargo Prod - Secondary"	
  }
}

resource "azurerm_network_security_group" "test6" {
  name                = "TISEC-SOUTH-WEB-NSG"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  tags = {
    environment = "Visual Cargo Prod - Secondary"	
  }
}


resource "azurerm_virtual_network" "test" {
  name                = "TI-PROD-SEC-SOUTH-VNET"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  address_space       = ["10.88.4.0/24"]
  
  subnet {
    name           = "TI-PROD-SEC-API-SNET"
    address_prefix = "10.88.4.80/28"
    security_group = "${azurerm_network_security_group.test1.id}"
  }

  subnet {
    name           = "TI-PROD-SEC-APP-SNET"
    address_prefix = "10.88.4.64/28"
    security_group = "${azurerm_network_security_group.test2.id}"
  }

  subnet {
    name           = "TI-PROD-SEC-COMM-SNET"
    address_prefix = "10.88.4.16/28"
    security_group = "${azurerm_network_security_group.test3.id}"
  }

  subnet {
    name           = "TI-PROD-SEC-FTP-SNET"
    address_prefix = "10.88.4.32/28"
    security_group = "${azurerm_network_security_group.test4.id}"
  }

  subnet {
    name           = "TI-PROD-SEC-INT-SNET"
    address_prefix = "10.88.4.48/28"
    security_group = "${azurerm_network_security_group.test5.id}"
  }

  subnet {
    name           = "TI-PROD-SEC-WEB-SNET"
    address_prefix = "10.88.4.0/28"
    security_group = "${azurerm_network_security_group.test6.id}"
  }
  
    subnet {
    name           = "TI-PROD-SEC-DMS-SNET"
    address_prefix = "10.88.4.112/28"
    security_group = "${azurerm_network_security_group.test6.id}"
  }

    subnet {
    name           = "TI-PROD-SEC-SQL-SNET"
    address_prefix = "10.88.4.192/26"
    security_group = "${azurerm_network_security_group.test6.id}"
  }
  tags = {
    environment = "Visual Cargo Prod - Secondary"	
  }
}
