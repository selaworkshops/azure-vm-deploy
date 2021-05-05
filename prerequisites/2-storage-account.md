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
    --scope "/subscriptions/${YOUR-SUBSCRIPTION}/resourceGroups/jenkins-cicd/providers/Microsoft.Storage/storageAccounts/selaclass1020"
```

- Create the container to store terraform states
```
az storage container create \
    --account-name selaclass1020 \
    --name terraform \
    --auth-mode login
```
