# Import Google Cloud resources into Terraform state 

1. Terraform can import existing infrastructure. This allows to take resources created by some other means and bring them under Terraform management.
2. We can import the state for any Google Cloud resource.
3. Terraform supports multiple ways to import resources:
   A. One at a time by using the terraform import subcommand.
   B. In bulk by including an import block in the configuration (requires Terraform version 1.5 or later).
   C. In bulk by using a Google Cloud feature that lets you import resources after doing a bulk export.

## Import resources(in our case vm) one at a time
Step1 : Create a empty main.tf and key.json
step2: Add your default service account key in key.json.
step3: paste below code in main.tf
provider "google" {
  credentials = file("key.json")
  project     = "project_id"
  zone = "zone_details"
}

resource "google_compute_instance" "instance_name" {
  
  }

  Step4 : Execute below command in terminal
  terraform import google_compute_instance.instance_name instance_id
step5: After execution of this command a state file generate
step6 : add same configuration in main.tf refer main.tf
step7: when you execute plan command no any changes should be detected by terraform plan. it means we have successfully imported our vm.





