variable "resource_group_name" {
  description = "The name of the resource group where the public IP will be created"
  type        = string
  
}

variable "pip_name" {
  description = "The name of the public IP"
  type        = string

}
variable "resource_group_location" {
  description = "The location of the resource group where the public IP will be created"
  type        = string
}

variable "allocation_method" {
  description = "The allocation method for the public IP (Static or Dynamic)"
  type        = string

}
