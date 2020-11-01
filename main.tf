terraform {
  required_providers {
    alicloud = {
      source = "hashicorp/alicloud"
      version = "1.93.0"
    }
  }
}

resource "alicloud_vpc" "multicloud_vpc" {
  name       = "multicloud_vpc"
  cidr_block = "10.0.0.0/16"
}

resource "alicloud_vswitch" "mc-webapp" {
  name              = "Mc_Subnet_webapp"
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-southeast-1a"
}

resource "alicloud_vswitch" "mc_mobileapp" {
  name              = "Mc_Subnet_mobileapp"
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-southeast-1a"
}

resource "alicloud_vswitch" "mc_db" {
  name              = "Mc_Subnet_Db"
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-southeast-1a"
}
