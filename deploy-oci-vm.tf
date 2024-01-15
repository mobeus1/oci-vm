``hcl
terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 4.35.0"
    }
  }
}

provider "oci" {
  tenancy_ocid     = "YOUR_TENANCY_OCID"
  user_ocid        = "YOUR_USER_OCID"
  fingerprint      = "YOUR_API_KEY_FINGERPRINT"
  private_key_path = "PATH_TO_PRIVATE_KEY"
  region           = "YOUR_REGION"
}

resource "oci_core_instance" "example" {
  availability_domain = "YOUR_AVAILABILITY_DOMAIN"
  compartment_id      = "YOUR_COMPARTMENT_OCID"
  display_name        = "example-instance"
  shape               = "VM.Standard2.1"
  image_id            = "YOUR_ORACLE_LINUX_IMAGE_OCID"

  metadata {
    ssh_authorized_keys = "YOUR_SSH_PUBLIC_KEY"
  }

  create_vnic_details {
    subnet_id = "YOUR_SUBNET_OCID"
  }
}
```

Make sure to replace the placeholders with your own values:

- `YOUR_TENANCY_OCID`: The OCID (Oracle Cloud Identifier) of your tenancy.
- `YOUR_USER_OCID`: The OCID of your user.
- `YOUR_API_KEY_FINGERPRINT`: The fingerprint of your API key.
- `PATH_TO_PRIVATE_KEY`: The local path to your private key file.
- `YOUR_REGION`: The Oracle Cloud region where you want to deploy the VM (e.g., `us-ashburn-1`).
- `YOUR_AVAILABILITY_DOMAIN`: The availability domain where you want to deploy the VM (e.g., `AD-1`).
- `YOUR_COMPARTMENT_OCID`: The OCID of the compartment where you want to create the VM.
- `YOUR_ORACLE_LINUX_IMAGE_OCID`: The OCID of the Oracle Linux image.
- `YOUR_SSH_PUBLIC_KEY`: The public key for SSH access to the VM.

Save the script to a file with a `.tf` extension (e.g., `deploy_vm.tf`), and then run the following commands in the same directory:

1. Initialize Terraform: `terraform init`
2. Preview the changes: `terraform plan`
3. Deploy the VM: `terraform apply`

Terraform will create the Oracle Linux VM based on the provided configuration.