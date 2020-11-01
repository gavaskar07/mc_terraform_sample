terraform {
  required_providers {
    alicloud = {
      source = "hashicorp/alicloud"
      version = "1.93.0"
    }
  }
}

resource "alicloud_vpc" "vpc" {
  name       = "tf_webinar_infra"
  cidr_block = "10.0.0.0/16"
}

resource "alicloud_vswitch" "vsw-web" {
  name              = "subnet-web"
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-southeast-1a"
}

resource "alicloud_vswitch" "subnet-app" {
  name              = "subnet-app"
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-southeast-1a"
}

resource "alicloud_vswitch" "subnet-db" {
  name              = "subnet-db"
  vpc_id            = alicloud_vpc.vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-southeast-1a"
}
