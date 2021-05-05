# Create a Storage Account
---

- Create a general-purpose storage account
```
az storage account create \
    --name selaclass1020 \
    --resource-group jenkins-cicd \
    --location westeurope \
    --sku Standard_ZRS \
    --encryption-services blob
```

- Before you create the container, assign the Storage Blob Data Contributor role to yourself (even if you are the account owner, you need explicit permissions to perform data operations against the storage account)
```
az ad signed-in-user show --query objectId -o tsv | az role assignment create \
    --role "Storage Blob Data Contributor" \
    --assignee @- \
    --scope "/subscriptions/${YOUR_SUBSCRIPTION_ID}/resourceGroups/jenkins-cicd/providers/Microsoft.Storage/storageAccounts/selaclass1020"
```

- Create the container to store terraform states
```
az storage container create \
    --account-name selaclass1020 \
    --name terraform \
    --auth-mode login
```

- Retrive the storage account access key
```
az storage account keys list \
  --resource-group jenkins-cicd \
  --account-name selaclass1020 \
  --query [0].value
```

- Create a environment variable to store the backend storage account access key for terraform
```
export ARM_ACCESS_KEY=${storage-account-access-key}
```