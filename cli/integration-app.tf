# Export Terraform variable values to an Ansible var_file
resource "local_file" "app_ansible_sapnwapp-vars" {
  depends_on = [ module.db-vsi ]
  content = <<-DOC
---
#Ansible vars_file containing variable values passed from Terraform.
#Generated by "terraform plan&apply" command.

#SAP system configuration
sap_sid: "${var.sap_sid}"
sap_ascs_instance_number: "${var.sap_ascs_instance_number}"
sap_ci_instance_number: "${var.sap_ci_instance_number}"
sap_main_password: "${var.sap_main_password}"
db_host: "${module.db-vsi.PRIVATE-IP}"
db_hostname: "${var.DB-HOSTNAME}"
sap_profile: "${var.APP-PROFILE}"
...
    DOC
  filename = "ansible/sapnwapp-vars.yml"
}
