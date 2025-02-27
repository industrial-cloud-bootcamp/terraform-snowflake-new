terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.35"
    }
  }
}

provider "snowflake" {
  role  = "SYSADMIN"
}

#DATABASE CREATION
resource "snowflake_database" "db" {
  name     = "TF_DEMO"
}

#WAREHOUSE CREATION
resource "snowflake_warehouse" "warehouse" {
  for_each = var.warehouses
  name           = each.value
  warehouse_size = "xsmall"
  min_cluster_count = 1
  max_cluster_count = 10
  auto_suspend = 60
}
