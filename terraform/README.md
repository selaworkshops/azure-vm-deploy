# Description

This terraform template create the following resources:

- Resource Group
- Virtual Network
- Subnet
- Public IP
- Network Interface
- Virtual Machine

# Prerequisites

- Create the file "terraform.tfvars.json" with the following content:
```
{
	"SUBSCRIPTION_ID": "${YOUR_SUBSCRIPTION_ID}",
    "SP_CLIENT_ID": "${SERVICE_PRINCIPAL_appId}",
	"SP_CLIENT_SECRET": "${SERVICE_PRINCIPAL_password}",
	"SP_TENANT_ID": "${SERVICE_PRINCIPAL_tenant}",
    "STUDENT_NAME": "${your-name}",
    "AZURE_LOCATION": "westeurope",
    "VNET_ADDRESS_SPACE": "${assigned_vnet_address_space}",
    "SUBNET_ADDRESS_PREFIX": "${assigned_subnet_address_prefix}",
    "VM_ADMIN_PASSWORD": "!QAZ2wsx3edc"
}
```

- Create a environment variable to store the backend storage account access key
```
export ARM_ACCESS_KEY=${storage-account-access-key}
```

- Update the backend blob key with your name instead of the placeholder
```
from:
key = "${YOURNAME-YOURLASTNAME}/infrastructure.tfstate"

to:
key = "examplename-examplelastname/infrastructure.tfstate"
```

# Provisioning

- Download providers
```
terraform init
```

- Inspect changes
```
terraform plan
```

- Provision Environment
```
terraform apply
```

# Cleanup

- Delete resources
```
terraform destroy
```