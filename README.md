## Deploying Azure Virtual Machines with Terraform

![Azure](https://img.shields.io/badge/azure-%230072C6.svg?logo=microsoft-azure&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?logo=terraform&logoColor=white)

This repository provides a Terraform solution for deploying a Linux virtual machine and its networking resources on Microsoft Azure, following infrastructure-as-code best practices.

## Key Features

- **Comprehensive Network Setup**:
  - Virtual Network (VNet) and Subnet
  - Network Security Group (NSG) with rules
  - Route Table with default route
  - Public IP allocation
- **Virtual Machine Deployment**:
  - Linux VM with SSH access
  - Supports password or SSH key authentication
  - Adjustable VM sizing
- **Best Practice Implementation**:
  - Modular code structure
  - Configurable variables
  - Secure handling of sensitive data
  - Resource tagging for management
  - Output values for integration

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) version 1.0.0 or higher
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Azure subscription with credentials (run `az login` and ensure proper permissions)

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-repo/azure-vm-terraform.git
   cd azure-vm-terraform
   ```
2. **Initialize Terraform**
   ```bash
   terraform init
   ```
3. **Review the execution plan**
   ```bash
   terraform plan
   ```
4. **Apply the configuration**
   ```bash
   terraform apply
   ```
5. **Destroy the infrastructure when no longer needed**
   ```bash
   terraform destroy
   ```

## Configuration

Customize your deployment by modifying the variables in `terraform.tfvars` or by using command-line flags during the Terraform commands.

### Example `terraform.tfvars`
```hcl
resource_group_name = "prod-vm-cluster"
location           = "westeurope"
vm_size            = "Standard_D2s_v3"
admin_username     = "adminuser"
tags = {
  Environment = "Production"
  Team        = "DevOps"
}
```

## Directory Structure
```
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
```

## Variables

| Name                      | Description                     | Default                     | Required |
|---------------------------|---------------------------------|-----------------------------|----------|
| `resource_group_name`     | Resource group name             | `"rg-vm-example"`           | No       |
| `location`                | Azure region                   | `"eastus"`                  | No       |
| `tags`                    | Resource tags                   | `{Environment = Dev}`      | No       |
| `vnet_address_space`      | VNet address space              | `["10.0.0.0/16"]`          | No       |
| `subnet_address_prefixes` | Subnet address prefixes          | `["10.0.1.0/24"]`          | No       |
| `admin_username`         | VM admin username                | `"adminuser"`              | No       |
| `admin_password`         | VM admin password                | `null`                     | No       |
| `ssh_public_keys`        | List of SSH public keys         | `[]`                        | No       |
| `vm_size`                 | VM instance size                | `"Standard_B1s"`           | No       |

## Outputs

- `vm_id`: ID of the created virtual machine
- `vm_public_ip`: Public IP address of the VM
- `vm_private_ip`: Private IP address of the VM

## Contributing

We welcome contributions! Please follow these steps:

1. Fork the project
2. Create your feature branch: `git checkout -b feature/AmazingFeature`
3. Commit your changes: `git commit -m 'Add some AmazingFeature'`
4. Push to the branch: `git push origin feature/AmazingFeature`
5. Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Important Notes

- **Security**: Never commit sensitive information to version control.
- **Authentication**: It is recommended to use SSH keys instead of passwords.
- **Cost Management**: Monitor your Azure resources to avoid unexpected charges.

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

