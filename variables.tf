variable "environment" {
  default = "test"
}

variable "infrastructure_type" {
  type = map
  default = {
    "test" = "ubuntu_us_east_1"
    "production" = "conda_deep_learning_us_east_1"
  }
}

variable "remote_provision_script" {
  type = map
  default = {
    "ubuntu_us_east_1" = "ubuntu_us_east_1_provision_script.sh"
    "conda_deep_learning_us_east_1" = "conda_deep_learning_us_east_1_provision_script.sh"
  }
}

variable "amis" {
  type = map
  default = {
    "ubuntu_us_east_1" = "ami-b374d5a5"
    "conda_deep_learning_us_east_1" = "ami-025ed45832b817a35"
  }
}

variable "instances" {
  type = map
  default = {
    "ubuntu_us_east_1" = "t2.micro"
    "conda_deep_learning_us_east_1" = "p2.xlarge"
  }
}

variable "personal_pc_ip" {
  default = "set on command line"
}
