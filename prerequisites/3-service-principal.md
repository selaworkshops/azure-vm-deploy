# Create Service Principal

- Create a service principal with owner permissions
```
az ad sp create-for-rbac -n "Terraform" --role Owner --scopes /subscriptions/${YOUR_SUBSCRIPTION_ID}
```

- The service principal details will be used to create the file "terraform.tfvars.json" (store the command output in a safe place, the details can be retrieved later)