module "sqlfw" {
  source = #"path to module in registry/sqlfirewall"
  version = #"version-number-of-module.7"

  for_each                  = var.sql_fwrules
  az_sql_firewall_rule_name = each.key
  az_sql_firewall_sqlserver_id = module.az_sql.sqlsrvr_id
  az_sql_firewall_rule_start_ip = each.value.start_ip
  az_sql_firewall_rule_end_ip = each.value.end_ip


}