# Azure VM Deployment with Terraform

![Azure](https://img.shields.io/badge/azure-%230072C6.svg?logo=microsoft-azure&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?logo=terraform&logoColor=white)

This Terraform project deploys a virtual machine in Microsoft Azure with associated networking components following infrastructure-as-code best practices.

## Features

- **Complete Network Infrastructure**:
  - Virtual Network (VNet) with Subnet
  - Network Security Group (NSG) with rules
  - Route Table with default route
  - Public IP Address
- **Virtual Machine**:
  - Linux VM with SSH access
  - Configurable authentication (password/SSH keys)
  - Customizable VM size
- **Best Practices**:
  - Modular architecture
  - Configurable variables
  - Sensitive data handling
  - Resource tagging
  - Outputs for integration

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) (>= 1.0.0)
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Azure subscription credentials
  - `az login` configured with proper permissions

## Usage

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-repo/azure-vm-terraform.git
   cd azure-vm-terraform
Initialize Terraform

bash
terraform init
Review execution plan

bash
terraform plan
Apply configuration

bash
terraform apply
Destroy infrastructure

bash
terraform destroy
Configuration
Customize deployment by modifying variables in terraform.tfvars or using command-line flags:

terraform
# Example terraform.tfvars
resource_group_name = "prod-vm-cluster"
location           = "westeurope"
vm_size            = "Standard_D2s_v3"
admin_username     = "adminuser"
tags = {
  Environment = "Production"
  Team        = "DevOps"
}
Directory Structure
terraform/
├── main.tf             # Root module configuration
├── variables.tf        # Input variables
├── outputs.tf          # Output values
├── versions.tf         # Terraform version constraints
└── modules/
    ├── network/        # Networking components module
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── vm/            # Virtual Machine module
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
Variables
Name	Description	Default	Required
resource_group_name	Resource group name	"rg-vm-example"	No
location	Azure region	"eastus"	No
tags	Resource tags	{Environment = Dev}	No
vnet_address_space	VNet address space	["10.0.0.0/16"]	No
subnet_address_prefixes	Subnet address prefixes	["10.0.1.0/24"]	No
admin_username	VM admin username	"adminuser"	No
admin_password	VM admin password	null	No
ssh_public_keys	List of SSH public keys	[]	No
vm_size	VM instance size	"Standard_B1s"	No
Outputs
vm_id: ID of the created virtual machine

vm_public_ip: Public IP address of the VM

vm_private_ip: Private IP address of the VM

Contributing
Fork the project

Create your feature branch (git checkout -b feature/AmazingFeature)

Commit your changes (git commit -m 'Add some AmazingFeature')

Push to the branch (git push origin feature/AmazingFeature)

Open a Pull Request

License
Distributed under the MIT License. See LICENSE for more information.

Important Notes
Security: Never commit sensitive information to version control

Authentication: Recommended to use SSH keys instead of passwords

Cost: Monitor your Azure resources to avoid unexpected charges


This README includes:
- Badges for quick visual identification
- Clear prerequisites and usage instructions
- Configuration guidance
- Directory structure visualization
- Variable reference table
- Output documentation
- Contribution guidelines
- License information
- Important security and cost considerations

 terraform apply -var="admin_password=African2025!"  # If using password auth