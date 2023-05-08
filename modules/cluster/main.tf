data "databricks_node_type" "smallest" {
  local_disk = true
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}

resource "databricks_instance_pool" "smallest_nodes" {
  instance_pool_name = "Smallest Nodes"
  min_idle_instances = 0
  max_capacity       = 300
  node_type_id       = data.databricks_node_type.smallest.id
  azure_attributes {
    availability                      = "ON_DEMAND_AZURE"
    spot_bid_max_price                = "100"
  }
  idle_instance_autotermination_minutes = 10
}

resource "databricks_cluster" "shared_autoscaling" {
  cluster_name            = "Shared Autoscaling"
  num_workers             = 2
  spark_version           = data.databricks_spark_version.latest_lts.id
  instance_pool_id        = databricks_instance_pool.smallest_nodes.id
}