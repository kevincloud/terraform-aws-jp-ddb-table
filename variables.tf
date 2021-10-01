variable "name" {
    type = string
}

variable "tags" {
    type = map(string)
    default = {}
}

variable "hash_key" {
    type = string
    default = null
}

variable "range_key" {
    type = string
    default = null
}

variable "read_capacity" {
    type = number
    default = 20
}

variable "write_capacity" {
    type = number
    default = 20
}

variable "billing_mode" {
    type = string
    default = "PROVISIONED"
}

variable "attributes" {
    type = list(map(string))
    default = []
}

variable "global_secondary_indexes" {
    type = list(map(string))
    default = []
}

