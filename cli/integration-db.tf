# Export Terraform variable values to an Ansible var_file
resource "local_file" "db_ansible_sapnwdb-vars" {
  depends_on = [ module.db-vsi ]
  content = <<-DOC
---
#Ansible vars_file containing variable values passed from Terraform.
#Generated by "terraform plan&apply" command.

#SAP system configuration
sap_sid: "${var.sap_sid}"
sap_host: "${module.app-vsi.PRIVATE-IP}"
sap_hostname: "${var.APP-HOSTNAME}"
sap_ascs_instance_number: "${var.sap_ascs_instance_number}"
sap_master_password: "${var.sap_master_password}"

#SAP Installation kit path
kit_sapcar_file: "${var.kit_sapcar_file}"
kit_swpm_file: "${var.kit_swpm_file}"
kit_sapexe_file: "${var.kit_sapexe_file}"
kit_sapexedb_file: "${var.kit_sapexedb_file}"
kit_saphotagent_file: "${var.kit_saphotagent_file}"
kit_export_dir: "${var.kit_export_dir}"
kit_db2_dir: "${var.kit_db2_dir}"
kit_db2client_dir: "${var.kit_db2client_dir}"
...
    DOC
  filename = "ansible/sapnwdb-vars.yml"
}